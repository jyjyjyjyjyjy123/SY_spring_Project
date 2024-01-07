package com.project.apa.api.hospital.medi.persistence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 병원 예약 상세 정보에 대한 데이터 액세스 객체 (DAO)의 구현체입니다.
 * 이 클래스는 AppointmentDetailDAO 인터페이스의 메서드를 구현하여
 * 예약 상세 정보의 조회, 승인, 거절 등과 관련된 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class AppointmentDetailDAOImpl implements AppointmentDetailDAO {

	@Autowired
	private HospitalMediMapper hospitalMediMapper;

	/**
     * 주어진 예약 번호에 해당하는 예약 상세 정보를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 조회된 예약 상세 정보 DTO
     */
	@Override
	public AppointmentDetailDTO getAppointmentDetail(int appointmentSeq) {
		
		return hospitalMediMapper.getAppointmentDetail(appointmentSeq);
	}
	
	/**
     * 주어진 예약 번호에 해당하는 예약을 데이터베이스에서 승인합니다.
     * 
     * @param appointmentSeq 승인할 예약 번호
     * @return 승인 성공 시 1, 실패 시 0
     */
	@Override
	public int approveAppointment(int appointmentSeq) {
	
		return hospitalMediMapper.approveAppointment(appointmentSeq);
	}
	
	/**
     * 주어진 예약 번호에 해당하는 예약을 데이터베이스에서 거절합니다.
     * 
     * @param appointmentSeq 거절할 예약 번호
     * @return 거절 성공 시 1, 실패 시 0
     */
	@Override
	public int declineAppointment(int appointmentSeq) {

		return hospitalMediMapper.declineAppointment(appointmentSeq);
	}
}
