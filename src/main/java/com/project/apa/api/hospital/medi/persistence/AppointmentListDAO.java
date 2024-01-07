package com.project.apa.api.hospital.medi.persistence;

import java.util.HashMap;
import java.util.List;

import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;

/**
 * 병원 예약 목록에 대한 데이터 액세스 객체 (DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface AppointmentListDAO {

	/**
     * 오늘 예약된 환자 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 예약된 환자 목록
     */
	List<AppointmentListDTO> getTodayAppointmentList(HashMap<String, Object> map);

	/**
     * 예약된 모든 환자 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 모든 예약된 환자 목록
     */
	List<AppointmentListDTO> getAllAppointmentList(HashMap<String, Object> map);

	/**
     * 모든 예약 건수를 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 모든 예약 건수
     */
	int getAllAppointmentCount(String id);

	/**
     * 오늘 예약 건수를 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 오늘 예약 건수
     */
	int getTodayAppointmentCount(String id);

	/**
     * 모든 예약 목록을 오래된 예약일 순으로 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 예약일 순으로 정렬된 모든 예약 목록
     */
	List<AppointmentListDTO> getAllAppointmentListOld(HashMap<String, Object> map);

	/**
     * 모든 예약 목록을 최근 예약일 순으로 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 최근 예약일 순으로 정렬된 모든 예약 목록
     */
	List<AppointmentListDTO> getAllAppointmentListLast(HashMap<String, Object> map);

}
