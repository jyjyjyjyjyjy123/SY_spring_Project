package com.project.apa.api.community.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CommunityCommentDTO {
	
	private String communitycommentseq;
	private String commentseq;
	private String userseq;
	private String userid;
	private String communitycommentcontent;
	private String communitycommentdate;
	private String isreportapproval;
	private String communityseq;
}
