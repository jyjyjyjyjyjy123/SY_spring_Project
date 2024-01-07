package com.project.apa.api.hospital.medi.domain;

import lombok.Data;

/**
 * 병원 - 내 진료 기능 중 진료 상세 정보를 나타내는 클래스입니다.
 * 
 * @author Eunha
 *
 */
@Data
public class TreatmentDetailDTO {
	private String appointmentSeq;
	private String hospitalId;

	private String userSeq;
	private String userName;
	private String userRelation;
	private String userSSN;
	private String userTel;
	private String userAddress;

	private String childSeq;
	private String childName;
	private String childSSN;

	private String appointmentDate;
	private String treatmentWay;
	private String departmentName;
	private String doctorName;
	private String symptom;
	private String regdate;

	private String status;

	private String recordSeq;
	private String hospitalName;
	//의사이름
	private String diagnosis;
	private String diseaseCode;
	private String recordContent;
}
