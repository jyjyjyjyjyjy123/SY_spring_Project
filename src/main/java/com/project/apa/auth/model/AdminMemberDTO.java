package com.project.apa.auth.model;

import java.util.List;

import lombok.Data;

@Data
public class AdminMemberDTO {

	private String adminId;
	private String adminPw;
	private String adminEmail;
	private String adminTel;
	private List<AuthDTO> authlist;
}
