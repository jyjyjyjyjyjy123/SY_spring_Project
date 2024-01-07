package com.project.apa.auth.model;

import lombok.Data;

@Data
public class AuthDTO {
	
	private String userid;
	private int userseq;
	private String userauth;
	
	private String hospitalid;
	private String hospitalauth;
	
	private String pharmacyid;
	private String pharmacyauth;
	
	private String adminid;
	private String adminauth;
}
