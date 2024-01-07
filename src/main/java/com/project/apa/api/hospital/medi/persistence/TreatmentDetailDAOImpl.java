package com.project.apa.api.hospital.medi.persistence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 진료 상세정보에 대한 데이터 액세스 객체(DAO)의 구현체입니다.
 * 이 클래스는 TreatmentDetailDAO 인터페이스의 메서드를 구현하여
 * 진료 상세정보 조회 및 환자 호출과 관련된 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class TreatmentDetailDAOImpl implements TreatmentDetailDAO {
	@Autowired
	private HospitalMediMapper hospitalMediMapper;

	/**
     * 주어진 예약 번호에 해당하는 진료 상세정보를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료 상세정보 DTO
     */
	@Override
	public TreatmentDetailDTO getTreatmentDetail(int appointmentSeq) {
		return hospitalMediMapper.getTreatmentDetail(appointmentSeq);
	}

	/**
     * 주어진 예약 번호에 해당하는 환자를 호출합니다.
     * 
     * @param appointmentSeq 호출할 예약 번호
     * @return 호출 성공 시 1, 실패 시 0
     */
	@Override
	public int callPatient(int appointmentSeq) {

		return hospitalMediMapper.callPatient(appointmentSeq);
	}

}
