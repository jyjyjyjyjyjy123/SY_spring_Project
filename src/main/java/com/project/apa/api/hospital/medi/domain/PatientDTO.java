package com.project.apa.api.hospital.medi.domain;

import lombok.Data;

/**
 * 병원의 내원 환자 정보가 담긴 클래스입니다.
 * 
 * @author Eunha
 *
 */
@Data
public class PatientDTO {

	private String tblUser;
	private String userSeq;
	private String userName;
	private String userSSN;
	private String userId;
	private String userPw;
	private String userTel;
	private String userAddress;
	private String userEmail;
	private String userRelation;
	private String registerDate;
	private String isUserUnregister;
}
