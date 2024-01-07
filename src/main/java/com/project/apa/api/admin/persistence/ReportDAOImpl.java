package com.project.apa.api.admin.persistence;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.admin.domain.ReportDTO;
import com.project.apa.mapper.ReportMapper;

@Repository
public class ReportDAOImpl implements ReportDAO {
	
	@Autowired
	private ReportMapper mapper;

	@Override
	public List<ReportDTO> postreportlist() {
		return mapper.postreportlist();
	}
	
	@Override
	public List<ReportDTO> commentreportlist() {
		return mapper.commentreportlist();
	}

	@Override
	public int postreportapprove(ReportDTO dto) {
		return mapper.postreportapprove(dto);
	}
	
	@Override
	public int postreportdecline(ReportDTO dto) {
		return mapper.postreportdecline(dto);
	}
	
	@Override
	public int cautionAdd(ReportDTO dto) {
		return mapper.cautionAdd(dto);
	}	

	@Override
	public int commentreportapprove(ReportDTO dto) {
		return mapper.postreportapprove(dto);
	}
	
	@Override
	public int commentreportdecline(ReportDTO dto) {
		return mapper.postreportdecline(dto);
	}
	
	@Override
	public List<ReportDTO> postreportview(String communityWriter) {
		return mapper.postreportview(communityWriter);
	}
	
	@Override
	public List<ReportDTO> commentreportview(String commentWriter) {
		return mapper.commentreportview(commentWriter);
	}
	
	@Override
	public int postprivate(ReportDTO dto) {
		return mapper.postprivate(dto);
	}
	
}
