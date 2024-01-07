package com.project.apa.api.community.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.community.domain.CommunityCommentDTO;
import com.project.apa.api.community.domain.CommunityDTO;
import com.project.apa.api.community.persistence.CommunityDAO;

@Service
public class CommunityService {
	
	@Autowired
	private CommunityDAO communitydao;
    /**
     * 커뮤니티 글 목록을 가져오는 메서드
     * @param map 페이징을 위한 파라미터를 담은 HashMap
     * @return 커뮤니티 글 목록
     */
	public List<CommunityDTO> getCommunityList(HashMap<String, Integer> map) {
		
		return communitydao.getCommunityList(map);
	}
    /**
     * 특정 커뮤니티 글의 정보를 가져오는 메서드
     * @param seq 커뮤니티 글 번호
     * @return 커뮤니티 글 정보
     */
	public CommunityDTO getCommunityInfo(String seq) {
		
		return communitydao.getCommunityInfo(seq);
	}
    /**
     * 특정 커뮤니티 글에 대한 댓글 목록을 가져오는 메서드
     * @param seq 커뮤니티 글 번호
     * @return 댓글 목록
     */
	public List<CommunityCommentDTO> getCommentList(String seq) {
		
		return communitydao.getCommentList(seq);
	}

    /**
     * 댓글 추가하는 메서드
     * @param dto 댓글 정보
     * @return 추가 결과 코드
     */
	public int commentadd(CommunityCommentDTO dto) {
		
		return communitydao.commentadd(dto);
	}
    /**
     * 댓글 삭제하는 메서드
     * @param dto 댓글 정보
     * @return 삭제 결과 코드
     */
	public int commentdel(CommunityCommentDTO dto) {
		
		return communitydao.commentdel(dto);
	}
    /**
     * 전체 커뮤니티 글 수를 가져오는 메서드
     * @return 전체 글 수
     */
	public int getTotalCount() {
		
		return communitydao.getTotalCount();
	}
    /**
     * 추가된 커뮤니티 글 목록을 가져오는 메서드
     * @return 추가된 글 목록
     */
	public List<CommunityDTO> getCommunityAdd() {
		
		return communitydao.getCommunityAdd();
	}
    /**
     * 커뮤니티 글을 추가하는 메서드
     * @param dto 커뮤니티 글 정보
     * @return 추가 결과 코드
     */
	public int add(CommunityDTO dto) {
		
		return communitydao.add(dto);
	}


	
}
