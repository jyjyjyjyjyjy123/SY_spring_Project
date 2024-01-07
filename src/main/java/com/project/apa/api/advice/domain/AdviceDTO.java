package com.project.apa.api.advice.domain;

import lombok.Data;

@Data
public class AdviceDTO {
	
	private String userid;
	private String counseltitle;
	private String counselcontent;
	private String iscounselanswer;
	private String regdate;
	private String departmentname;
	private int userseq;
	//private int medicounselanswerseq;
	private int seq;
	private int begin;
	private int end;
	
	private String doctorname;
	private String hospitalname;
	private String counselanswercontent;
	private String answerdate;
	private int helpedcount;
	private int departmentseq;
	private String sort;
	

	
	
}
