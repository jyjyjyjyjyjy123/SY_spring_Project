package com.project.apa.api.hospital.medi.persistence;

import java.util.HashMap;
import java.util.List;

import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;

/**
 * 진료 목록에 대한 데이터 액세스 객체(DAO)입니다.
 * 
 * @author Eunha
 *
 */
public interface TreatmentListDAO {

	/**
     * 모든 진료 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentList(HashMap<String, Object> map);

	/**
     * 모든 진료 건수를 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 모든 진료 건수
     */
	int getAllTreatmentCount(String id);

	/**
     * 오늘 진료 목록을 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 진료 목록
     */
	List<TreatmentListDTO> getTodayTreatmentList(HashMap<String, Object> map);

	/**
     * 오늘 진료 건수를 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 오늘 진료 건수
     */
	int getTodayTreatmentCount(String id);

	/**
     * 모든 진료 목록을 오래된 진료일 순으로 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 진료일 순으로 정렬된 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListOldRegDate(HashMap<String, Object> map);

	/**
     * 모든 진료 목록을 최근 진료일 순으로 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 최근 진료일 순으로 정렬된 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListLastRegDate(HashMap<String, Object> map);

	/**
     * 모든 진료 목록을 예약번호 순으로 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 예약번호 순으로 정렬된 모든 진료 목록
     */
	List<TreatmentListDTO> getAllTreatmentListAppointmentSeq(HashMap<String, Object> map);

}
