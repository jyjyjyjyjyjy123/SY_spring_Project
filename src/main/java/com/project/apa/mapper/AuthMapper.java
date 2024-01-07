package com.project.apa.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.project.apa.auth.model.AdminMemberDTO;
import com.project.apa.auth.model.HospitalMemberDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.model.PharmacyMemberDTO;

@Mapper
public interface AuthMapper {
	MemberDTO read(String username);
	HospitalMemberDTO hospitalread(String username);
	PharmacyMemberDTO pharmacyread(String username);
	AdminMemberDTO adminread(String username);
//	
////	  테스트
	  @Select ("select * from tbluser") List<MemberDTO> mymy();
	  void encode(MemberDTO dto);
	  
	  @Select ("select * from tblhospital") List<HospitalMemberDTO> myhospital();
	  void encode2(HospitalMemberDTO dto);
	  
	  @Select ("select * from tblpharmacy")List<PharmacyMemberDTO> mypharmacy();
	  void encode3(PharmacyMemberDTO dto);

	  @Select ("select * from tbladmin")List<AdminMemberDTO> myadmin();
	  void encode4(AdminMemberDTO dto);
	  
	  String getuserseq(String userid);
	  

//	

	
	




	

	
	
	 
}
