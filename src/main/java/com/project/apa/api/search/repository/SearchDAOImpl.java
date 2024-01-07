package com.project.apa.api.search.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;
import com.project.apa.mapper.SearchMapper;

@Repository
public class SearchDAOImpl implements SearchDAO {
	@Autowired
	private SearchMapper mapper;

	public List<SelfsymtomDTO> symtomlist() {
		return mapper.symtomlist();
	}

	public List<String> findsystomlist(FindHospitalDTO dto) {
		return mapper.findsystomlist(dto);
	} 
	
	public List<HospitalInfoDTO> findHospitalList(List<String> findsystomlist) {
		return mapper.findHospitalList(findsystomlist);
	}

	@Override
	public List<SelfsymtomDTO> deptlist() {
		return mapper.deptlist();
	}

	@Override
	public List<HospitalInfoDTO> findHospitalList2(String deptseq) {
		return mapper.findHospitalList2(deptseq);
	}

	@Override
	public List<SelfsymtomDTO> finddept(HospitalInfoDTO dto) {
		return mapper.finddept(dto);
	}

	@Override
	public PharmacyDTO pharmacyinfo(String seq) {
		return mapper.pharmacyinfo(seq);
	}

	
}
