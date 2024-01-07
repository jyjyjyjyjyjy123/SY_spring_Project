package com.project.apa.api.advice.service;

import java.util.HashMap;
import java.util.List;

import com.project.apa.api.advice.domain.AdviceDTO;
import com.project.apa.api.advice.domain.StorageDTO;



public interface AdviceService {

  List<AdviceDTO> getAdviceList(HashMap<String, Integer> map);

  List<AdviceDTO> getDepartmentList();

  int storage(StorageDTO dto);

  List<AdviceDTO> findlist(AdviceDTO dto);






   



}
