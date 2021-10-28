package com.sist.controller;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sist.dto.MemberDTO;
import com.sist.role.MessageMethod;
import com.sist.service.MemberService;
import com.sist.utils.ValidUtils;

@Controller
@RequestMapping("/member")
public class MemberController extends BasicController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/login.do")
	public String login(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String referrer = request.getHeader("Referer");
		if (referrer != null && !referrer.contains("/member/login") && !referrer.contains("/member/signup")
				&& !referrer.contains("/member/findPassword")) {
			session.setAttribute("prevPage", referrer);
		}
		String loginFailMsg = (String) session.getAttribute("loginFailMsg");
		if (loginFailMsg != null) {
			session.removeAttribute("loginFailMsg");
			model.addAttribute("loginFailMsg", loginFailMsg);
		}

	   model.addAttribute("main_jsp", "/member/login.jsp");
	   return "main/main";
	}

	@GetMapping("/findPassword.do")
	public String findPassword(Model model) {

	   model.addAttribute("main_jsp", "/member/findPassword.jsp");
	   return "main/main";
	}

	@GetMapping("/signup.do")
	public String singup(@ModelAttribute final MemberDTO memberDTO, Model model) {

	   model.addAttribute("main_jsp", "/member/signup.jsp");
	   return "main/main";
	}

	@GetMapping("/denied.do")
	public String denied(Model model) {

	   model.addAttribute("main_jsp", "/member/denied.jsp");
	   return "main/main";
	}

	@GetMapping("/info.do")
	public String info(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return messageRedirect("세션 유지시간이 지났습니다.", "/member/logout", MessageMethod.post, null, redirectAttributes);
		}
		MemberDTO memberDTO = memberService.searchMember((Integer) session.getAttribute("memberIdx"));
		model.addAttribute("memberDTO", memberDTO);

	   model.addAttribute("main_jsp", "/member/info.jsp");
	   return "main/main";
	}

	@PostMapping("/signup.do")
	public String signup(final MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
		if (memberService.signup(memberDTO))
			return messageRedirect("회원가입을 성공하셨습니다.", "/member/login.do", MessageMethod.get, null, redirectAttributes);
		else
			return messageRedirect("회원가입을 실패하셨습니다.", "/member/signup.do", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/update.do")
	public String update(final MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
		boolean check;
		if(memberDTO.getPassword().isEmpty()) {
			check = memberService.update(memberDTO);
		}else {
			check = memberService.updateAll(memberDTO);
		}
		if (check)
			return messageRedirect("계정정보를 변경하였습니다.", "/", MessageMethod.get, null, redirectAttributes);
		else
			return messageRedirect("계정정보 변경을 실패하였습니다.", "/", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/delete.do")
	public String delete(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
		HttpSession session = request.getSession(false);
		if (session == null) {
			return messageRedirect("세션 유지시간이 지났습니다.", "/member/logout", MessageMethod.post, null, redirectAttributes);
		}
		if (memberService.delete((Integer) session.getAttribute("memberIdx")))
			return messageRedirect("/member/logout", MessageMethod.post, null, model);
		else
			return messageRedirect("탈퇴를 실패하셨습니다.", "/", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/checkValidation.do")
	@ResponseBody
	public Map<String, String> checkValidation(String updateCheck, @Valid final MemberDTO memberDTO, Errors errors) {
		Map<String, String> validatorResult = ValidUtils.validateHandling(errors);
		if(updateCheck != null) {
			if(memberDTO.getPassword().isEmpty()) {
				validatorResult.remove("valid_password");
			}
		}

		return validatorResult;
	}

	@PostMapping("/checkEmailDuplicate/{email}/exists.do")
	@ResponseBody
	public Boolean checkEmailDuplicate(@PathVariable String email) {
		boolean check = memberService.checkEmailDuplicate(email);

		return check;
	}

	@PostMapping("/passwordReset.do")
	@ResponseBody
	public String passwordReset(@RequestParam(value = "email", required = false) String email) {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();
		for (int i = 0; i < 8; i++) {
			sb.append((char) ((int) (random.nextInt(26)) + 97));
		}
		sb.append("@");
		String password = sb.toString();

		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setEmail(email);
		memberService.updatePassword(memberDTO);

		return password;
	}
}