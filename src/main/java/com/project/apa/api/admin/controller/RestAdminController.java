package com.project.apa.api.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.api.admin.domain.BlackDTO;
import com.project.apa.api.admin.domain.ReportDTO;
import com.project.apa.api.admin.service.AdminService;


/**
 * @author 이혜진
 * 관리자 기능을 제공하는 REST 컨트롤러
 */
@RestController
@RequestMapping("/admin")
public class RestAdminController {

	@Autowired
	private AdminService service;
	
    /**
     * 블랙리스트에 사용자 추가 REST 서비스
     * @param dto 추가할 사용자 정보
     * @return 처리 결과 (추가 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/blacklistadd")
	public int blacklistadd(@RequestBody BlackDTO dto) {
		
		return service.blacklistadd(dto);
	}
	
    /**
     * 블랙리스트에서 사용자 삭제 REST 서비스
     * @param dto 삭제할 사용자 정보
     * @return 처리 결과 (삭제 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/blacklistdel")
	public int blacklistdel(@RequestBody BlackDTO dto) {
		
		return service.blacklistdel(dto);
	}
	
    /**
     * 사후처리 REST 서비스
     * @param dto 사후처리 정보
     * @return 처리 결과 (수정 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/afteredit")
	public int afteredit(@RequestBody AfterDTO dto) {
		return service.afteredit(dto);
	}
	
    /**
     * 게시물 신고 거부 REST 서비스
     * @param dto 거부할 게시물 신고 정보
     * @return 처리 결과 (거부 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/postreportdecline")
	public int postreportdecline(@RequestBody ReportDTO dto) {
		return service.postreportdecline(dto);
	}
	
    /**
     * 게시물 신고 승인 REST 서비스
     * @param dto 승인할 게시물 신고 정보
     * @return 처리 결과 (승인 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/postreportapprove")
	public int postreportapprove(@RequestBody ReportDTO dto) {
		return service.postreportapprove(dto);
	}
	
    /**
     * 게시물 비공개 처리 REST 서비스
     * @param dto 비공개 처리할 게시물 정보
     * @return 처리 결과 (비공개 처리 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/postprivate")
	public int postprivate(@RequestBody ReportDTO dto) {
		return service.postprivate(dto);
	}
	
    /**
     * 게시물 경고 추가 REST 서비스
     * @param dto 경고를 추가할 게시물 정보
     * @return 처리 결과 (추가 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/cautionAdd")
	public int cautionAdd(@RequestBody ReportDTO dto) {
		return service.cautionAdd(dto);
	}
	
    /**
     * 댓글 신고 승인 REST 서비스
     * @param dto 승인할 댓글 신고 정보
     * @return 처리 결과 (승인 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/commentreportapprove")
	public int commentreportapprove(@RequestBody ReportDTO dto) {
		
		//System.out.println(dto.getCommentReportSeq());
		
		return service.commentreportapprove(dto);
	}
	
    /**
     * 댓글 신고 거부 REST 서비스
     * @param dto 거부할 댓글 신고 정보
     * @return 처리 결과 (거부 성공 시 1, 실패 시 0)
     */
	@PostMapping(value = "/commentreportdecline")
	public int commentreportdecline(@RequestBody ReportDTO dto) {
		return service.commentreportdecline(dto);
	}
	
}
