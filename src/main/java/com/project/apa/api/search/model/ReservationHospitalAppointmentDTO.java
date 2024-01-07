package com.project.apa.api.search.model;

import lombok.Data;

@Data
public class ReservationHospitalAppointmentDTO {
	private String appointmentseq;
	private String hospitalid;
	private String userseq;
	private String childseq;
	private String treatmentway;
	private String doctorseq;
	private String appointmentdate;
	private String regdate;
	private String symptom;
}
