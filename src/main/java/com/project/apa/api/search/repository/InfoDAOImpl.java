package com.project.apa.api.search.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.search.model.BookMarkDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.ReviewDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;
import com.project.apa.mapper.InfoMapper;
import com.project.apa.mapper.SearchMapper;

@Repository
public class InfoDAOImpl implements InfoDAO {

	@Autowired
	private InfoMapper mapper;


	public HospitalInfoDTO hospitalInfo(String seq) {
		return mapper.hospitalInfo(seq);
	}

	public List<SelfsymtomDTO> deptlist(String seq) {
		return mapper.deptlist(seq);
	}

	public List<HospitalDoctorDTO> doclist(String seq) {
		return mapper.doclist(seq);
	}

	public List<ReviewDTO> reviewlist(String seq) {
		return mapper.reviewlist(seq);
	}

	public List<ReviewDTO> reviewtaglist(String seq) {
		return mapper.reviewtaglist(seq);
	}

	@Override
	public int bookmarkin(BookMarkDTO dto) {
		return mapper.bookmarkin(dto);
	}

	@Override
	public List<BookMarkDTO> bookmarkcount(String seq) {
		return mapper.bookmarkcount(seq);
	}

	@Override
	public int bookmarkout(BookMarkDTO dto) {
		return mapper.bookmarkout(dto);
	}

	@Override
	public HospitalInfoDTO basichospitalInfo() {
		return mapper.basichospitalInfo();
	}

	
}
