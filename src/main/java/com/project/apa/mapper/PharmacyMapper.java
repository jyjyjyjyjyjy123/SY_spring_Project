package com.project.apa.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.apa.api.pharmacy.domain.DispenseCntDTO;
import com.project.apa.api.pharmacy.domain.DispenseDTO;
import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;

public interface PharmacyMapper {
    PharmacyInfoDTO getPharmacyInfo(String id);

	ArrayList<DispenseDTO> getDispenseList(Map<String, Object> input);

	PharmacyInfoDTO getPharmacyOpeningInfo(String id);

	List<DispenseDTO> getDispenseWatiting(Map<String, Object> input);
	List<DispenseDTO> getDispensing(Map<String, Object> input);

	List<DispenseDTO> getDispenseComplete(Map<String, Object> input);

	List<DispenseDTO> getDispensePickUp(Map<String, Object> input);

	DispenseCntDTO getCountByStatus(String id);

	boolean approveDispense(List<Integer> dispenseIds);

	boolean rejectDispense(List<Integer> dispenseIds);

	boolean finishDispense(List<Integer> dispenseIds);

	boolean pickUpFinishDispense(List<Integer> dispenseIds);

	List<DispenseDTO> getDispenseWaiting(Map<String, Object> input);

	

	

	



}
