package com.project.apa.api.community.domain;

import lombok.Data;

@Data
public class CommunityDTO {
	
	private String communityseq;
	private String userseq;
	private String userid;
	private String communitydate;
	private String communitytitle; 
	private String communitycontent;
	private String isreportapproval;
	private String communitylikecount;
	private String communitycommentcount;
	
}
