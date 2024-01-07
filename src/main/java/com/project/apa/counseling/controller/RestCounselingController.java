package com.project.apa.counseling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.counseling.model.CounselingDTO;
import com.project.apa.counseling.model.DoctorDto;
import com.project.apa.counseling.repository.CounselingDAO;
import com.project.apa.mapper.CounselingMapper;



/**
 * 상담과 관련된 RESTful API를 제공하는 컨트롤러 클래스
 */
@RestController
@RequestMapping("/hospital/counseling")
public class RestCounselingController {
	
	@Autowired
	private CounselingDAO dao;
	
	@Autowired
	private CounselingMapper mapper;
	
	
	   /**
     * 상담 대기 목록을 조회하는 메서드
     *
     * @param dto DoctorDto 객체
     * @return 상담 대기 목록
     */
	@PostMapping(value = "/counselingwaitinglist")
	public List<CounselingDTO> counselingwaitinglist(@RequestBody DoctorDto dto) {
		
		List<CounselingDTO> list = mapper.counselingwaitinglist(dto);
		for (CounselingDTO cdto : list) {
			cdto.setRegdate(cdto.getRegdate().substring(0,10));
			
		}
		
		return list;
	}

	 /**
     * 상담 완료 목록을 조회하는 메서드
     *
     * @param dto DoctorDto 객체
     * @return 상담 완료 목록
     */
	@PostMapping(value = "/counselingcompletelist")
	public List<CounselingDTO> counselingcompletelist(@RequestBody DoctorDto dto) {
		
		List<CounselingDTO> list = mapper.counselingwaitinglist(dto);
		for (CounselingDTO cdto : list) {
			cdto.setRegdate(cdto.getRegdate().substring(0,10));
			
		}
		
		return list;
	}


	
}
