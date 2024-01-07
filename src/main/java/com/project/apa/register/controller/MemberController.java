package com.project.apa.register.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.apa.auth.model.AuthDTO;
import com.project.apa.auth.model.HospitalMemberDTO;
import com.project.apa.auth.model.MemberDTO;
import com.project.apa.auth.model.PharmacyMemberDTO;
import com.project.apa.mapper.MemberMapper;

/**
 * 회원가입 및 관련 기능을 처리하는 컨트롤러 클래스입니다.
 */
@Controller
public class MemberController {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private MemberMapper mapper;

	
	 /**
     * 회원가입 화면으로 이동하는 메서드
     * @param model Spring MVC Model 객체
     * @return auth.clickregister 뷰 페이지
     */
	@GetMapping(value = "/auth/clickregister.do")
	public String clickRegister(Model model) {
		
		return "auth.clickregister";
	}
	
	 /**
     * 일반 사용자 회원가입 화면으로 이동하는 메서드
     * @param model Spring MVC Model 객체
     * @return auth.userregister 뷰 페이지
     */
	@GetMapping(value = "/auth/userregister.do")
	public String userRegister(Model model) {
		
		return "auth.userregister";
	}
	
	  /**
     * 병원 회원가입 화면으로 이동하는 메서드
     * @param model Spring MVC Model 객체
     * @return auth.hospitalregister 뷰 페이지
     */
	@GetMapping(value = "/auth/hospitalregister.do")
	public String hospitalRegister(Model model) {
		
		return "auth.hospitalregister";
	}
	
	/**
     * 약국 회원가입 화면으로 이동하는 메서드
     * @param model Spring MVC Model 객체
     * @return auth.pharmacyregister 뷰 페이지
     */
	@GetMapping(value = "/auth/pharmacyregister.do")
	public String pharmacyRegister(Model model) {
		
		return "auth.pharmacyregister";
	}
	
