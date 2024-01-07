package com.project.apa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.apa.api.user.service.UserService;


@Controller
public class MainController {
	@Autowired
	private UserService userService;

	@GetMapping(value = "/main.do")
	public String main(Model model) {

		String id = getLoggedInUsername();
		
		String userSeq = userService.getUserSeq(id);
		
		model.addAttribute("seq", userSeq);
		model.addAttribute("loginuserseq", userSeq);
		model.addAttribute("id", id);
		
		return "main";
	}

	@GetMapping(value = "/main/mypage.do")
	public String mypage(Model model) {
		

		String id = getLoggedInUsername();

		String userSeq = userService.getUserSeq(id);

		System.out.println(userSeq);
		
		model.addAttribute("id", id);
		model.addAttribute("seq", userSeq);
		
		return "main.mypage";
	}

	
	private String getLoggedInUsername() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null) {
			return authentication.getName(); // 사용자 아이디 반환
		}

		return null;
	}
}
