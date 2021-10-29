package com.sist.authHandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.sist.component.ApplicationContextProvider;
import com.sist.dto.MemberDTO;
import com.sist.service.MemberService;

public class MemberSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		MemberService memberService = (MemberService)context.getBean("memberService");
		
		MemberDTO memberDTO = (MemberDTO) request.getAttribute("memberDTO");
		if (memberDTO.getDeleteCheck().equals("Y")) {
			throw new LockedException("탈퇴한 계정입니다. 관리자에게 문의하세요.");
		}
		if (memberDTO.getLockCount() >= 3) {
			throw new LockedException("비밀번호 횟수 초과하였습니다. 비밀번호 찾기를 진행해주세요.");
		}
		memberService.lockReset(memberDTO.getEmail());

		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(-1);
		session.setAttribute("memberIdx", memberDTO.getIdx());
		session.setAttribute("email", memberDTO.getEmail());

		String url = (String) session.getAttribute("prevPage");
		if (url != null) {
			session.removeAttribute("prevPage");
		} else {
			RequestCache requestCache = new HttpSessionRequestCache();
			SavedRequest savedRequest = requestCache.getRequest(request, response);
			if (savedRequest != null) {
				url = savedRequest.getRedirectUrl();
				if (url.contains("member")) {
					url = request.getContextPath()+"/";
				}
			} else {
				url = request.getContextPath()+"/";
			}
		}

		response.sendRedirect(url);
	}
}