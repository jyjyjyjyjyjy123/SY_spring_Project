package com.project.apa.api.search.model;

import lombok.Data;

@Data
public class ChildInfoDTO {
	private String childseq;
	private String userseq;
	private String childname;
	private String childssn;
	private String ischildunregister;
	
	private String firstssn;
	private String lastssn;
}
