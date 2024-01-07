package com.project.apa.counseling.model;

import java.util.List;

import com.project.apa.api.search.model.SelfsymtomDTO;

import lombok.Data;

@Data
public class HospitalInfoDTO {
	private String hospitalid;
	private String hospitalpw;
	private String hospitalname;
	private String hospitalssn;
	private String hospitaladdress;
	private String hospitalemail;
	private String hospitaltel;
	private String hospitaljoindate;
	private String face;
	private String unface;
	private String housecall;
	private String vaccination;
	private String ishealthcheck;
	private String ishospitalnightcare;
	private String ishospitalholiday;
	private String opentime;
	private String closetime;
	private String restopentime;
	private String restclosetime;
	private String hospitaldayoff;
	
	private List<SelfsymtomDTO> deptlist;
}
