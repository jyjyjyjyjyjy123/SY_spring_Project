package com.project.apa.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.api.admin.service.AdminService;

/**
 * @author 이혜진
 * 관리자 병원 사후처리 기능을 처리하는 컨트롤러 클래스
 */
@Controller
@RequestMapping("/admin")
public class AfterController {
	
	@Autowired
	private AdminService service;
	
    /**
     * 사후처리 목록을 조회하여 모델에 추가하고, 목록 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 사후처리 목록 페이지의 뷰 이름
     */
	@GetMapping(value = "/afterlist.do")
	public String afterlist(Model model) {
		
		model.addAttribute("afterlist", service.afterlist());
		
		return "admin.afterlist";
	}
	
    /**
     * 선택한 병원을 조회하여 모델에 추가하고, 상세 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @param hospitalId 선택한 병원의 ID
     * @return 사후처리 상세 페이지의 뷰 이름
     */
	@GetMapping(value = "/afterview.do")
	public String afterview(Model model, String hospitalId) {
		
		List<AfterDTO> afterview = service.afterview(hospitalId);
		model.addAttribute("afterview", afterview);
		
		return "admin.afterview";
	}
	 
}
