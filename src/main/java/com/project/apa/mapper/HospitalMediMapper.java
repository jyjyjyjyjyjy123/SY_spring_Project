package com.project.apa.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.api.hospital.medi.domain.PatientDTO;
import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;

/**
 * 이 인터페이스는 병원의 내 진료 매퍼에 대한 설명을 제공합니다.
 * 이 매퍼는 환자, 진료 예약, 진료 등에 관련된 데이터에 대한 데이터베이스 액세스를 담당합니다.
 * 매퍼의 각 메서드는 특정 데이터베이스 작업을 수행하며 관련된 정보를 반환합니다.
 * 
 * @author Eunha
 *
 */
public interface HospitalMediMapper {

	/**
     * 병원의 환자 목록을 가져오는 메서드입니다.
     *
     * @param id 병원 아이디
     * @return 병원의 환자 목록
     */
	List<PatientDTO> getPatientList(String id);
	/**
     * 오늘의 진료 예약 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 오늘의 진료 예약 목록
     */
	List<AppointmentListDTO> getTodayAppointmentList(HashMap<String, Object> map);

    /**
     * 모든 진료 예약 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 모든 진료 예약 목록
     */
	List<AppointmentListDTO> getAllAppointmentList(HashMap<String, Object> map);

    /**
     * 특정 진료 예약의 상세 정보를 가져오는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 진료 예약의 상세 정보
     */
	AppointmentDetailDTO getAppointmentDetail(int appointmentSeq);
	
	/**
     * 병원의 모든 진료 예약 수를 가져오는 메서드입니다.
     *
     * @param id 병원 아이디
     * @return 모든 진료 예약 수
     */
	int getAllAppointmentCount(String id);

    /**
     * 모든 진료 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentList(HashMap<String, Object> map);

    /**
     * 병원의 모든 진료 수를 가져오는 메서드입니다.
     *
     * @param id 병원 아이디
     * @return 모든 진료 수
     */
	int getAllTreatmentCount(String id);

    /**
     * 특정 진료의 상세 정보를 가져오는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 진료의 상세 정보
     */
	TreatmentDetailDTO getTreatmentDetail(int appointmentSeq);

    /**
     * 진료 예약을 승인하는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 승인 결과 (성공: 1, 실패: 0)
     */
	int approveAppointment(int appointmentSeq);

    /**
     * 진료 예약을 거절하는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 거절 결과 (성공: 1, 실패: 0)
     */
	int declineAppointment(int appointmentSeq);

    /**
     * 환자를 호출하는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 호출 결과 (성공: 1, 실패: 0)
     */
	int callPatient(int appointmentSeq);

    /**
     * 진료 내역서를 작성하는 메서드입니다.
     *
     * @param data 진료 내역서 작성에 필요한 데이터
     * @return 작성 결과 (성공: 1, 실패: 0)
     */
	int writeMediRecord(Map<String, String> data);

	/**
	 * 진료 내역서의 초기 정보를 가져오는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 진료 내역서의 초기 정보
	 */
	RecordDTO getInitMediRecord(int appointmentSeq);

	/**
     * 진료 상태를 변경하는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 변경 결과 (성공: 1, 실패: 0)
     */
	int changeTreatmentStatus(String appointmentSeq);

    /**
     * 약 처방 상태를 추가하는 메서드입니다.
     *
     * @param dispenseListSeq 약 처방 리스트 번호
     * @return 추가 결과 (성공: 1, 실패: 0)
     */
	int insertDispenseStatus(String dispenseListSeq);

    /**
     * 특정 진료 예약의 약 처방 리스트 번호를 가져오는 메서드입니다.
     *
     * @param appointmentSeq 진료 예약 번호
     * @return 약 처방 리스트 번호
     */
	String getDispenseListSeq(String appointmentSeq);

    /**
     * 병원의 오늘의 진료 예약 수를 가져오는 메서드입니다.
     *
     * @param id 병원 아이디
     * @return 오늘의 진료 예약 수
     */
	int getTodayAppointmentCount(String id);

    /**
     * 병원의 오늘의 진료 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 오늘의 진료 목록
     */
	List<TreatmentListDTO> getTodayTreatmentList(HashMap<String, Object> map);

    /**
     * 병원의 오늘의 진료 수를 가져오는 메서드입니다.
     *
     * @param id 병원 아이디
     * @return 오늘의 진료 수
     */
	int getTodayTreatmentCount(String id);

    /**
     * 오래된 진료일 기준으로 정렬된 병원의 모든 진료 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 진료일 기준으로 정렬된 병원의 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListOldRegDate(HashMap<String, Object> map);
	
	/**
     * 최근 진료일 기준으로 정렬된 병원의 모든 진료 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 최근 진료일 기준으로 정렬된 병원의 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListLastRegDate(HashMap<String, Object> map);

    /**
     * 진료 예약 번호 기준으로 정렬된 병원의 모든 진료 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 진료 예약 번호 기준으로 정렬된 병원의 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListAppointmentSeq(HashMap<String, Object> map);

    /**
     * 오래된 진료일 기준으로 정렬된 병원의 모든 진료 예약 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 진료일 기준으로 정렬된 병원의 모든 진료 예약 목록
     */
	List<AppointmentListDTO> getAllAppointmentListOld(HashMap<String, Object> map);

	/**
     * 최근 진료일 기준으로 정렬된 병원의 모든 진료 예약 목록을 가져오는 메서드입니다.
     *
     * @param map 필요한 매개변수들이 담긴 HashMap
     * @return 최근 진료일 기준으로 정렬된 병원의 모든 진료 예약 목록
     */
	List<AppointmentListDTO> getAllAppointmentListLast(HashMap<String, Object> map);
}
