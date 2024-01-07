package com.project.apa.api.admin.persistence;

import java.util.List;

import com.project.apa.api.admin.domain.AfterDTO;

/**
 * @author 이혜진
 * 관리자 기능을 위한 사후처리 병원 정보에 접근하는 DAO 인터페이스
 */
public interface AfterDAO {
	
    /**
     * 사후처리 병원 목록 조회
     * @return 사후처리 병원 목록
     */
	List<AfterDTO> afterlist();

    /**
     * 특정 병원의 상세 정보
     * @param hospitalId 조회할 병원의 ID
     * @return 특정 병원의 상세정보 목록
     */
	List<AfterDTO> afterview(String hospitalId);

    /**
     * 사후처리 처리
     * @param dto 특정 병원 상세정보
     * @return 수정 결과 (성공: 1, 실패: 0)
     */
	int afteredit(AfterDTO dto);

}
