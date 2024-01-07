package com.project.apa.api.pharmacy.domain;

import lombok.Data;

@Data
public class DispenseCntDTO {
	private int waitingCnt;
	private int dispensingCnt;
	private int dispenseFinCnt;
	private int pickUpFinCnt;
	private String totalCnt;
}
