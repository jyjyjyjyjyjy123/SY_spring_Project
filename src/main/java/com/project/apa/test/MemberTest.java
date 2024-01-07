package com.project.apa.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.apa.auth.model.AdminMemberDTO;
import com.project.apa.auth.model.HospitalMemberDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.model.PharmacyMemberDTO;
import com.project.apa.mapper.AuthMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTest {

	@Autowired
	private AuthMapper mapper;

	@Autowired
	private PasswordEncoder encoder;

	@Test
	public void testInsertMember() {

		List<MemberDTO> list = mapper.mymy();

		for (MemberDTO dto : list) {
			dto.setUserpw(encoder.encode(dto.getUserpw()));
			System.out.println(dto.getUserpw());
			mapper.encode(dto);
		}

	}

	@Test
	public void testencodehospital() {
		List<HospitalMemberDTO> list = mapper.myhospital();
		for (HospitalMemberDTO dto : list) {
			dto.setHospitalPw(encoder.encode(dto.getHospitalPw()));
			System.out.println(dto.getHospitalPw());
			mapper.encode2(dto);
		}
	}

	@Test
	public void testencodepharmacy() {
		List<PharmacyMemberDTO> list = mapper.mypharmacy();
		for (PharmacyMemberDTO dto : list) {
			dto.setPharmacyPw(encoder.encode(dto.getPharmacyPw()));
			System.out.println(dto.getPharmacyPw());
			mapper.encode3(dto);
		}
	}

	@Test
	public void testencodeadmin() {
		List<AdminMemberDTO> list = mapper.myadmin();
		for (AdminMemberDTO dto : list) {
			dto.setAdminPw(encoder.encode(dto.getAdminPw()));
			System.out.println(dto.getAdminPw());
			mapper.encode4(dto);
		}
	}

}
