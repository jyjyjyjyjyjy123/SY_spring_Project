package com.project.apa.api.community.persistence;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.community.domain.CommunityCommentDTO;
import com.project.apa.api.community.domain.CommunityDTO;
import com.project.apa.mapper.CommunityMapper;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Autowired
	private CommunityMapper communityMapper;
    /**
     * 커뮤니티 목록을 가져오는 메서드
     * @param map 페이징을 위한 파라미터를 담은 HashMap
     * @return 커뮤니티 목록
     */	
	@Override
	public List<CommunityDTO> getCommunityList(HashMap<String, Integer> map) {
		
		return communityMapper.getCommunityList(map);
	}
    /**
     * 특정 커뮤니티 글의 정보를 가져오는 메서드
     * @param seq 커뮤니티 글 번호
     * @return 커뮤니티 글 정보
     */
	@Override
	public CommunityDTO getCommunityInfo(String seq) {
		
		return communityMapper.getCommunityInfo(seq);
	}
    /**
     * 특정 커뮤니티 글에 대한 댓글 목록을 가져오는 메서드
     * @param seq 커뮤니티 글 번호
     * @return 댓글 목록
     */
	@Override
	public List<CommunityCommentDTO> getCommentList(String seq) {
		return communityMapper.getCommentList(seq);
	}

	/**
     * 댓글 추가하는 메서드
     * @param dto 댓글 정보
     * @return 추가 결과 코드
     */	
	@Override
	public int commentadd(CommunityCommentDTO dto) {
		
		return communityMapper.commentadd(dto);
	}
    /**
     * 댓글 삭제하는 메서드
     * @param dto 댓글 정보
     * @return 삭제 결과 코드
     */	
	@Override
	public int commentdel(CommunityCommentDTO dto) {
		
		return communityMapper.commentdel(dto);
	}
    /**
     * 전체 커뮤니티 글 수를 가져오는 메서드
     * @return 전체 글 수
     */
	@Override
	public int getTotalCount() {
		
		return communityMapper.getTotalCount();
	}
    /**
     * 추가된 커뮤니티 글 목록을 가져오는 메서드
     * @return 추가된 글 목록
     */
	@Override
	public List<CommunityDTO> getCommunityAdd() {
		
		return communityMapper.getCommunityAdd();
	}
    /**
     * 커뮤니티 글을 추가하는 메서드
     * @param dto 커뮤니티 글 정보
     * @return 추가 결과 코드
     */	
	@Override
	public int add(CommunityDTO dto) {
		
		return communityMapper.add(dto);
	}
	
	
}
