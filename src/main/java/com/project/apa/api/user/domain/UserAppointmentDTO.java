package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserAppointmentDTO {
	
	private String hospitalName;
	private String doctorName;
	private String patientName;
	private String symptom;
	private String treatmentWay;
	private String appointmentDate;
	private String status;
	
}
