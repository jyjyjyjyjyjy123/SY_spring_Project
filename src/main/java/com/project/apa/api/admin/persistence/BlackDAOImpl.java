package com.project.apa.api.admin.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.admin.domain.BlackDTO;
import com.project.apa.mapper.BlackMapper;

@Repository
public class BlackDAOImpl implements BlackDAO {
	
	@Autowired
	private BlackMapper mapper;
	
	@Override
	public List<BlackDTO> blacklist() {
		return mapper.blacklist();
	}
	
	@Override
	public int blacklistadd(BlackDTO dto) {
		return mapper.blacklistadd(dto);
	}
	
	@Override
	public int blacklistdel(BlackDTO dto) {

		return mapper.blacklistdel(dto);
	}

}
