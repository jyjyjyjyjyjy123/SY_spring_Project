package com.project.apa.counseling.model;

import lombok.Data;

@Data
public class CounselingPageDTO {
	private String search;
    private String column;   //필요없을걸?
    private String word;
    
    private int page;
    private int totalCount;
    private int pageSize; // 페이지 당 글 개수
    private int totalPage;
    private int begin;
    private int end;
    private String pagebar;
    
    private String id;
    
    // 검열
    private String price;
}
