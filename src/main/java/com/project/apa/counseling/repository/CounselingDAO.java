package com.project.apa.counseling.repository;

import java.util.List;

import com.project.apa.counseling.model.CounselingDTO;
import com.project.apa.counseling.model.CounselingPageDTO;


/**
 * 상담과 관련된 데이터 액세스 인터페이스
 */
public interface CounselingDAO {
	
	/**
     * 상담 목록을 조회하는 메서드
     *
     * @param pdto CounselingPageDTO 객체
     * @return 상담 목록
     */
    List<CounselingDTO> list(CounselingPageDTO pdto);

    
    /**
     * 전체 상담 건수를 조회하는 메서드
     *
     * @param pdto CounselingPageDTO 객체
     * @return 전체 상담 건수
     */
    int getTotalCount(CounselingPageDTO pdto);

    
    /**
     * 특정 상담을 조회하는 메서드
     *
     * @param mediCounselQuestionSeq 상담 번호
     * @return 특정 상담 정보
     */
	CounselingDTO get(int mediCounselQuestionSeq);

	
	/**
     * 상담에 답변을 추가하는 메서드
     *
     * @param counselingdto CounselingDTO 객체
     */
	void answeradd(CounselingDTO counselingdto);

	
	 /**
     * 상담 답변 상태를 업데이트하는 메서드
     *
     * @param counselingdto CounselingDTO 객체
     */
	void answerupdate(CounselingDTO counselingdto);

	
	
	  /**
     * 완료된 상담을 조회하는 메서드
     *
     * @param mediCounselQuestionSeq 상담 번호
     * @return 완료된 상담 정보
     */
	CounselingDTO getcomplete(int mediCounselQuestionSeq);
}
