package com.project.apa.api.search.model;

import lombok.Data;

@Data
public class PharmacyDTO {
	private String pharmacyid;
	private String pharmacyname;
	private String pharmacyaddress;
	private String pharmacyemail;
	private String pharmacytel;
	private String opentime;
	private String closetime;
	private String pharmacydayoff;
	
	private String ispharmarcyholiday;
	private String ispharmarcynightcare;
	
	
}
