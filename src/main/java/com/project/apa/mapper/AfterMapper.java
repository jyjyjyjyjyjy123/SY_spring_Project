package com.project.apa.mapper;

import java.util.List;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.api.admin.domain.BlackDTO;

public interface AfterMapper {
	
	List<AfterDTO> afterlist();

	List<AfterDTO> afterview(String hospitalId);

	int afteredit(AfterDTO dto);

}
