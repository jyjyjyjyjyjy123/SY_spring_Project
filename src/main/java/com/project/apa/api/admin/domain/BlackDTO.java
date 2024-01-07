 package com.project.apa.api.admin.domain;

import lombok.Data;

@Data
public class BlackDTO {
	private String blacklistSeq;
	private int userSeq;
	private String blacklistDate;
	private String blacklistReason;
	
	private String userId;
	private String userName;
}
