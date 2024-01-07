package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserBookmarkDTO {
	
	private String userSeq;
	private String bookmarkSeq;
	private String hospitalId;
	private String hospitalName;
	private String openTime;
	private String closeTime;
	private String hospitalAddress;
	private String openCheck;
	
}
