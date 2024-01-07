package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserReviewDTO {
	private String hospitalName;
	private String doctorName;
	private String treatmentWay;
	private String appointmentDate;
	
	private String appointmentSeq;
	private String reviewContent;
	private String tagSeq;

	private String tagList;
	private String reviewSeq;

	private String isReviewDelete;
	
	private String tagType;
	private String tagContent;
	
}
