package com.project.apa.api.hospital.medi.persistence;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 병원 예약 목록에 대한 데이터 액세스 객체(DAO)의 구현체입니다.
 * 이 클래스는 AppointmentListDAO 인터페이스의 메서드를 구현하여
 * 오늘 예약된 환자 목록 조회, 모든 예약된 환자 목록 조회,
 * 모든 예약 건수 조회, 오늘 예약 건수 조회, 오래된 예약일 순으로 정렬된
 * 모든 예약 목록 조회, 최근 예약일 순으로 정렬된 모든 예약 목록 조회와 관련된
 * 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class AppointmentListDAOImpl implements AppointmentListDAO {

	@Autowired
	private HospitalMediMapper hospitalMediMapper;

	/**
     * 오늘 예약된 환자 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 예약된 환자 목록
     */
	@Override
	public List<AppointmentListDTO> getTodayAppointmentList(HashMap<String, Object> map) {

		return hospitalMediMapper.getTodayAppointmentList(map);
	}

	/**
     * 예약된 모든 환자 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 모든 예약된 환자 목록
     */
	@Override
	public int getTodayAppointmentCount(String id) {

		return hospitalMediMapper.getTodayAppointmentCount(id);
	}

	/**
     * 모든 예약 건수를 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 모든 예약 건수
     */
	@Override
	public List<AppointmentListDTO> getAllAppointmentList(HashMap<String, Object> map) {

		return hospitalMediMapper.getAllAppointmentList(map);
	}

	/**
     * 오늘 예약 건수를 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 오늘 예약 건수
     */
	@Override
	public List<AppointmentListDTO> getAllAppointmentListOld(HashMap<String, Object> map) {

		return hospitalMediMapper.getAllAppointmentListOld(map);
	}

	/**
     * 오래된 예약일 순으로 정렬된 모든 예약 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 예약일 순으로 정렬된 모든 예약 목록
     */
	@Override
	public List<AppointmentListDTO> getAllAppointmentListLast(HashMap<String, Object> map) {

		return hospitalMediMapper.getAllAppointmentListLast(map);
	}

	/**
     * 최근 예약일 순으로 정렬된 모든 예약 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 최근 예약일 순으로 정렬된 모든 예약 목록
     */
	@Override
	public int getAllAppointmentCount(String id) {

		return hospitalMediMapper.getAllAppointmentCount(id);
	}
}
