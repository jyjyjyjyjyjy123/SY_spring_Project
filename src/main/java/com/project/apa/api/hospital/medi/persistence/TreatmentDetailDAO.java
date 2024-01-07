package com.project.apa.api.hospital.medi.persistence;

import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;

/**
 * 진료 상세정보에 대한 데이터 액세스 객체(DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface TreatmentDetailDAO {

	/**
     * 주어진 예약 번호에 해당하는 진료 상세정보를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료 상세정보 DTO
     */
	TreatmentDetailDTO getTreatmentDetail(int appointmentSeq);

	/**
     * 주어진 예약 번호에 해당하는 환자를 호출합니다.
     * 
     * @param appointmentSeq 호출할 예약 번호
     * @return 호출 성공 시 1, 실패 시 0
     */
	int callPatient(int appointmentSeq);

}
