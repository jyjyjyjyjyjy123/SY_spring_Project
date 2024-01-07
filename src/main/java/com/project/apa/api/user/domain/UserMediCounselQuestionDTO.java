package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserMediCounselQuestionDTO {
	
	private String mediCounselBoxSeq;
	private String mediCounselQuestionSeq;
	private String mediCounselAnswerSeq;
	private String departmentName;
	private String counselTitle;
	private String regdate;
	private String userId;
	private String counselContent;
	private String counselAnswerContent;
	private String doctorName;
	private String hospitalName;
	private String answerTime;
	
}
