package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserChildDTO {
	private String childSeq;
	private String userSeq;
	private String childName;
	private String childSSN;
	private String userRelation;

	private String childSSNs;
	private String childSSNe;
}
