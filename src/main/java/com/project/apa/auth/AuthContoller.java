package com.project.apa.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.apa.auth.service.AuthService;
import com.project.apa.mapper.AuthMapper;
/**
 * 사용자 인증과 관련된 기능을 처리하는 컨트롤러 클래스
 */
@Controller
@RequestMapping("/auth")
public class AuthContoller {

	@Autowired
	private AuthMapper mapper;
	
	@Autowired
	private AuthService service;
	
	@Autowired
	private PasswordEncoder encoder;
	
	/**
     * 접근 오류 페이지로 이동하는 메서드
     * @param model Model 객체
     * @return 접근 오류 페이지 뷰 이름
     */
	@GetMapping(value = "/accesserror.do")
	public String accesserror(Model model) {
		
		return "auth.accesserror";
	}
	
	 /**
     * 사용자 로그인 페이지로 이동하는 메서드
     * @param model Model 객체
     * @return 사용자 로그인 페이지 뷰 이름
     */
	@GetMapping(value = "/mylogin.do")
	public String mylogin(Model model) {

		return "auth.mylogin";
	}
	
	/**
     * 사용자 로그아웃 페이지로 이동하는 메서드
     * @param model Model 객체
     * @return 사용자 로그아웃 페이지 뷰 이름
     */
	@GetMapping(value = "/mylogout.do")
	public String mylogout (Model model) {

		return "auth.mylogout";
	}
	
	/**
     * 사용자 정보 페이지로 이동하는 메서드
     * @param model Model 객체
     * @return 사용자 정보 페이지 뷰 이름
     */
	@GetMapping(value = "/myinfo.do")
	public String myinfo(Model model) {

		return "auth.myinfo";
	}	
	
}
