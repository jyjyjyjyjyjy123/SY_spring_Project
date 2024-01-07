package com.project.apa.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


/**
 * 사용자 로그인 성공 시 동작하는 핸들러 클래스입니다.
 */
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	 /**
     * 로그인 성공 시 호출되는 메서드
     *
     * @param request        HTTP 요청 객체
     * @param response       HTTP 응답 객체
     * @param authentication Spring Security에서 생성된 인증 객체
     * @throws IOException      입출력 예외가 발생할 경우
     * @throws ServletException 서블릿 예외가 발생할 경우
     */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		
		//방금 로그인 한 사람이 어떤 자격을 가지고 있는지?
		//- 일반 회원 or 관리자
		
		List<String> roleNames = new ArrayList<String>();
		
		authentication.getAuthorities().forEach(authority -> {
			
			roleNames.add(authority.getAuthority());
		});
		
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/apa/main.do");
		} else if (roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/apa/main.do");
		} else if(roleNames.contains("ROLE_HOSPITAL")){
			response.sendRedirect("/apa/main.do");
		}else if(roleNames.contains("ROLE_PHARMACY")){
			response.sendRedirect("/apa/main.do");
		}
	}
	
}
