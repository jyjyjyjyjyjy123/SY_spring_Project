package com.project.apa.auth.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.auth.model.MemberDTO;
import com.project.apa.mapper.AuthMapper;


/**
 * 사용자 인증과 관련된 데이터 액세스 인터페이스를 구현하는 클래스
 */
@Repository
public class AuthDAOImpl implements AuthDAO {

	@Autowired
	private AuthMapper mapper;

	
	 /**
     * 사용자 아이디를 기반으로 사용자 일련번호를 조회하는 메서드
     * @param userid 사용자 아이디
     * @return 사용자 일련번호
     */
	@Override
	public String getuserseq(String userid) {
		return mapper.getuserseq(userid);
	}
		
}