	/**
     * 일반 사용자 회원가입 처리 메서드
     * @param model Spring MVC Model 객체
     * @param memberdto MemberDTO 객체
     * @param auth 회원 권한
     * @return 회원가입 성공 시 auth/mylogin.do로 리다이렉트
     */
	@PostMapping(value = "/auth/userregisterok.do")
	public String userRegisterok(Model model, MemberDTO memberdto, String auth) {
		
		
		
	    if (auth.equals("user")) {
	    	
	    	
	    	String userId = memberdto.getUserid();
	    	String userPw = memberdto.getUserpw();
			String userName = memberdto.getUsername();
			
			String ssn1 = memberdto.getSsn1();
			String ssn2 = memberdto.getSsn2();
			String userSsn = ssn1 + "-" + ssn2;

			String tel1 = memberdto.getTel1();
			String tel2 = memberdto.getTel2();
			String tel3 = memberdto.getTel3();

			String userTel = tel1 + "-" + tel2 + "-" + tel3;
			String userEmail = memberdto.getUseremail();
			
			
			
			String addr1 = memberdto.getAddr1();
			String addr2 = memberdto.getAddr2();
			
			String userAddress = addr1 + addr2;
			
			System.out.println(userAddress);
			
			memberdto.setUserid(userId);
			memberdto.setUserpw(userPw);
			memberdto.setUsername(userName);
			memberdto.setUserssn(userSsn);
			memberdto.setUsertel(userTel);
			memberdto.setUseremail(userEmail);
			memberdto.setUseraddress(userAddress);

			
			System.out.println(userId);
			
			MemberDTO user = mapper.getUser(memberdto);

			if(user != null && memberdto.getUserid().equals(user.getUserid())){
//				 model.addAttribute("errorMessage", "이미 존재하는 사용자입니다.");
				 return "redirect:/auth/userregister.do";
			}

	        // 회원 가입 로직
	        memberdto.setUserpw(encoder.encode(memberdto.getUserpw()));
	        int result = mapper.addUser(memberdto);
	        
	        //방금회원가입한 사용자의 번호를 가져와서 어스 테이블에 넣어주고 싶어

	        // 권한 추가
	        if (result > 0) {
	        	//회원가입 성공했을 때 유저 테이블에서 조회하기
	        	memberdto = mapper.getUser(memberdto);
	        	
	            AuthDTO adto = new AuthDTO();
	            adto.setUserseq(memberdto.getUserseq());
	            adto.setUserauth("ROLE_USER");
	            mapper.addAuth(adto);
	        }
	    }


	    return "redirect:/auth/mylogin.do";
	}
	
	
	 /**
     * 병원 회원가입 처리 메서드
     * @param model Spring MVC Model 객체
     * @param hospitaldto HospitalMemberDTO 객체
     * @param auth 회원 권한
     * @return 회원가입 성공 시 auth/mylogin.do로 리다이렉트
     */
	@PostMapping(value = "/auth/hospitalregisterok.do")
	public String hospitalRegisterok(Model model, HospitalMemberDTO hospitaldto, String auth) {
		
		
		
	    if (auth.equals("hospital")) {
	    	
	    	
	    	String hospitalId = hospitaldto.getHospitalId();
	    	String hospitalPw = hospitaldto.getHospitalPw();
			String hospitalName = hospitaldto.getHospitalName();
			
			String ssn1 = hospitaldto.getSsn1();
			String ssn2 = hospitaldto.getSsn2();
			String ssn3 = hospitaldto.getSsn3();
			String hospitalSsn = ssn1 + "-" + ssn2 + "-" + ssn3;

			String tel1 = hospitaldto.getTel1();
			String tel2 = hospitaldto.getTel2();
			String tel3 = hospitaldto.getTel3();

			String hospitalTel = tel1 + "-" + tel2 + "-" + tel3;
			String hospitalEmail = hospitaldto.getHospitalEmail();
			
			
			
			String addr1 = hospitaldto.getAddr1();
			String addr2 = hospitaldto.getAddr2();
			
			String hospitalAddress = addr1 + addr2;
			
			System.out.println(hospitalAddress);
			
			hospitaldto.setHospitalId(hospitalId);
			hospitaldto.setHospitalPw(hospitalPw);
			hospitaldto.setHospitalName(hospitalName);
			hospitaldto.setHospitalSsn(hospitalSsn);
			hospitaldto.setHospitalTel(hospitalTel);
			hospitaldto.setHospitalEmail(hospitalEmail);
			hospitaldto.setHospitalAddress(hospitalAddress);

			
			System.out.println(hospitalId);
			
			HospitalMemberDTO hospital = mapper.getHospital(hospitaldto);

			if(hospital != null && hospitaldto.getHospitalId().equals(hospital.getHospitalId())){
//				 model.addAttribute("errorMessage", "이미 존재하는 사용자입니다.");
				 return "redirect:/auth/hospitalregister.do";
			}

	        // 회원 가입 로직
			hospitaldto.setHospitalPw(encoder.encode(hospitaldto.getHospitalPw()));
	        int result = mapper.addHospital(hospitaldto);
	        
	        //방금회원가입한 사용자의 번호를 가져와서 어스 테이블에 넣어주고 싶어

	        // 권한 추가
	        if (result > 0) {
	        	//회원가입 성공했을 때 유저 테이블에서 조회하기
	        	hospitaldto = mapper.getHospital(hospitaldto);
	        	
	            AuthDTO adto = new AuthDTO();
	            adto.setHospitalid(hospitaldto.getHospitalId());
	            adto.setHospitalauth("ROLE_HOSPITAL");
	            mapper.addHospitalAuth(adto);
	        }
	    }
	    return "redirect:/auth/mylogin.do";
	}
	
	
	 /**
     * 약국 회원가입 처리 메서드
     * @param model Spring MVC Model 객체
     * @param pharmacydto PharmacyMemberDTO 객체
     * @param auth 회원 권한
     * @return 회원가입 성공 시 auth/mylogin.do로 리다이렉트
     */
	@PostMapping(value = "/auth/pharmacyregisterok.do")
	public String pharmacyRegisterok(Model model, PharmacyMemberDTO pharmacydto, String auth) {
		
		
		
	    if (auth.equals("pharmacy")) {
	    	
	    	
	    	String pharmacyId = pharmacydto.getPharmacyId();
	    	String pharmacyPw = pharmacydto.getPharmacyPw();
			String pharmacyName = pharmacydto.getPharmacyName();
			
			String ssn1 = pharmacydto.getSsn1();
			String ssn2 = pharmacydto.getSsn2();
			String ssn3 = pharmacydto.getSsn3();
			String pharmacySsn = ssn1 + "-" + ssn2 + "-" + ssn3;

			String tel1 = pharmacydto.getTel1();
			String tel2 = pharmacydto.getTel2();
			String tel3 = pharmacydto.getTel3();

			String pharmacyTel = tel1 + "-" + tel2 + "-" + tel3;
			String pharmacyEmail = pharmacydto.getPharmacyEmail();
			
			
			
			String addr1 = pharmacydto.getAddr1();
			String addr2 = pharmacydto.getAddr2();
			
			String pharmacyAddress = addr1 + addr2;
			
			System.out.println(pharmacyAddress);
			
			pharmacydto.setPharmacyId(pharmacyId);
			pharmacydto.setPharmacyPw(pharmacyPw);
			pharmacydto.setPharmacyName(pharmacyName);
			pharmacydto.setPharmacySsn(pharmacySsn);
			pharmacydto.setPharmacyTel(pharmacyTel);
			pharmacydto.setPharmacyEmail(pharmacyEmail);
			pharmacydto.setPharmacyAddress(pharmacyAddress);

			
			System.out.println(pharmacyId);
			
			PharmacyMemberDTO pharmacy = mapper.getPharmacy(pharmacydto);

			if(pharmacy != null && pharmacydto.getPharmacyId().equals(pharmacy.getPharmacyId())){
//				 model.addAttribute("errorMessage", "이미 존재하는 사용자입니다.");
				 return "redirect:/auth/pharmacyregister.do";
			}

	        // 회원 가입 로직
			pharmacydto.setPharmacyPw(encoder.encode(pharmacydto.getPharmacyPw()));
	        int result = mapper.addPharmacy(pharmacydto);
	        
	        //방금회원가입한 사용자의 번호를 가져와서 어스 테이블에 넣어주고 싶어

	        // 권한 추가
	        if (result > 0) {
	        	//회원가입 성공했을 때 유저 테이블에서 조회하기
	        	pharmacydto = mapper.getPharmacy(pharmacydto);
	        	
	            AuthDTO adto = new AuthDTO();
	            adto.setPharmacyid(pharmacydto.getPharmacyId());
	            adto.setPharmacyauth("ROLE_PHARMACY");
	            mapper.addPharmacyAuth(adto);
	        }
	    }
	    return "redirect:/auth/mylogin.do";
	}


}




































