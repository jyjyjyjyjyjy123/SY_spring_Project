package com.project.apa.auth.model;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class CustomUser extends User{

	private MemberDTO dto1;
	private HospitalMemberDTO dto2;
	private PharmacyMemberDTO dto3;
	private AdminMemberDTO dto4;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberDTO dto) {		
		super(dto.getUserid(), dto.getUserpw(), dto.getAuthlist().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getUserauth())).collect(Collectors.toList()));
		
		this.dto1= dto;
	}
	
	public CustomUser(HospitalMemberDTO dto) {
		super(dto.getHospitalId(), dto.getHospitalPw(), dto.getAuthlist().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getHospitalauth())).collect(Collectors.toList()));
		this.dto2= dto;
	}
	
	public CustomUser(PharmacyMemberDTO dto) {
		super(dto.getPharmacyId(), dto.getPharmacyPw(), dto.getAuthlist().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getPharmacyauth())).collect(Collectors.toList()));
		this.dto3= dto;
	}	

	public CustomUser(AdminMemberDTO dto) {
		super(dto.getAdminId(), dto.getAdminPw(), dto.getAuthlist().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAdminauth())).collect(Collectors.toList()));
		this.dto4= dto;
	}		
	
}
