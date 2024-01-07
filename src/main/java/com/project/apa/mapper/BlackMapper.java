package com.project.apa.mapper;

import java.util.List;


import com.project.apa.api.admin.domain.BlackDTO;

public interface BlackMapper {
	
	List<BlackDTO> blacklist();

	int blacklistadd(BlackDTO black);

	int blacklistdel(BlackDTO dto);


}
