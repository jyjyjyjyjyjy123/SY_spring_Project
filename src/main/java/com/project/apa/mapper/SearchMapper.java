package com.project.apa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;

public interface SearchMapper {
	
	@Select("select * from tblselfsymtom")
	List<SelfsymtomDTO> symtomlist();

	List<String> findsystomlist(FindHospitalDTO dto);
	
	List<HospitalInfoDTO> findHospitalList(List<String> findsystomlist);

	@Select("select * from tbldepartment")
	List<SelfsymtomDTO> deptlist();

	List<HospitalInfoDTO> findHospitalList2(String deptseq);

	List<SelfsymtomDTO> finddept(HospitalInfoDTO dto);

	PharmacyDTO pharmacyinfo(String seq);


}
