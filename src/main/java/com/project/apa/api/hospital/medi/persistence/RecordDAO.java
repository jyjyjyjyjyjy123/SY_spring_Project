package com.project.apa.api.hospital.medi.persistence;

import java.util.Map;

import com.project.apa.api.hospital.medi.domain.RecordDTO;

/**
 * 진료내역서에 대한 데이터 액세스 객체(DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface RecordDAO {

	/**
     * 주어진 예약 번호에 해당하는 진료내역서 초기 데이터를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료내역서 초기 데이터 DTO
     */
	RecordDTO getInitMediRecord(int appointmentSeq);

	/**
     * 주어진 데이터를 기반으로 환자의 진료내역서를 데이터베이스에 작성합니다.
     * 
     * @param data 작성할 진료 기록 데이터
     * @return 작성 성공 시 1, 실패 시 0
     */
	int writeMediRecord(Map<String, String> data);

	/**
     * 주어진 예약 번호에 해당하는 환자의 진료 상태를 변경합니다.
     * 
     * @param appointmentSeq 변경할 예약 번호
     * @return 변경 성공 시 1, 실패 시 0
     */
	int changeTreatmentStatus(String appointmentSeq);

	/**
     * 주어진 처방 목록 번호에 해당하는 처방 상태를 데이터베이스에 추가합니다.
     * 
     * @param dispenseListSeq 추가할 처방 목록 번호
     * @return 추가 성공 시 1, 실패 시 0
     */
	int insertDispenseStatus(String dispenseListSeq);

	 /**
     * 주어진 예약 번호에 해당하는 약 처방 번호를 데이터베이스에서 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 조회된 약 처방 번호
     */
	String getDispenseListSeq(String appointmentSeq);

}
