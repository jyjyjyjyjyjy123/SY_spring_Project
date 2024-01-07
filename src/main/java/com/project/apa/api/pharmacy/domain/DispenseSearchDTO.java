package com.project.apa.api.pharmacy.domain;

import lombok.Data;

@Data
public class DispenseSearchDTO {
	private String seq;
	private String pharmacyid;
	private String hospitalname;
	private String username;
	private String usertel;
	private String appointmentdate; 
	private String pickupway;
	private String regdate;
	private String dispensestatus;
	private String pickupdate;
	
	
}
