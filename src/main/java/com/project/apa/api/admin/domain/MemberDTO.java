package com.project.apa.api.admin.domain;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String userSeq;
	private String userName;
	private String userSSN;
	private String userId;
	private String userPw;
	private String userTel;
	private String userAddress;
	private String userEmail;
	private String userRelation;
	private String userCautionCount;
	private String registerDate;
	private String isUserUnregister;

	
	private String hospitalId;
	private String hospitalPw;
	private String hospitalName;
	private String hospitalSSN;
	private String hospitalAddress;
	private String hospitalEmail;
	private String hospitalTel;
	private String hospitalJoinDate;
	private String isHospitalUnregister;
	
	private String pharmacyId;
	private String pharmacyPw;
	private String pharmacyName;
	private String pharmacySSN;
	private String pharmacyAddress;
	private String pharmacyEmail;
	private String pharmacyTel;
	private String regdate;
	private String isPharmacyUnregister;

}
