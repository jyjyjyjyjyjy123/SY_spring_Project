package com.project.apa.api.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.project.apa.api.search.model.BookMarkDTO;
import com.project.apa.api.search.model.ChildInfoDTO;
import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;
import com.project.apa.api.search.model.ReviewDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;
import com.project.apa.api.search.model.UserInfoDTO;
import com.project.apa.api.search.repository.InfoDAO;
import com.project.apa.api.search.repository.ReservationAppointmentDAO;
import com.project.apa.api.search.repository.ReservationAppointmentDAOImpl;
import com.project.apa.api.search.repository.ReservationDAO;
import com.project.apa.api.search.repository.SearchDAO;
import com.project.apa.auth.repository.AuthDAO;

@Service
public class SearchService {
	
	@Autowired
	private SearchDAO searchdao;
	@Autowired
	private InfoDAO infodao;
	@Autowired
	private ReservationDAO redao;
	@Autowired
	private ReservationAppointmentDAO reappdao;
	@Autowired
	private AuthDAO authdao;
	
	 /**
     * 사용자의 아이디로 사용자 번호를 가져오는 메서드
     * @param userid 사용자 아이디
     * @return 사용자 번호
     */

	public String getuserseq(String userid) {
		return authdao.getuserseq(userid);
	}
	

    /**
     * 증상 목록을 가져오는 메서드
     * @return 증상 목록
     */	

	public List<SelfsymtomDTO> symtomlist() {
		return searchdao.symtomlist();
	}

    /**
     * 병원 찾기 기능을 위한 증상 목록을 가져오는 메서드
     * @param dto 증상 정보
     * @return 증상에 따른 병원 찾기 목록
     */
	public List<String> findsystomlist(FindHospitalDTO dto) {
		return searchdao.findsystomlist(dto);
	} 
	
	 /**
     * 증상에 따른 병원 목록을 가져오는 메서드
     * @param findsystomlist 증상에 따른 병원 목록
     * @return 병원 목록
     */
	
	public List<HospitalInfoDTO> findHospitalList(List<String> findsystomlist) {
		return searchdao.findHospitalList(findsystomlist);
	}
	
	  /**
     * 특정 병원의 정보를 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 정보
     */

	public HospitalInfoDTO hospitalInfo(String seq) {
		return infodao.hospitalInfo(seq);
	}

	  /**
     * 특정 병원의 진료 과목 목록을 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 진료 과목 목록
     */
	
	public List<SelfsymtomDTO> deptlist(String seq) {
		return infodao.deptlist(seq);
	}

	 /**
     * 특정 병원의 의사 목록을 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 의사 목록
     */
	
	public List<HospitalDoctorDTO> doclist(String seq) {
		return infodao.doclist(seq);
	}
	
	  /**
     * 특정 병원의 리뷰 목록을 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 리뷰 목록
     */

	public List<ReviewDTO> reviewlist(String seq) {
		return infodao.reviewlist(seq);
	}
	
	 /**
     * 특정 병원의 리뷰 태그 목록을 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 리뷰 태그 목록
     */

	public List<ReviewDTO> reviewtaglist(String seq) {
		return infodao.reviewtaglist(seq);
	}
	
	 /**
     * 특정 병원의 즐겨찾기 수를 가져오는 메서드
     * @param seq 병원 번호
     * @return 특정 병원의 즐겨찾기 수
     */

	public List<BookMarkDTO> bookmarkcount(String seq) {
		return infodao.bookmarkcount(seq);
	}
	
	  /**
     * 즐겨찾기에 추가하는 메서드
     * @param dto 즐겨찾기 정보
     * @return 즐겨찾기 추가 결과 (성공 시 1, 실패 시 0)
     */

	public int bookmarkin(BookMarkDTO dto) {
		return infodao.bookmarkin(dto);
	}
	
	/**
     * 즐겨찾기에서 제거하는 메서드
     * @param dto 즐겨찾기 정보
     * @return 즐겨찾기 제거 결과 (성공 시 1, 실패 시 0)
     */

	public int bookmarkout(BookMarkDTO dto) {
		return infodao.bookmarkout(dto);
	}
	
