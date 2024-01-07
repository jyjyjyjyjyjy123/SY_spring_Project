package com.project.apa.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.ReviewDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;
import com.project.apa.api.search.repository.InfoDAO;
import com.project.apa.api.search.repository.SearchDAO;
import com.project.apa.auth.model.AuthDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.repository.AuthDAO;


/**
 * 사용자 인증과 관련된 비즈니스 로직을 처리하는 서비스 클래스
 */

@Service
public class AuthService {
	
	@Autowired
	private AuthDAO authdao;

}
