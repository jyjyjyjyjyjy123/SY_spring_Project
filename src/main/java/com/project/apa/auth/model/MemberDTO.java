package com.project.apa.auth.model;

import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	
	//일반회원
	private int userseq;
	private String username;
	private String userssn;
	private String userid;
	private String userpw;
	private String usertel;
	private String useraddress;
	private String useremail;
	private String userrelation;
	private String usercautioncount;
	private String registerdate;
	private String isuserunregister;
	
	private String ssn1;
	private String ssn2;

	private String tel1;
	private String tel2;
	private String tel3;
	
	private String addr1;
	private String addr2;
	//병원회원
	
	
	private List<AuthDTO> authlist;
	
}
