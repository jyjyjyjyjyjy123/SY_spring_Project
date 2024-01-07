package com.project.apa.api.hospital.medi.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.PatientDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 환자 정보에 대한 데이터 액세스 객체(DAO)의 구현체입니다.
 * 이 클래스는 PatientDAO 인터페이스의 메서드를 구현하여
 * 병원 아이디에 해당하는 환자 목록 조회와 관련된 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class PatientDAOImpl implements PatientDAO {
	
	@Autowired
	private HospitalMediMapper hospitalMediMapper;
	
	/**
     * 병원 아이디에 해당하는 환자 목록을 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 병원 아이디에 해당하는 환자 목록
     */
	@Override
	public List<PatientDTO> getPatientList(String id) {

		return hospitalMediMapper.getPatientList(id);
	}
}
