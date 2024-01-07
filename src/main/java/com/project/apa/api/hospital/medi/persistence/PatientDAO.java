package com.project.apa.api.hospital.medi.persistence;

import java.util.List;

import com.project.apa.api.hospital.medi.domain.PatientDTO;

/**
 * 환자 정보에 대한 데이터 액세스 객체(DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface PatientDAO {

	/**
     * 병원 아이디에 해당하는 환자 목록을 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 병원 아이디에 해당하는 환자 목록
     */
	List<PatientDTO> getPatientList(String id);

}
