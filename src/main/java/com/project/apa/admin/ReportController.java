package com.project.apa.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.apa.api.admin.domain.ReportDTO;
import com.project.apa.api.admin.service.AdminService;

/**
 * @author 이혜진
 * 관리자 신고 기능을 처리하는 컨트롤러 클래스
 */
@Controller
@RequestMapping("/admin")
public class ReportController {
	
	@Autowired
	private AdminService service;
	
	 /**
     * 게시물 및 댓글 신고 목록을 조회하여 모델에 추가하고, 관리자 신고 목록 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @return 관리자 신고 목록 페이지의 뷰 이름
     */
	@GetMapping(value = "/reportlist.do")
	public String reportlist(Model model) {
		
		model.addAttribute("postreportlist", service.postreportlist());
		model.addAttribute("commentreportlist", service.commentreportlist());
		
		return "admin.reportlist";
	}
	
    /**
     * 선택한 게시물 작성자의 신고 목록을 조회하여 모델에 추가하고, 관리자 게시물 신고 상세 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @param communityWriter 선택한 게시물 작성자의 ID
     * @return 관리자 게시물 신고 상세 페이지의 뷰 이름
     */
	@GetMapping(value = "/postreportview.do")
	public String postreportview(Model model, String communityWriter) {
		
		List<ReportDTO> postreportview = service.postreportview(communityWriter);
		model.addAttribute("postreportview", postreportview);
		
		return "admin.postreportview";
	}
	
    /**
     * 선택한 댓글 작성자의 신고 목록을 조회하여 모델에 추가하고, 관리자 댓글 신고 상세 페이지로 이동하는 메서드
     * @param model Spring MVC의 Model 객체
     * @param commentWriter 선택한 댓글 작성자의 ID
     * @return 관리자 댓글 신고 상세 페이지의 뷰 이름
     */
	@GetMapping(value = "/commentreportview.do")
	public String commentreportview(Model model, String commentWriter) {
		
		List<ReportDTO> commentreportview = service.commentreportview(commentWriter);
		model.addAttribute("commentreportview", commentreportview);
		
		
		return "admin.commentreportview";
	}
	
}
