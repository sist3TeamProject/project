package com.sist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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

import com.sist.dto.ReservationDTO;
import com.sist.dto.MemberDTO;
import com.sist.role.MemberRole;
import com.sist.role.MessageMethod;
import com.sist.service.MemberService;
import com.sist.service.ReservationService;
import com.sist.utils.ValidUtils;

@Controller
@RequestMapping("/member")
public class MemberController extends BasicController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private ReservationService reservationService;

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
	public String info(@RequestParam(value = "type", required = false) Integer type, HttpSession session,
			Authentication authentication, Model model) {
		if (type == null) {
			type = 0;
		}
		String path;
		switch (type) {
		case 1:
		case 2:
			path = "/member/info/reservation.jsp";
			model.addAttribute("type", type);
			List<ReservationDTO> reservationList;
			Map<String, Object> reservationMap = new HashMap<String, Object>();
			if (type == 1) {
				reservationMap.put("targetType", "hospital");
			} else {
				reservationMap.put("targetType", "corona");
			}
			String authorities = "";
			if (authentication != null && authentication.isAuthenticated()) {
				authorities = ((List<?>) authentication.getAuthorities()).get(0).toString();
			}
			if (authorities.equals(MemberRole.ADMIN.getValue())) {
				reservationList = reservationService.searchReservationAdmin(reservationMap);
			} else {
				reservationMap.put("memberIdx", (Integer) session.getAttribute("memberIdx"));
				reservationList = reservationService.searchReservation(reservationMap);
			}
			model.addAttribute("reservationList", reservationList);
			break;
		default:
			path = "/member/info/basic.jsp";
			type = 0;
			MemberDTO memberDTO = memberService.selectMember((Integer) session.getAttribute("memberIdx"));
			model.addAttribute("memberDTO", memberDTO);
			String[] phoneNumber = new String[3];
			switch (memberDTO.getPhoneNumber().length()) {
			case 9: {
				phoneNumber[0] = memberDTO.getPhoneNumber().substring(0, 2);
				phoneNumber[1] = memberDTO.getPhoneNumber().substring(2, 5);
				phoneNumber[2] = memberDTO.getPhoneNumber().substring(5, 9);
				break;
			}
			case 10: {
				phoneNumber[0] = memberDTO.getPhoneNumber().substring(0, 3);
				phoneNumber[1] = memberDTO.getPhoneNumber().substring(3, 6);
				phoneNumber[2] = memberDTO.getPhoneNumber().substring(6, 10);
				break;
			}
			case 11: {
				phoneNumber[0] = memberDTO.getPhoneNumber().substring(0, 3);
				phoneNumber[1] = memberDTO.getPhoneNumber().substring(3, 7);
				phoneNumber[2] = memberDTO.getPhoneNumber().substring(7, 11);
				break;
			}
			}
			model.addAttribute("phoneNumber", phoneNumber);
			model.addAttribute("type", type);
		}
		model.addAttribute("main_jsp", path);

		return "main/main";
	}

	@PostMapping("/signup.do")
	public String signup(final MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
		memberDTO.setPhoneNumber(memberDTO.getPhoneNumber().replace(",", ""));
		if (memberService.signup(memberDTO))
			return messageRedirect("회원가입을 성공하셨습니다.", "/member/login.do", MessageMethod.get, null, redirectAttributes);
		else
			return messageRedirect("회원가입을 실패하셨습니다.", "/member/signup.do", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/update.do")
	public String update(final MemberDTO memberDTO, RedirectAttributes redirectAttributes) {
		boolean check;
		memberDTO.setPhoneNumber(memberDTO.getPhoneNumber().replace(",", ""));
		if (memberDTO.getPassword().isEmpty()) {
			check = memberService.update(memberDTO);
		} else {
			check = memberService.updateAll(memberDTO);
		}
		if (check)
			return messageRedirect("계정정보를 변경하였습니다.", "/", MessageMethod.get, null, redirectAttributes);
		else
			return messageRedirect("계정정보 변경을 실패하였습니다.", "/", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/delete.do")
	public String delete(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		if (memberService.delete((Integer) session.getAttribute("memberIdx")))
			return messageRedirect("탈퇴를 완료하셨습니다.", "/member/logout.do", MessageMethod.post, null, redirectAttributes);
				//return messageRedirect("/member/logout.do", MessageMethod.post, null, model);
		else
			return messageRedirect("탈퇴를 실패하셨습니다.", "/", MessageMethod.get, null, redirectAttributes);
	}

	@PostMapping("/checkValidation.do")
	@ResponseBody
	public Map<String, String> checkValidation(String updateCheck, @Valid final MemberDTO memberDTO, Errors errors) {
		Map<String, String> validatorResult = ValidUtils.validateHandling(errors);
		if (updateCheck != null) {
			if (memberDTO.getPassword().isEmpty()) {
				validatorResult.remove("valid_password");
			}
		}

		return validatorResult;
	}

	@PostMapping("/checkEmailDuplicate/{email}/exists.do")
	@ResponseBody
	public Boolean checkEmailDuplicate(@PathVariable String email) {
		return memberService.checkEmailDuplicate(email);
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
		memberDTO.setPassword(password);
		memberService.updatePassword(memberDTO);

		return password;
	}
}