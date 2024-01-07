package com.project.apa.mapper;

import java.util.List;

import com.project.apa.api.admin.domain.AfterDTO;
import com.project.apa.api.admin.domain.BlackDTO;
import com.project.apa.api.admin.domain.MemberDTO;

public interface AdminMemberMapper {

	List<MemberDTO> userInfo();

	List<MemberDTO> hospitalInfo();

	List<MemberDTO> pharmacyInfo();
	

}
