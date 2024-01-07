package com.project.apa.api.admin.persistence;

import java.util.List;

import com.project.apa.api.admin.domain.BlackDTO;

/**
 * @author 이혜진
 * 관리자 기능을 위한 블랙리스트 정보에 접근하는 DAO 인터페이스
 */
public interface BlackDAO {

    /**
     * 블랙리스트 목록 조회
     * @return 블랙리스트 목록
     */
	List<BlackDTO> blacklist();
	
    /**
     * 블랙리스트에 신규 항목 추가
     * @param dto 추가할 블랙리스트 정보
     * @return 추가 결과 (성공: 1, 실패: 0)
     */
	int blacklistadd(BlackDTO dto);

    /**
     * 블랙리스트 항목 삭제
     * @param dto 삭제할 블랙리스트 정보
     * @return 삭제 결과 (성공: 1, 실패: 0)
     */
	int blacklistdel(BlackDTO dto);


}
