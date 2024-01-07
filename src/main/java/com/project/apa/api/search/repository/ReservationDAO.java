package com.project.apa.api.search.repository;

import java.util.List;

import com.project.apa.api.search.model.ChildInfoDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.UserInfoDTO;

public interface ReservationDAO {

	List<HospitalDoctorDTO> finddeptdoc(HospitalDoctorDTO dto);

	UserInfoDTO userlist(String userseq);

	List<ChildInfoDTO> childlist(String userseq);

	ChildInfoDTO childinfo(String childseq);

	List<PharmacyDTO> pharmacylist();

	PharmacyDTO pharmacychoice(String parmacyseq);


}
