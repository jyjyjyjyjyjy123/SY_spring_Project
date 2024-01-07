package com.project.apa.api.pharmacy.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.pharmacy.domain.DispenseCntDTO;
import com.project.apa.api.pharmacy.domain.DispenseDTO;
import com.project.apa.mapper.PharmacyMapper;


/**
 * DispenseDAO 인터페이스를 구현한 DispenseDAOImp 클래스입니다.
 * 약국과 관련된 데이터 액세스 작업을 처리합니다.
 * @author 김민정
 */
@Repository
public class DispenseDAOImp implements DispenseDAO {
	Logger logger = Logger.getLogger(this.getClass().getName());
	
	 // PharmacyMapper 빈을 주입받습니다.
    @Autowired
    private PharmacyMapper pharmacyMapper;

    
    /**
     * 약국에서 제조 전체 목록을 가져오는 메서드입니다.
     *
     * @param id    약국 ID
     * @param begin 시작 인덱스
     * @param end   끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispenseList(String id,int begin,int end) {
		Map<String, Object> input = new HashMap();
		input.put("id", id);
		input.put("begin", String.valueOf(begin));
		input.put("end", String.valueOf(end));
		logger.info("dbioInput=>"+input);
		
		return pharmacyMapper.getDispenseList(input);
	}
	

	 /**
     * 약국에서 제조 대기 목록을 가져오는 메서드입니다.
     *
     * @param id    약국 ID
     * @param begin 시작 인덱스
     * @param end   끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */	
	@Override
	public List<DispenseDTO> getDispenseWaiting(String id, int begin, int end) {
		
		Map<String, Object> input = new HashMap();
		input.put("id", id);
		input.put("begin", String.valueOf(begin));
		input.put("end", String.valueOf(end));
		logger.info("dbioInput=>"+input);
		
		return pharmacyMapper.getDispenseWaiting(input);
	}
	
	
	 /**
     * 약국에서 제조중 목록을 가져오는 메서드입니다.
     *
     * @param id    약국 ID
     * @param begin 시작 인덱스
     * @param end   끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispensing(String id, int begin, int end) {
		Map<String, Object> input = new HashMap();
		input.put("id", id);
		input.put("begin", String.valueOf(begin));
		input.put("end", String.valueOf(end));
		logger.info("dbioInput=>"+input);
		return pharmacyMapper.getDispensing(input);
	}
	
	 /**
     * 약국에서 제조 완료 목록을 가져오는 메서드입니다.
     *
     * @param id    약국 ID
     * @param begin 시작 인덱스
     * @param end   끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispenseComplete(String id, int begin, int end) {
		Map<String, Object> input = new HashMap();
		input.put("id", id);
		input.put("begin", String.valueOf(begin));
		input.put("end", String.valueOf(end));
		logger.info("dbioInput=>"+input);
		return pharmacyMapper.getDispenseComplete(input);
	}
	
	 /**
     * 약국에서 수령완료 목록을 가져오는 메서드입니다.
     *
     * @param id    약국 ID
     * @param begin 시작 인덱스
     * @param end   끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispensePickUp(String id, int begin, int end) {
		Map<String, Object> input = new HashMap();
		input.put("id", id);
		input.put("begin", String.valueOf(begin));
		input.put("end", String.valueOf(end));
		logger.info("dbioInput=>"+input);
		return pharmacyMapper.getDispensePickUp(input);
	}
	
	 // 약국의 제조상태에 따른 개수를 가져오는 메서드
	@Override
	public DispenseCntDTO getCountByStatus(String id) {
		return pharmacyMapper.getCountByStatus(id);
	}
	
	 // 제조 대기의 승인 작업을 처리하는 메서드들입니다.  pharmacyMapper를 통해 DB에 해당 작업을 수행합니다.
	@Override
	public boolean approveDispense(List<Integer> dispenseIds) {
		return pharmacyMapper.approveDispense(dispenseIds);
	}
	
	// 제조 대기의 거부 작업을 처리하는 메서드들입니다.  pharmacyMapper를 통해 DB에 해당 작업을 수행합니다.
	@Override
	public boolean rejectDispense(List<Integer> dispenseIds) {
		return pharmacyMapper.rejectDispense(dispenseIds);
	}
	
	// 제조 완료 작업을 처리하는 메서드들입니다.  pharmacyMapper를 통해 DB에 해당 작업을 수행합니다.
	@Override
	public boolean finishDispense(List<Integer> dispenseIds) {
		return pharmacyMapper.finishDispense(dispenseIds);
	}
	
	// 수령 완료 작업을 처리하는 메서드들입니다.  pharmacyMapper를 통해 DB에 해당 작업을 수행합니다.
	@Override
	public boolean pickUpFinishDispense(List<Integer> dispenseIds) {
		return pharmacyMapper.pickUpFinishDispense(dispenseIds);
	}
	
}
