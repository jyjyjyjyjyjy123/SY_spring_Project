package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserRecordDTO {

	private String appointmentSeq;
	private String hospitalName;
	private String doctorName;
	private String diagnosis;
	private String appointmentDate;
	private String reviewSeq;
}
