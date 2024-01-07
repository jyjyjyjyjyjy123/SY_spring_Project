package com.project.apa.api.advice.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.advice.domain.AdviceDTO;
import com.project.apa.api.advice.domain.StorageDTO;
import com.project.apa.api.advice.persistence.AdviceDAO;import com.project.apa.mapper.AdviceMapper;


@Service
public class AdviceServiceImpl implements AdviceService {
	
	@Autowired
	private AdviceDAO adviceDAO;
	/*
	@Autowired
	private AdviceMapper adviceMapper;
	*/

    /**
     * 조언 목록을 가져오는 메서드
     * @param map 페이징을 위한 파라미터를 담은 HashMap
     * @return 조언 목록
     */
	public List<AdviceDTO> getAdviceList(HashMap<String, Integer> map) {
		
		//System.out.println(map.toString());
		return adviceDAO.getAdviceList(map);
	}
    /**
     * 부서 목록을 가져오는 메서드
     * @return 부서 목록
     */
	@Override
	public List<AdviceDTO> getDepartmentList() {
		return adviceDAO.getDepartmentList();
	}
	
    /**
     * 특정 조건에 맞는 목록을 조회하는 메서드
     * @param dto AdviceDTO 객체를 통해 검색 조건을 전달
     * @return 검색 결과 목록
     */	

	@Override
	public List<AdviceDTO> findlist(AdviceDTO dto) {
		return adviceDAO.findlist(dto);
	}
    /**
     * StorageDTO를 통해 데이터를 저장하는 메서드
     * @param dto StorageDTO 객체를 통해 저장할 데이터를 전달
     * @return 저장 결과 코드
     */
	@Override
	public int storage(StorageDTO dto) {
		
		return adviceDAO.storage(dto);
	}

}
