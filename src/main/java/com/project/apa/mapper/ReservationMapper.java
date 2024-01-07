package com.project.apa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.apa.api.search.model.ChildInfoDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.UserInfoDTO;

public interface ReservationMapper {

	List<HospitalDoctorDTO> finddeptdoc(HospitalDoctorDTO dto);
	
	UserInfoDTO userlist(String userseq);

	List<ChildInfoDTO> childlist(String userseq);

	ChildInfoDTO childinfo(String childseq);

	List<PharmacyDTO> pharmacylist();

	void addHospitalAppintment(ReservationHospitalAppointmentDTO rhadto);

	PharmacyDTO pharmacychoice(String parmacyseq);

}
