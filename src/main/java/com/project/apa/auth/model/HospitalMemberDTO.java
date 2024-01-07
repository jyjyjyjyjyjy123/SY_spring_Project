package com.project.apa.auth.model;

import java.util.List;

import lombok.Data;

@Data
public class HospitalMemberDTO {

	private String hospitalId;
	private String hospitalPw;
	private String hospitalName;
	private String hospitalSsn;
	private String hospitalAddress;
	private String hospitalEmail;
	private String hospitalTel;
	private String hospitalJoinDate;
	private String isHospitalUnRegister;
	
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
