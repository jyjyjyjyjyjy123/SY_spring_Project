package com.project.apa.api.community.persistence;

import java.util.HashMap;
import java.util.List;

import com.project.apa.api.community.domain.CommunityCommentDTO;
import com.project.apa.api.community.domain.CommunityDTO;

public interface CommunityDAO {

	List<CommunityDTO> getCommunityList(HashMap<String, Integer> map);

	CommunityDTO getCommunityInfo(String seq);

	List<CommunityCommentDTO> getCommentList(String seq);


	int commentadd(CommunityCommentDTO dto);

	int commentdel(CommunityCommentDTO dto);

	int getTotalCount();

	List<CommunityDTO> getCommunityAdd();

	int add(CommunityDTO dto);

	





}
