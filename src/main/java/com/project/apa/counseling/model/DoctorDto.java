package com.project.apa.counseling.model;

import lombok.Data;

@Data
public class DoctorDto {
	private String doctorSeq;
	private String hospitalId;
	private String doctorName;
	private String departmentSeq;
	private String doctorImage;
	private String workStatus;
	private String hospitalName;
}
