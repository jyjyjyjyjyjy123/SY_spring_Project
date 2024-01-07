package com.project.apa.api.advice.persistence;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.advice.domain.AdviceDTO;
import com.project.apa.api.advice.domain.StorageDTO;
import com.project.apa.mapper.AdviceMapper;

@Repository
public class AdviceDAOImpl implements AdviceDAO {

	@Autowired
	private AdviceMapper adviceMapper;
	
	
    /**
     * AdviceDTO를 통해 데이터를 추가하는 메서드
     * @param dto AdviceDTO 객체를 통해 추가할 데이터를 전달
     * @return 추가 결과 코드
     */	
	@Override
	public int add(AdviceDTO dto) {
		return adviceMapper.add(dto);
	}
	

    /**
     * 페이징을 적용하여 조언 목록을 가져오는 메서드
     * @param map 페이징을 위한 파라미터를 담은 HashMap
     * @return 조언 목록
     */	
	@Override
	public List<AdviceDTO> getAdviceList(HashMap<String, Integer> map) {
		return adviceMapper.getAdviceList(map);
	}
    /**
     * 부서 목록을 가져오는 메서드
     * @return 부서 목록
     */
	@Override
	public List<AdviceDTO> getDepartmentList() {
		
		return adviceMapper.getDepartmentList();
	}
    /**
     * 총 레코드 수를 가져오는 메서드
     * @return 총 레코드 수
     */
	@Override
	public int getTotalCount() {
		
		return adviceMapper.getTotalCount();
	}
	
    /**
     * StorageDTO를 통해 데이터를 저장하는 메서드
     * @param dto StorageDTO 객체를 통해 저장할 데이터를 전달
     * @return 저장 결과 코드
     */	
	@Override
	public int storage(StorageDTO dto) {
		
		return adviceMapper.storage(dto);
	}

    /**
     * AdviceDTO를 통해 검색 조건에 맞는 목록을 조회하는 메서드
     * @param dto AdviceDTO 객체를 통해 검색 조건을 전달
     * @return 검색 결과 목록
     */
	@Override
	public List<AdviceDTO> findlist(AdviceDTO dto) {
		return adviceMapper.findlist(dto);
	}
	

}
