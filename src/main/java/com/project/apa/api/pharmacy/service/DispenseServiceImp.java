package com.project.apa.api.pharmacy.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.pharmacy.domain.DispenseCntDTO;
import com.project.apa.api.pharmacy.domain.DispenseDTO;
import com.project.apa.api.pharmacy.persistence.DispenseDAO;
import com.project.apa.mapper.PharmacyMapper;


/**
 * DispenseService 인터페이스를 구현한 DispenseServiceImp 클래스입니다.
 * DispenseDAO를 사용하여 제조 관련 작업을 수행합니다.
 * @author 김민정
 */
@Service
public class DispenseServiceImp implements DispenseService {
	
	 /**
     * DispenseDAO를 주입받아 사용합니다.
     */
    @Autowired
    private DispenseDAO dispenseDAO;
    
    /**
     * DispenseDAO를 주입받는 생성자입니다.
     *
     * @param dispenseDAO DispenseDAO 객체
     */
    @Autowired
    public DispenseServiceImp(DispenseDAO dispenseDAO) {
        this.dispenseDAO = dispenseDAO;
    }
    
    /**
     * 약국에서 제조 목록을 가져오는 메소드입니다.
     *
     * @param id    약국 ID
     * @param begin 가져올 목록의 시작 인덱스
     * @param end   가져올 목록의 끝 인덱스
     * @return 제조 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispenseList(String id,int begin,int end) {
		return dispenseDAO.getDispenseList(id, begin, end);
	}

	/**
     * 약국에서 제조 대기 목록을 가져오는 메소드입니다.
     *
     * @param id    약국 ID
     * @param begin 가져올 목록의 시작 인덱스
     * @param end   가져올 목록의 끝 인덱스
     * @return 제조 대기 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispenseWaiting(String id, int begin, int end) {
		return dispenseDAO.getDispenseWaiting(id, begin, end);
	
	}
	
	
	 /**
     * 약국에서 제조 중인 목록을 가져오는 메소드입니다.
     *
     * @param id    약국 ID
     * @param begin 가져올 목록의 시작 인덱스
     * @param end   가져올 목록의 끝 인덱스
     * @return 제조 중인 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispensing(String id, int begin, int end) {
		return dispenseDAO.getDispensing(id, begin, end);
	}
	
	 /**
     * 약국에서 제조완료 목록을 가져오는 메소드입니다.
     *
     * @param id    약국 ID
     * @param begin 가져올 목록의 시작 인덱스
     * @param end   가져올 목록의 끝 인덱스
     * @return 제조 중인 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispenseComplete(String id, int begin, int end) {
		
		return dispenseDAO.getDispenseComplete(id, begin, end);
	}
	
	 /**
     * 약국에서 수령완료 목록을 가져오는 메소드입니다.
     *
     * @param id    약국 ID
     * @param begin 가져올 목록의 시작 인덱스
     * @param end   가져올 목록의 끝 인덱스
     * @return 제조 중인 목록을 담은 DispenseDTO 리스트
     */
	@Override
	public List<DispenseDTO> getDispensePickUp(String id, int begin, int end) {
		// TODO Auto-generated method stub
		return dispenseDAO.getDispensePickUp(id, begin, end);
	}
	
	/**
	 * DispenseDAO를 통해 약국에서 상태에 따른 제조 건수를 가져오는 기능을 제공합니다.
	 */
	@Override
	public DispenseCntDTO getCountByStatus(String id) {
		// TODO Auto-generated method stub
		return dispenseDAO.getCountByStatus(id);
	}
	
	/**
	 * DispenseDAO를 통해 약국에서 특정 제조건을 승인처리하는 기능을 제공합니다.
	 */
	@Override
	public boolean approveDispense(List<Integer> dispenseIds) {
		// TODO Auto-generated method stub
		 return dispenseDAO.approveDispense(dispenseIds);
	}
	
	/**
	 * DispenseDAO를 통해 약국에서 특정 제조건을 거절처리하는 기능을 제공합니다.
	 */
	@Override
	public boolean rejectDispense(List<Integer> dispenseIds) {
		
		return dispenseDAO.rejectDispense(dispenseIds);
	}
	
	/**
	 * DispenseDAO를 통해 약국에서 특정 제조건을 제조완료 처리하는 기능을 제공합니다.
	 */
	@Override
	public boolean finishDispense(List<Integer> dispenseIds) {

		return dispenseDAO.finishDispense(dispenseIds);
	}
	
	/**
	 * DispenseDAO를 통해 약국에서 특정 제조건을 수령완료 처리하는 기능을 제공합니다.
	 */
	@Override
	public boolean pickUpFinishDispense(List<Integer> dispenseIds) {
		return dispenseDAO.pickUpFinishDispense(dispenseIds);
	}

	 
}
