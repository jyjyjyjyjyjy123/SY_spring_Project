package com.project.apa.api.user.domain;

import java.util.ArrayList;

import lombok.Data;

@Data
public class SelfTestDTO {

	private String meditestQuestionSeq;
	private String meditestQuestionNo;
	private String meditestContent;
	private String meditestAnswerContent;

	private String num;
	private String minScore;
	private String maxScore;
	private String meditestResultContent;

	private String meditestSeq;
	private String userSeq;
	private String meditestTotalScore;
	
	private ArrayList<String> meditestAnswerNo;
	
}
