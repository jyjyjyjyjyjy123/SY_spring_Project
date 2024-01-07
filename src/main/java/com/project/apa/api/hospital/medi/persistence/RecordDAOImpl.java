package com.project.apa.api.hospital.medi.persistence;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 진료내역서에 대한 데이터 액세스 객체(DAO)의 구현체입니다.
 * 이 클래스는 RecordDAO 인터페이스의 메서드를 구현하여
 * 진료내역서 초기 데이터 조회, 환자의 진료내역서 작성, 진료 상태 변경, 처방 상태 추가 등과 관련된
 * 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class RecordDAOImpl implements RecordDAO {
	
	@Autowired
	private HospitalMediMapper hospitalMediMapper;
	
	/**
     * 주어진 예약 번호에 해당하는 진료내역서 초기 데이터를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료내역서 초기 데이터 DTO
     */
	@Override
	public RecordDTO getInitMediRecord(int appointmentSeq) {

		return hospitalMediMapper.getInitMediRecord(appointmentSeq);
	}
	
	/**
     * 주어진 데이터를 기반으로 환자의 진료내역서를 데이터베이스에 작성합니다.
     * 
     * @param data 작성할 진료 기록 데이터
     * @return 작성 성공 시 1, 실패 시 0
     */
	@Override
	public int writeMediRecord(Map<String, String> data) {

		return hospitalMediMapper.writeMediRecord(data);
	}
	
	/**
     * 주어진 예약 번호에 해당하는 환자의 진료 상태를 변경합니다.
     * 
     * @param appointmentSeq 변경할 예약 번호
     * @return 변경 성공 시 1, 실패 시 0
     */
	@Override
	public int changeTreatmentStatus(String appointmentSeq) {

		return hospitalMediMapper.changeTreatmentStatus(appointmentSeq);
	}
	
	/**
     * 주어진 예약 번호에 해당하는 약 처방 번호를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 조회된 약 처방 번호
     */
	@Override
	public String getDispenseListSeq(String appointmentSeq) {
		return hospitalMediMapper.getDispenseListSeq(appointmentSeq);
	}
	
	/**
     * 주어진 처방 목록 번호에 해당하는 처방 상태를 데이터베이스에 추가합니다.
     * 
     * @param dispenseListSeq 추가할 처방 목록 번호
     * @return 추가 성공 시 1, 실패 시 0
     */
	@Override
	public int insertDispenseStatus(String dispenseListSeq) {

		return hospitalMediMapper.insertDispenseStatus(dispenseListSeq);
	}
}
