package com.project.apa.api.hospital.medi.persistence;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;
import com.project.apa.mapper.HospitalMediMapper;

/**
 * 진료 목록에 대한 데이터 액세스 객체(DAO)의 구현체입니다.
 * 이 클래스는 TreatmentListDAO 인터페이스의 메서드를 구현하여
 * 진료 목록 조회 및 오래된 진료일 순으로 정렬된 모든 진료 목록 조회, 
 * 최근 진료일 순으로 정렬된 모든 진료 목록 조회, 예약번호 순으로 정렬된 
 * 모든 진료 목록 조회와 관련된 데이터베이스 작업을 수행합니다.
 * 
 * @author Eunha
 *
 */
@Repository
public class TreatmentListDAOImpl implements TreatmentListDAO {

	@Autowired
	private HospitalMediMapper hospitalMediMapper;

	/**
     * 모든 진료 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 모든 진료 목록
     */
	@Override
	public List<TreatmentListDTO> getAllTreatmentList(HashMap<String, Object> map) {
		return hospitalMediMapper.getAllTreatmentList(map);
	}
	
	/**
     * 모든 진료 건수를 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 모든 진료 건수
     */
	@Override
	public int getAllTreatmentCount(String id) {
		return hospitalMediMapper.getAllTreatmentCount(id);
	}

	/**
     * 오늘 진료 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오늘 진료 목록
     */
	@Override
	public List<TreatmentListDTO> getTodayTreatmentList(HashMap<String, Object> map) {
		return hospitalMediMapper.getTodayTreatmentList(map);
	}

	/**
     * 오늘 진료 건수를 데이터베이스에서 조회합니다.
     * 
     * @param id 병원 아이디
     * @return 오늘 진료 건수
     */
	@Override
	public List<TreatmentListDTO> getAllTreatmentListOldRegDate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return hospitalMediMapper.getAllTreatmentListOldRegDate(map);
	}

	/**
     * 오래된 진료일 순으로 정렬된 모든 진료 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 오래된 진료일 순으로 정렬된 모든 진료 목록
     */
	@Override
	public List<TreatmentListDTO> getAllTreatmentListLastRegDate(HashMap<String, Object> map) {

		return hospitalMediMapper.getAllTreatmentListLastRegDate(map);
	}

	/**
     * 최근 진료일 순으로 정렬된 모든 진료 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 최근 진료일 순으로 정렬된 모든 진료 목록
     */
	@Override
	public List<TreatmentListDTO> getAllTreatmentListAppointmentSeq(HashMap<String, Object> map) {

		return hospitalMediMapper.getAllTreatmentListAppointmentSeq(map);
	}

	/**
     * 예약번호 순으로 정렬된 모든 진료 목록을 데이터베이스에서 조회합니다.
     * 
     * @param map 조회에 필요한 매개변수들이 담긴 HashMap
     * @return 예약번호 순으로 정렬된 모든 진료 목록
     */
	@Override
	public int getTodayTreatmentCount(String id) {
		return hospitalMediMapper.getTodayTreatmentCount(id);
	}
}
