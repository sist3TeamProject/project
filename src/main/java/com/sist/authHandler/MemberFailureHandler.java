package com.sist.authHandler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.sist.component.ApplicationContextProvider;
import com.sist.service.MemberService;

public class MemberFailureHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		MemberService memberService = (MemberService)context.getBean("memberService");
		
		String loginFailMsg;
		if (exception instanceof LockedException) {
			loginFailMsg = exception.getMessage();
		} else {
			String email = request.getParameter("username");

			if (memberService.lockCount(email)) {
				int lockCount = memberService.searchLock(email);
				if (lockCount >= 3) {
					loginFailMsg = "비밀번호 횟수 초과하였습니다. 비밀번호 찾기를 진행해주세요.";
				} else {
					loginFailMsg = "계정 잠금까지 " + (3 - lockCount) + "번 남았습니다.";
				}
			} else {
				loginFailMsg = "존재하지 않는 이메일입니다.";
			}
		}
		request.getSession().setAttribute("loginFailMsg", loginFailMsg);
		response.sendRedirect(request.getContextPath()+"/member/login.do");
	}
}