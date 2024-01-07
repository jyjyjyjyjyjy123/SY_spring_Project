package com.project.apa.api.admin.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.admin.domain.MemberDTO;
import com.project.apa.mapper.AdminMemberMapper;
import com.project.apa.mapper.MemberMapper;

@Repository
public class AdminMemberDAOImpl implements AdminMemberDAO {
	
	@Autowired
	private AdminMemberMapper mapper;

	@Override
	public List<MemberDTO> userInfo() {
		return mapper.userInfo();
	}
	
	@Override
	public List<MemberDTO> hospitalInfo() {
		return mapper.hospitalInfo();
	}
	
	@Override
	public List<MemberDTO> pharmacyInfo() {
		return mapper.pharmacyInfo();
	}
}
