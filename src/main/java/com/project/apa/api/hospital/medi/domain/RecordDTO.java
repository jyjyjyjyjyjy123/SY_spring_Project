package com.project.apa.api.hospital.medi.domain;

import lombok.Data;

/**
 * 진료내역서 정보가 담긴 클래스입니다.
 * 
 * @author Eunha
 *
 */
@Data
public class RecordDTO {
	private String appointmentSeq;

	private String recordSeq;
	private String hospitalId;
	private String hospitalName;
	private String doctorName;
	private String diagnosis;
	private String diseaseCode;
	private String recordContent;
}
