package com.project.apa.api.user.domain;

import lombok.Data;

@Data
public class UserMyCommunityDTO {
	
	private String communitySeq;
	private String communityTitle;
	private String communityContent;
	private String communityCommentCount;
	private String communityLikeCount;
	private String communityDate;
	private String communityCommentContent;
	private String communityCommentDate;
	private String userID;
	
}
