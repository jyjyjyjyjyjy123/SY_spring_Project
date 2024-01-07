package com.project.apa.api.search.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.search.model.ChildInfoDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.UserInfoDTO;
import com.project.apa.mapper.ReservationMapper;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	@Autowired
	private ReservationMapper mapper;

	@Override
	public List<HospitalDoctorDTO> finddeptdoc(HospitalDoctorDTO dto) {
		return mapper.finddeptdoc(dto);
	}

	@Override
	public UserInfoDTO userlist(String userseq) {
		return mapper.userlist(userseq);
	}

	@Override
	public List<ChildInfoDTO> childlist(String userseq) {
		return mapper.childlist(userseq);
	}

	@Override
	public ChildInfoDTO childinfo(String childseq) {
		return mapper.childinfo(childseq);
	}

	@Override
	public List<PharmacyDTO> pharmacylist() {
		return mapper.pharmacylist();
	}

	@Override
	public PharmacyDTO pharmacychoice(String parmacyseq) {
		return mapper.pharmacychoice(parmacyseq);
	}

	
}
