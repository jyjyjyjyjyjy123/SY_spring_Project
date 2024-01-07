package com.project.apa.api.advice.persistence;

import java.util.HashMap;
import java.util.List;

import com.project.apa.api.advice.domain.AdviceDTO;
import com.project.apa.api.advice.domain.StorageDTO;

public interface AdviceDAO  {
	

	int getTotalCount();

	List<AdviceDTO> getAdviceList(HashMap<String, Integer> map);

	int add(AdviceDTO dto);

	List<AdviceDTO> getDepartmentList();

	int storage(StorageDTO dto);

	List<AdviceDTO> findlist(AdviceDTO dto);



	




	
}
