package com.project.apa.auth.repository;


import com.project.apa.auth.model.MemberDTO;


/**
 * 사용자 인증과 관련된 데이터 액세스 인터페이스
 */
public interface AuthDAO {

	
	 /**
     * 사용자 아이디를 기반으로 사용자 일련번호를 반환하는 메서드
     * @param userid 사용자 아이디
     * @return 사용자 일련번호
     */
	String getuserseq(String userid);
}
