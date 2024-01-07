package com.project.apa.mapper;


import java.util.List;

import com.project.apa.auth.model.AuthDTO;
import com.project.apa.auth.model.HospitalMemberDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.model.PharmacyMemberDTO;

public interface MemberMapper {


	void addAuth(AuthDTO adto);

	MemberDTO read(String username);

	int addUser(MemberDTO memberdto);

	int addPharmacy(PharmacyMemberDTO pharmacydto);

	int addHospital(HospitalMemberDTO hospitaldto);

	MemberDTO getUser(MemberDTO dto);

	HospitalMemberDTO getHospital(HospitalMemberDTO hospitaldto);

	void addHospitalAuth(AuthDTO adto);

	PharmacyMemberDTO getPharmacy(PharmacyMemberDTO pharmacydto);

	void addPharmacyAuth(AuthDTO adto);
	

}
