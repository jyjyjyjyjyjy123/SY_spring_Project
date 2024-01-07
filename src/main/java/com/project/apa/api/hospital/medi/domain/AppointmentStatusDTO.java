package com.project.apa.api.hospital.medi.domain;

import lombok.Data;

/**
 * 병원 - 내 진료 기능 중 예약상태 정보를 나타내는 클래스입니다.
 * 
 * @author Eunha
 *
 */
@Data
public class AppointmentStatusDTO {
	private String appointmentStatusSeq;
	private String appointmentSeq;
	private String status;
}
