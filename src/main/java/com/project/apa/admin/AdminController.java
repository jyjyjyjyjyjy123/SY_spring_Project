package com.project.apa.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.apa.api.admin.domain.BlackDTO;
import com.project.apa.api.admin.service.AdminService;


/**
 * @author 이혜진
 * 관리자 기능을 처리하는 컨트롤러 클래스
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
    /**
     * 사용자 정보를 조회하여 모델에 추가하고, 관리자 사용자 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 관리자 사용자 페이지의 뷰 이름
     */
	@GetMapping(value = "/user.do")
	public String user(Model model) {
		model.addAttribute("userinfo", service.userInfo());
		
		return "admin.user";
	}

    /**
     * 병원 정보를 조회하여 모델에 추가하고, 관리자 병원 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 관리자 병원 페이지의 뷰 이름
     */
	@GetMapping(value = "/hospital.do")
	public String hospital(Model model) {
		model.addAttribute("hospitalinfo", service.hospitalInfo());
		
		return "admin.hospital";
	}
	
    /**
     * 약국 정보를 조회하여 모델에 추가하고, 관리자 약국 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 관리자 약국 페이지의 뷰 이름
     */
	@GetMapping(value = "/pharmacy.do")
	public String pharmacy(Model model) {
		model.addAttribute("pharmacyinfo", service.pharmacyInfo());
		
		return "admin.pharmacy";
	}
	
    /**
     * 블랙리스트 정보를 조회하여 모델에 추가하고, 관리자 블랙리스트 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 관리자 블랙리스트 페이지의 뷰 이름
     */
	@GetMapping(value = "/blacklist.do")
	public String blacklist(Model model) {
		
		model.addAttribute("blacklist", service.blacklist());
		
		return "admin.blacklist";
	}
	
    /**
     * 블랙리스트 추가 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 블랙리스트 추가 페이지의 뷰 이름
     */
	@GetMapping(value = "/blacklistadd.do")
	public String blacklistAdd(Model model) {
		
		return "admin.blacklistadd";
	}
	
}
