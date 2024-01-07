package com.project.apa.api.search.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;
import com.project.apa.mapper.ReservationAppointmentMapper;


public interface ReservationAppointmentDAO{

	void addHospitalAppintment(ReservationHospitalAppointmentDTO rhadto);

	void addHospitalAppintmentStatus();

	void addPharmacyAppintment(ReservationPharmacyAppointmentDTO rpadto);

	void addPharmacyAppintmentStatus();
	
	
}
