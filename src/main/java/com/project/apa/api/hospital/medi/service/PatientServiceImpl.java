package com.project.apa.api.hospital.medi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.hospital.medi.domain.PatientDTO;
import com.project.apa.api.hospital.medi.persistence.PatientDAO;

/**
 * 환자 서비스의 구현체입니다.
 * 병원 내 환자 목록 조회와 관련된 기능을 실제로 수행합니다.
 * 
 * @author Eunha
 *
 */
@Service
public class PatientServiceImpl implements PatientService {

	@Autowired
	private PatientDAO patientDAO;
	
	/**
     * 주어진 병원 아이디에 해당하는 환자 목록을 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 환자 목록
     */
	@Override
	public List<PatientDTO> getPatientList(String id) {

		return patientDAO.getPatientList(id);
	}
}
