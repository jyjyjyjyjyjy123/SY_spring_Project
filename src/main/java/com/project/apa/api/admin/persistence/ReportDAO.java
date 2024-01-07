package com.project.apa.api.admin.persistence;

import java.util.List;

import com.project.apa.api.admin.domain.ReportDTO;


/**
 * @author 이혜진
 * 관리자 기능을 위한 신고 정보에 접근하는 DAO 인터페이스
 */
public interface ReportDAO {

    /**
     * 게시물 신고 목록 조회
     * @return 게시물 신고 목록
     */
	List<ReportDTO> postreportlist();

    /**
     * 댓글 신고 목록 조회
     * @return 댓글 신고 목록
     */
	List<ReportDTO> commentreportlist();

    /**
     * 신고된 게시물 조회
     * @param communityWriter 조회할 사용자의 아이디
     * @return 신고된 게시물 상세정보
     */
	List<ReportDTO> postreportview(String communityWriter);

    /**
     * 게시물 신고 승인 처리
     * @param dto 신고 정보
     * @return 처리 결과 (성공: 1, 실패: 0)
     */
	int postreportapprove(ReportDTO dto);

    /**
     * 게시물 신고 거절 처리
     * @param dto 신고 정보
     * @return 처리 결과 (성공: 1, 실패: 0)
     */
	int postreportdecline(ReportDTO dto);

    /**
     * 사용자에 대한 경고 횟수 증가
     * @param dto 신고 정보
     * @return 경고 횟수 증가 결과 (성공: 1, 실패: 0)
     */
	int cautionAdd(ReportDTO dto);

    /**
     * 댓글 신고 승인 처리
     * @param dto 신고 정보
     * @return 처리 결과 (성공: 1, 실패: 0)
     */
	int commentreportapprove(ReportDTO dto);

    /**
     * 댓글 신고 거절 처리
     * @param dto 신고 정보
     * @return 처리 결과 (성공: 1, 실패: 0)
     */
	int commentreportdecline(ReportDTO dto);

    /**
     * 신고된 댓글 조회
     * @param commentWriter 조회할 사용자의 아이디
     * @return 신고된 댓글 상세정보
     */
	List<ReportDTO> commentreportview(String commentWriter);

    /**
     * 게시물 비공개 처리
     * @param dto 비공개 처리할 게시물 정보
     * @return 처리 결과 (성공: 1, 실패: 0)
     */
	int postprivate(ReportDTO dto);

}
