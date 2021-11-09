package com.sist.service;

import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.sist.component.ApplicationContextProvider;
import com.sist.dto.MemberDTO;
import com.sist.mapper.MemberMapper;
import com.sist.role.MemberRole;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class UserService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		ApplicationContext context = ApplicationContextProvider.getApplicationContext();
		if(context == null) {
			throw new UsernameNotFoundException("");
		}
		MemberMapper memberMapper = (MemberMapper)context.getBean("memberMapper");
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();

		MemberDTO memberDTO = memberMapper.findByEmail(email);
		if (memberDTO != null) {
			if (memberDTO.getDeleteCheck().equals("Y")) {
				throw new LockedException("탈퇴한 계정입니다. 관리자에게 문의하세요.");
			}
			List<GrantedAuthority> authorities = new ArrayList<>();
			if (memberDTO.getAdminCheck().equals("Y")) {
				authorities.add(new SimpleGrantedAuthority(MemberRole.ADMIN.getValue()));
			} else {
				authorities.add(new SimpleGrantedAuthority(MemberRole.USER.getValue()));
			}
			request.setAttribute("memberDTO", memberDTO);

			return new User(memberDTO.getEmail(), memberDTO.getPassword(), authorities);
		}
		throw new UsernameNotFoundException("");
	}
}