	/**
     * 특정 진료과목에 속한 의사 목록을 가져오는 메서드
     * @param dto 진료과목 정보
     * @return 특정 진료과목에 속한 의사 목록
     */

	public List<HospitalDoctorDTO> finddeptdoc(HospitalDoctorDTO dto) {
		return redao.finddeptdoc(dto);
	}
	
	 /**
     * 사용자 정보를 가져오는 메서드
     * @param userseq 사용자 번호
     * @return 사용자 정보
     */

	public UserInfoDTO userlist(String userseq) {
		return redao.userlist(userseq);
	}

	 /**
     * 사용자의 자녀 정보 목록을 가져오는 메서드
     * @param userseq 사용자 번호
     * @return 자녀 정보 목록
     */
	
	public List<ChildInfoDTO> childlist(String userseq) {
		return redao.childlist(userseq);
	}
	
    /**
     * 특정 자녀의 정보를 가져오는 메서드
     * @param childseq 자녀 번호
     * @return 특정 자녀의 정보
     */

	public ChildInfoDTO childinfo(String childseq) {
			ChildInfoDTO dto = redao.childinfo(childseq);
			dto.setFirstssn(dto.getChildssn().substring(0,6));
			dto.setLastssn(dto.getChildssn().substring(7));
		return dto;
	}

	 /**
     * 진료 과목 목록을 가져오는 메서드
     * @return 진료 과목 목록
     */
	
	public List<SelfsymtomDTO> deptlist() {
		return searchdao.deptlist();
	}

	/**
     * 특정 진료 과목에 속한 병원 목록을 가져오는 메서드
     * @param deptseq 진료 과목 번호
     * @return 특정 진료 과목에 속한 병원 목록
     */
	
	public List<HospitalInfoDTO> findHospitalList2(String deptseq) {
		return searchdao.findHospitalList2(deptseq);
	}
	
	/**
     * 기본 병원 정보를 가져오는 메서드
     * @return 기본 병원 정보
     */	

	public HospitalInfoDTO basichospitalInfo() {
		return infodao.basichospitalInfo();
	}
	
	/**
     * 특정 병원의 진료 과목 목록을 가져오는 메서드
     * @param dto 병원 정보
     * @return 특정 병원의 진료 과목 목록
     */

	public List<SelfsymtomDTO> finddept(HospitalInfoDTO dto) {
		return searchdao.finddept(dto);
	}
	
	/**
     * 약국 목록을 가져오는 메서드
     * @return 약국 목록
     */

	public List<PharmacyDTO> pharmacylist() {
		return redao.pharmacylist();
	}
	

    /**
     * 병원 예약을 추가하는 메서드
     * @param rhadto 병원 예약 정보
     */

	public void addHospitalAppintment(ReservationHospitalAppointmentDTO rhadto) {
		reappdao.addHospitalAppintment(rhadto);
	}
	
	/**
     * 병원 예약 상태를 추가하는 메서드
     */

	public void addHospitalAppintmentStatus() {
		reappdao.addHospitalAppintmentStatus();
		
	}
	
	  /**
     * 특정 약국의 정보를 가져오는 메서드
     * @param parmacyseq 약국 번호
     * @return 특정 약국의 정보
     */

	public PharmacyDTO pharmacychoice(String parmacyseq) {
		return redao.pharmacychoice(parmacyseq);
	}
	
	   /**
     * 약국 예약을 추가하는 메서드
     * @param rpadto 약국 예약 정보
     */

	public void addPharmacyAppintment(ReservationPharmacyAppointmentDTO rpadto) {
		reappdao.addPharmacyAppintment(rpadto);
	}
	
	  /**
     * 약국 예약 상태를 추가하는 메서드
     */

	public void addPharmacyAppintmentStatus() {
		reappdao.addPharmacyAppintmentStatus();
	}
	
	/**
     * 특정 약국의 정보를 가져오는 메서드
     * @param seq 약국 번호
     * @return 특정 약국의 정보
     */

	public PharmacyDTO pharmacyinfo(String seq) {
		return searchdao.pharmacyinfo(seq);
	}

}
