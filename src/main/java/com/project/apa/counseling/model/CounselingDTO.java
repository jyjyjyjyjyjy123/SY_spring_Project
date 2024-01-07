package com.project.apa.counseling.model;

import lombok.Data;

@Data
public class CounselingDTO {
	private int mediCounselQuestionSeq;
	private String counseltitle;
	private String counselcontent;
	private String iscounselanswer;
	private String regdate;
	private String departmentname;
	private String username;
	
	private int mediCounselAnswerSeq;
	private int doctorSeq;
	private String counselAnswerContent;
	private String answerTime;
	private String helpedCount;
	
}

