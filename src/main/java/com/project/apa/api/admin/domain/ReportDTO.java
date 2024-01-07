package com.project.apa.api.admin.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReportDTO {

	private String postReportSeq;
	private String communitySeq;
	private String communityWriterSeq;
	private String communityWriter;
	private String postReportContent;
	private String postReportDate;
	private String postReportType;
	private String isPostReportStatus;	
	private String isReportApproval;
	
	private String commentReportSeq;
	private String communityCommentSeq;
	private String commentWriterSeq;
	private String commentWriter;
	private String commentReportContent;
	private String commentReportDate;
	private String isCommentReportStatus;
	private String communityCommentContent;
	private String communityCommentDate;
	
	private String userSeq;
	private String userId;
	private String reportUserId;
	private String reportUserName;
	private String reportCount;
	
	private String communityTitle;
	private String communityContent;
	private String communityLikeCount;
	
	private String blacklistReason;
}
