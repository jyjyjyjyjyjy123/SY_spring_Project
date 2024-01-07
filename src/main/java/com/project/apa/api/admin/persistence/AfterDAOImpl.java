package com.project.apa.api.admin.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.mapper.AfterMapper;

@Repository
public class AfterDAOImpl implements AfterDAO {

	@Autowired
	private AfterMapper mapper;
	
	@Override
	public List<AfterDTO> afterlist() {
		return mapper.afterlist();
	}
	
	@Override
	public List<AfterDTO> afterview(String hospitalId) {
		return mapper.afterview(hospitalId);
	}
	
	@Override
	public int afteredit(AfterDTO dto) {
		return mapper.afteredit(dto);
	}
}
