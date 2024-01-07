package com.project.apa.api.hospital.medi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;

/**
 * 진료 관리 서비스의 인터페이스입니다.
 * 병원 내 예약 및 진료와 관련된 다양한 기능을 정의합니다.
 * 
 * @author Eunha
 *
 */
public interface PracticeService {

	/**
     * 오늘 예약된 환자 목록과 페이지 정보를 반환합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 예약된 환자 목록과 페이지 정보
     */
	Map<String, Object> getTodayAppointmentList(HashMap<String, Object> map);

	/**
     * 예약된 모든 환자 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 예약된 모든 환자 목록
     */
	List<AppointmentListDTO> getAllAppointmentList(HashMap<String, Object> map);

    /**
     * 주어진 예약 번호에 해당하는 예약 상세 정보를 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 예약 상세 정보 DTO
     */
	AppointmentDetailDTO getAppointmentDetail(int appointmentSeq);

    /**
     * 주어진 매개변수를 기반으로 모든 예약된 환자 목록의 페이지 정보를 반환합니다.
     * 
     * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 페이지 정보
     */
	String getAllAppointmentListPageBar(HashMap<String, Object> map);

    /**
     * 모든 진료 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentList(HashMap<String, Object> map);

    /**
     * 주어진 매개변수를 기반으로 모든 진료 목록의 페이지 정보를 반환합니다.
     * 
     * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 페이지 정보
     */
	String getAllTreatmentListPageBar(HashMap<String, Object> map);

    /**
     * 주어진 예약 번호에 해당하는 진료 상세 정보를 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료 상세 정보 DTO
     */
	TreatmentDetailDTO getTreatmentDetail(int appointmentSeq);

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

    /**
     * 주어진 예약 번호에 해당하는 환자를 호출합니다.
     * 
     * @param appointmentSeq 호출할 예약 번호
     * @return 호출 성공 시 1, 실패 시 0
     */
	int callPatient(int appointmentSeq);

    /**
     * 주어진 예약 번호에 해당하는 진료내역서 초기 데이터를 조회합니다.
     * 
     * @param appointmentSeq 조회할 예약 번호
     * @return 진료내역서 초기 데이터 DTO
     */
	RecordDTO getInitMediRecord(int appointmentSeq);

    /**
     * 주어진 데이터를 기반으로 환자의 진료내역서를 작성합니다.
     * 
     * @param data 작성할 진료 기록 데이터
     * @return 작성 성공 시 1, 실패 시 0
     */
	int writeMediRecord(Map<String, String> data);

    /**
     * 주어진 예약 번호에 해당하는 진료를 완료 처리합니다.
     * 
     * @param string 완료 처리할 예약 번호
     * @return 완료 처리 성공 시 1, 실패 시 0
     */
	int completeTreatment(String string);
	
	/**
     * 주어진 매개변수를 기반으로 오늘 예약된 환자 목록과 페이지 정보를 반환합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 예약된 환자 목록과 페이지 정보
     */
	String getTodayAppointmentListPageBar(HashMap<String, Object> map);

    /**
     * 주어진 매개변수를 기반으로 오늘 진료 목록과 페이지 정보를 반환합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 진료 목록과 페이지 정보
     */
	Map<String, Object> getTodayTreatmentList(HashMap<String, Object> map);

    /**
     * 주어진 매개변수를 기반으로 오늘 진료 목록의 페이지 정보를 반환합니다.
     * 
     * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 페이지 정보
     */
	String getTodayTreatmentListPageBar(HashMap<String, Object> map);
}
