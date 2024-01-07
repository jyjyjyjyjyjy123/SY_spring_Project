package com.project.apa.api.hospital.medi.domain;

import lombok.Data;

/**
 * 병원 - 내 진료 기능 중 예약 목록 정보를 나타내는 클래스입니다.
 * 
 * @author Eunha
 *
 */
@Data
public class AppointmentListDTO {
	private String rnum;
	private String appointmentSeq;
	private String userName;
	private String childName;
	private String hospitalId;
	private String treatmentWay;
	private String appointmentDate;
	private String doctorName;
	private String symptom;
	private String regdate;
	private String status;
}
