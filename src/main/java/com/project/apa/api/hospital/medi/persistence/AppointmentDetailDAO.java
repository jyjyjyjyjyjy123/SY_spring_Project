package com.project.apa.api.hospital.medi.persistence;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentStatusDTO;

/**
 * 병원 예약 상세 정보에 대한 데이터 액세스 객체 (DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface AppointmentDetailDAO {

	/**
     * 주어진 예약 번호에 해당하는 예약 상세 정보를 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 조회된 예약 상세 정보 DTO
     */
	AppointmentDetailDTO getAppointmentDetail(int appointmentSeq);

	/**
     * 주어진 예약 번호에 해당하는 예약을 승인합니다.
     * 
     * @param appointmentSeq 승인할 예약 번호
     * @return 승인 성공 시 1, 실패 시 0
     */
	int approveAppointment(int appointmentSeq);

	/**
     * 주어진 예약 번호에 해당하는 예약을 거절합니다.
     * 
     * @param appointmentSeq 거절할 예약 번호
     * @return 거절 성공 시 1, 실패 시 0
     */
	int declineAppointment(int appointmentSeq);

}
