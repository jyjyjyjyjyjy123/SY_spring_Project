package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserDTO {

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
	private String regsiterDate;
	private String isUserUnregister;

	private String userSSNs;
	private String userSSNe;
	private String maskingSSN;
	
	private String userTels;
	private String userTelm;
	private String userTele;
	
	private String inputCurrentPw;
}
