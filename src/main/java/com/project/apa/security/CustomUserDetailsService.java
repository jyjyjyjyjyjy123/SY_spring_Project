package com.project.apa.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.project.apa.auth.model.AdminMemberDTO;
import com.project.apa.auth.model.CustomUser;
import com.project.apa.auth.model.HospitalMemberDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.model.PharmacyMemberDTO;
import com.project.apa.mapper.AuthMapper;


/**
 * Spring Security의 UserDetailsService를 구현한 클래스로, 사용자의 인증 정보를 로드합니다.
 */
public class CustomUserDetailsService implements UserDetailsService{

	   @Autowired
	   private AuthMapper mapper;
	   
	   
	   /**
	     * 사용자명(아이디)을 기반으로 데이터베이스에서 사용자 정보를 조회하고, Spring Security에서 사용할 수 있는 UserDetails로 변환합니다.
	     *
	     * @param username 사용자명(아이디)
	     * @return UserDetails 인터페이스를 구현한 객체
	     * @throws UsernameNotFoundException 지정된 사용자명을 찾을 수 없는 경우 발생
	     */
	   @Override
	   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	      
		  System.out.println(username);
		   
	      //DB 상에서 회원 정보 읽어서 > 인증 객체 대입
	      //username == 아이디
		   
		  String sel = username.substring(0, 1); //1,2,3
		  username = username.substring(1);
		  
		  if (sel.equals("1") || sel.equals("0")) {
			  AdminMemberDTO dto4 = mapper.adminread(username);
			  MemberDTO dto1 = mapper.read(username);
			  System.out.println("안녕" );
			//MemberDTO > 시큐리티에서 사용(변환) > CustomUser
			  
			  System.out.println(dto4 == null);
			  System.out.println(dto1 ==  null);
//			  
			  if(dto1 != null) {
//		      return dto1 != null ? new CustomUser(dto1) : null;

				  System.out.println(dto1.getUserpw());
				  return new CustomUser(dto1);
			  } 
			  else if (dto4 != null) {

//		      return dto4 != null ? new CustomUser(dto4) : null;
				  return new CustomUser(dto4);
			  }
			  
		  } else if (sel.equals("2")) {
			  HospitalMemberDTO dto2 = mapper.hospitalread(username);
			//MemberDTO > 시큐리티에서 사용(변환) > CustomUser
		      return dto2 != null ? new CustomUser(dto2) : null;
		      
		  } else {
			  PharmacyMemberDTO dto3 = mapper.pharmacyread(username);
			//MemberDTO > 시큐리티에서 사용(변환) > CustomUser
		      return dto3 != null ? new CustomUser(dto3) : null;
		  }
		  
		  return null;
	}
	   
	  
}