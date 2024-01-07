package com.project.apa.auth.model;

import java.util.List;

import lombok.Data;

@Data
public class PharmacyMemberDTO {

	private String pharmacyId;
	private String pharmacyPw;
	private String pharmacyName;
	private String pharmacySsn;
	private String pharmacyAddress;
	private String pharmacyEmail;
	private String pharmacyTel;
	private String isDispense;
	private String regDate;
	private String isPharmacyUnRegister;
	
	private String ssn1;
	private String ssn2;
	private String ssn3;
	
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String addr1;
	private String addr2;
	
	private List<AuthDTO> authlist;
}

