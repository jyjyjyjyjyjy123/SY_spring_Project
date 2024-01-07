package com.project.apa.api.pharmacy.persistence;

import java.util.ArrayList;
import java.util.List;

import com.project.apa.api.pharmacy.domain.DispenseCntDTO;
import com.project.apa.api.pharmacy.domain.DispenseDTO;

public interface DispenseDAO {
	List<DispenseDTO> getDispenseList(String id,int begin,int end);

	List<DispenseDTO> getDispenseWaiting(String id, int begin, int end);

	List<DispenseDTO> getDispensing(String id, int begin, int end);

	List<DispenseDTO> getDispenseComplete(String id, int begin, int end);

	List<DispenseDTO> getDispensePickUp(String id, int begin, int end);

	DispenseCntDTO getCountByStatus(String id);

	boolean approveDispense(List<Integer> dispenseIds);

	boolean rejectDispense(List<Integer> dispenseIds);

	boolean finishDispense(List<Integer> dispenseIds);

	boolean pickUpFinishDispense(List<Integer> dispenseIds);




}
