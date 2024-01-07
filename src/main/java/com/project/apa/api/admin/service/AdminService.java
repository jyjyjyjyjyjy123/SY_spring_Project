package com.project.apa.api.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.api.admin.domain.BlackDTO;
import com.project.apa.api.admin.domain.MemberDTO;
import com.project.apa.api.admin.domain.ReportDTO;
import com.project.apa.api.admin.persistence.AdminMemberDAO;
import com.project.apa.api.admin.persistence.AfterDAO;
import com.project.apa.api.admin.persistence.BlackDAO;
import com.project.apa.api.admin.persistence.ReportDAO;

/**
 * @author 이혜진
 * 관리자 기능을 제공하는 서비스 클래스
 */
@Service
public class AdminService {

	@Autowired
	private BlackDAO blackdao;
	
	@Autowired
	private ReportDAO reportdao;
	
	@Autowired
	private AfterDAO afterdao;

	@Autowired
	private AdminMemberDAO memberdao;
	
    /**
     * 블랙리스트 목록 조회 서비스
     * @return 블랙리스트 목록
     */
	public List<BlackDTO> blacklist() {
		
		return blackdao.blacklist();
	}

	/**
     * 블랙리스트에 사용자 추가 서비스
     * @param dto 추가할 사용자 정보
     * @return 처리 결과 (추가 성공 시 1, 실패 시 0)
     */
	public int blacklistadd(BlackDTO dto) {

		return blackdao.blacklistadd(dto);
	}
	
    /**
     * 블랙리스트에서 사용자 삭제 서비스
     * @param dto 삭제할 사용자 정보
     * @return 처리 결과 (삭제 성공 시 1, 실패 시 0)
     */
	public int blacklistdel(BlackDTO dto) {
		
		return blackdao.blacklistdel(dto);
	}

    /**
     * 병원 사후관리 목록 조회 서비스
     * @return 병원 사후관리 목록
     */
	public List<AfterDTO> afterlist() {
		return afterdao.afterlist();
	}
	
    /**
     * 사후관리 대상 병원의 상세 조회 서비스
     * @param hospitalId 병원 ID
     * @return 병원 사후관리 상세 내용
     */
	public List<AfterDTO> afterview(String hospitalId) {

		return afterdao.afterview(hospitalId);
	}
	
    /**
     * 사후처리 서비스
     * @param dto 사후처리 정보
     * @return 처리 결과 (수정 성공 시 1, 실패 시 0)
     */
	public int afteredit(AfterDTO dto) {

		return afterdao.afteredit(dto);
	}
	
    /**
     * 게시물 신고 목록 조회 서비스
     * @return 게시물 신고 목록
     */
	public List<ReportDTO> postreportlist() {
		
		return reportdao.postreportlist();
	}

    /**
     * 댓글 신고 목록 조회 서비스
     * @return 댓글 신고 목록
     */
	public List<ReportDTO> commentreportlist() {
		return reportdao.commentreportlist();
	}
	
	/**
     * 게시물 신고 승인 서비스
     * @param dto 승인할 게시물 신고 정보
     * @return 처리 결과 (승인 성공 시 1, 실패 시 0)
     */
	public int postreportapprove(ReportDTO dto) {
		return reportdao.postreportapprove(dto);
	}
	
    /**
     * 게시물 신고 거부 서비스
     * @param dto 거부할 게시물 신고 정보
     * @return 처리 결과 (거부 성공 시 1, 실패 시 0)
     */
	public int postreportdecline(ReportDTO dto) {
		return reportdao.postreportdecline(dto);
	}
	
    /**
     * 게시물 경고 추가 서비스
     * @param dto 경고를 추가할 게시물 정보
     * @return 처리 결과 (추가 성공 시 1, 실패 시 0)
     */
	public int cautionAdd(ReportDTO dto) {
		return reportdao.cautionAdd(dto);
	}

    /**
     * 댓글 신고 승인 서비스
     * @param dto 승인할 댓글 신고 정보
     * @return 처리 결과 (승인 성공 시 1, 실패 시 0)
     */
	public int commentreportapprove(ReportDTO dto) {
		return reportdao.commentreportapprove(dto);
	}
	
    /**
     * 댓글 신고 거부 서비스
     * @param dto 거부할 댓글 신고 정보
     * @return 처리 결과 (거부 성공 시 1, 실패 시 0)
     */
	public int commentreportdecline(ReportDTO dto) {
		return reportdao.commentreportdecline(dto);
	}
	
    /**
     * 신고 게시물 상세보기 서비스
     * @param communityWriter 게시물 작성자 ID
     * @return 신고 게시물 상세 목록
     */
	public List<ReportDTO> postreportview(String communityWriter) {
		return reportdao.postreportview(communityWriter);
	}

    /**
     * 신고 댓글 상세보기 서비스
     * @param commentWriter 댓글 작성자 ID
     * @return 신고 댓글 상세 목록
     */
	public List<ReportDTO> commentreportview(String commentWriter) {
		return reportdao.commentreportview(commentWriter);
	}

    /**
     * 게시물 비공개 처리 서비스
     * @param dto 비공개 처리할 게시물 정보
     * @return 처리 결과 (비공개 처리 성공 시 1, 실패 시 0)
     */
	public int postprivate(ReportDTO dto) {
		return reportdao.postprivate(dto);
	}
	
    /**
     * 일반회원 정보 목록 조회 서비스
     * @return 사용자 정보 목록
     */
	public List<MemberDTO> userInfo() {

		return memberdao.userInfo();
	}
	
    /**
     * 병원 정보 목록 조회 서비스
     * @return 병원 정보 목록
     */
	public List<MemberDTO> hospitalInfo() {
		
		return memberdao.hospitalInfo();
	}
	
    /**
     * 약국 정보 목록 조회 서비스
     * @return 약국 정보
     */
	public List<MemberDTO> pharmacyInfo() {

		return memberdao.pharmacyInfo();
	}

}
