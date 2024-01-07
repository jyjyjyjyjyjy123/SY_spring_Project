package com.project.apa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.project.apa.counseling.model.CounselingDTO;
import com.project.apa.counseling.model.DoctorDto;

public interface CounselingMapper {

	
	@Select ("select * from tbldoctor where hospitalid = #{hospitalId} and workstatus = 'y'")
	List<DoctorDto> getDoctors(String hospitalId);
	
	CounselingDTO get(int mediCounselQuestionSeq);
	
	List<CounselingDTO> counselingwaitinglist(DoctorDto dto);

	void answeradd(CounselingDTO counselingdto);
	
	void answerupdate(CounselingDTO counselingdto);

	CounselingDTO getcomplete(int mediCounselQuestionSeq);
	
}
