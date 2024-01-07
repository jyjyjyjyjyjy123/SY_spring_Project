package com.project.apa.mapper;

import java.util.List;

import com.project.apa.api.admin.domain.ReportDTO;

public interface ReportMapper {

	List<ReportDTO> postreportlist();

	List<ReportDTO> commentreportlist();

	List<ReportDTO> postreportview(String communityWriter);

	int postreportapprove(ReportDTO dto);

	int postreportdecline(ReportDTO dto);

	int cautionAdd(ReportDTO dto);
	
	int commentreportapprove(ReportDTO dto);
	
	int commentreportdecline(ReportDTO dto);

	List<ReportDTO> commentreportview(String commentWriter);

	int postprivate(ReportDTO dto);

}
