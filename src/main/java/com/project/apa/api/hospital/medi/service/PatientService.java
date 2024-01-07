package com.project.apa.api.hospital.medi.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.apa.api.hospital.medi.domain.PatientDTO;

/**
 * 환자 서비스 인터페이스입니다.
 * 병원 내 환자 목록 조회와 관련된 기능을 정의합니다.
 * 
 * @author Eunha
 *
 */
public interface PatientService {

	/**
     * 주어진 병원 아이디에 해당하는 환자 목록을 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 환자 목록
     */
	List<PatientDTO> getPatientList(String id);

}
