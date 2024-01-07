package com.project.apa.mapper;

import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;

public interface ReservationAppointmentMapper {

	void addHospitalAppintment(ReservationHospitalAppointmentDTO rhadto);

	void addHospitalAppintmentStatus();

	void addPharmacyAppintment(ReservationPharmacyAppointmentDTO rpadto);

	void addPharmacyAppintmentStatus();

}
