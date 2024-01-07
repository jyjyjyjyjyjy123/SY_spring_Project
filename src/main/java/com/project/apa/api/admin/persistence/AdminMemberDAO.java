package com.project.apa.api.admin.persistence;

import java.util.List;

import com.project.apa.api.admin.domain.MemberDTO;

/**
 * @author 이혜진
 * 관리자 기능을 위한 회원 정보에 접근하는 DAO 인터페이스
 */
public interface AdminMemberDAO {

    /**
     * 모든 사용자 정보 조회
     * @return 모든 사용자 정보 목록
     */
	List<MemberDTO> userInfo();

    /**
     * 모든 병원 정보 조회
     * @return 모든 병원 정보 목록
     */
	List<MemberDTO> hospitalInfo();

    /**
     * 모든 약국 정보 조회
     * @return 모든 약국 정보 목록
     */
	List<MemberDTO> pharmacyInfo();

}
