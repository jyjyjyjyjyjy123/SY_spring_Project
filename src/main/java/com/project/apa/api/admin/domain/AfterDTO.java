package com.project.apa.api.admin.domain;

import lombok.Data;

@Data
public class AfterDTO {

	private String hospitalId;
	private String hospitalName;
	private String hospitalSSN;
	private String hospitalAddress;
	private String hospitalEmail;
	private String hospitalTel;
	private String isHospitalUnregister;
	private String hospitalJoinDate;
	
	private String totalTags;
	private String positiveTags;
	private String negativeTags;
	private String negativePercentage;
	
	/*
	private String userId;
	private String reviewContent;
	private String revRegdate;
	*/
}
