package com.project.apa.api.search.repository;

import java.util.List;

import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;

public interface SearchDAO {

	List<SelfsymtomDTO> symtomlist();

	List<String> findsystomlist(FindHospitalDTO dto);

	List<HospitalInfoDTO> findHospitalList(List<String> findsystomlist);

	List<SelfsymtomDTO> deptlist();

	List<HospitalInfoDTO> findHospitalList2(String deptseq);

	List<SelfsymtomDTO> finddept(HospitalInfoDTO dto);

	PharmacyDTO pharmacyinfo(String seq);

}
