package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserDetailRecordDTO {

	private String hospitalName;
	private String userName;
	private String patientName;
	private String diagnosis;
	private String diseaseCode;
	private String appointmentDate;
}
