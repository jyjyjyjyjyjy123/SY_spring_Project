package com.project.apa.api.search.model;

import lombok.Data;

@Data
public class ReviewDTO {
	private String hospitalId;
	private String reviewContent;
	private String userId;
	
	private String reviewSeq;
	
	private String tagContent;
	private String tagType;	
}
