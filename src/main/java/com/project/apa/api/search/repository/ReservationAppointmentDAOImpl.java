package com.project.apa.api.search.repository;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;
import com.project.apa.mapper.ReservationAppointmentMapper;

@Repository
public class ReservationAppointmentDAOImpl implements ReservationAppointmentDAO{

	@Autowired
	private ReservationAppointmentMapper mapper;

	@Override
	public void addHospitalAppintment(ReservationHospitalAppointmentDTO rhadto) {
		mapper.addHospitalAppintment(rhadto);
		
	}

	@Override
	public void addHospitalAppintmentStatus() {
		mapper.addHospitalAppintmentStatus();
		
	}

	@Override
	public void addPharmacyAppintment(ReservationPharmacyAppointmentDTO rpadto) {
		mapper.addPharmacyAppintment(rpadto);
		
	}

	@Override
	public void addPharmacyAppintmentStatus() {
		mapper.addPharmacyAppintmentStatus();
		
	}
	
}
