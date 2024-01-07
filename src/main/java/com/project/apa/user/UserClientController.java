package com.project.apa.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.apa.api.user.service.UserService;

/**
 * 회원 마이페이지 및 의학테스트 뷰 컨트롤러입니다.
 * 
 * @author Yeonseob
 *
 */
@Controller
public class UserClientController {

	/**
	 * 회원 마이페이지 메인 화면 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 화면
	 */
	@GetMapping(value = "/user/{seq}/mypage.do")
	public String mypage(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.mypage";
	}
	
	/**
	 * 회원 마이페이지 자녀 관리 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 자녀 관리 화면
	 */
	@GetMapping(value = "/user/{seq}/mychild.do")
	public String mychild(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.mychild";
	}

	/**
	 * 회원 마이페이지 진료 정보 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 진료 정보 화면
	 */	
	@GetMapping(value = "/user/{seq}/mymedi.do")
	public String mymedi(@PathVariable String seq, Model model) {

		model.addAttribute("seq", seq);

		return "user.mymedi";
	}

	/**
	 * 회원 마이페이지 진료 내역 상세보기 연결
	 * 
	 * @param seq 병원 예약 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 진료 내역 상세보기 화면
	 */		
	@GetMapping(value = "/user/{seq}/myrecord.do")
	public String myrecord(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.myrecord";
	}

	/**
	 * 회원 마이페이지 리뷰 작성 연결
	 * 
	 * @param seq 병원 예약 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 리뷰 작성 화면
	 */	
	@GetMapping(value = "/user/{seq}/insertreview.do")
	public String insertreview(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.insertreview";
	}

	/**
	 * 회원 마이페이지 병원 즐겨찾기 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 병원 즐겨찾기 화면
	 */	
	@GetMapping(value = "/user/{seq}/mybookmark.do")
	public String mybookmark(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.mybookmark";
	}

	/**
	 * 회원 마이페이지 보관함 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 보관함 화면
	 */	
	@GetMapping(value = "/user/{seq}/mybox.do")
	public String mybox(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.mybox";
	}

	/**
	 * 회원 마이페이지 의학테스트 결과 상세보기 연결
	 * 
	 * @param seq 의학테스트 저장 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 의학테스트 결과 상세보기 화면
	 */	
	@GetMapping(value = "/user/{seq}/mymeditest.do")
	public String mymeditest(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.mymeditest";
	}

	/**
	 * 회원 마이페이지 내 의학상담 상세보기 연결
	 * 
	 * @param seq 의학상담 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 내 의학상담 상세보기 화면
	 */	
	@GetMapping(value = "/user/{seq}/mymediquestion.do")
	public String mymediquestion(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.mymediquestion";
	}

	/**
	 * 회원 마이페이지 기타 의학상담 상세보기 연결
	 * 
	 * @param seq 의학상담 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 기타 의학상담 상세보기 화면
	 */	
	@GetMapping(value = "/user/{seq}/etcmediquestion.do")
	public String etcmediquestion(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.etcmediquestion";
	}

	/**
	 * 회원 마이페이지 커뮤니티 글 상세보기 연결
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 커뮤니티 글 상세보기 화면
	 */	
	@GetMapping(value = "/user/{seq}/mycommunitydetail.do")
	public String mycommunitydetail(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.mycommunitydetail";
	}
	
	/**
	 * 회원 마이페이지 리뷰 관리 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 리뷰 관리 화면
	 */	
	@GetMapping(value = "/user/{seq}/myreview.do")
	public String myreview(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.myreview";
	}
	
	/**
	 * 회원 마이페이지 리뷰 상세보기 연결
	 * 
	 * @param seq 리뷰 번호
	 * @param model 데이터 전달 객체
	 * @return 회원 마이페이지 리뷰 상세보기 화면
	 */	
	@GetMapping(value = "/user/{seq}/myreviewdetail.do")
	public String myreviewdetail(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "user.newtab.myreviewdetail";
	}
	
	/**
	 * 의학테스트 목록 연결
	 * 
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 의학테스트 목록 화면
	 */	
	@GetMapping(value = "/selftest/{seq}/list.do")
	public String selftestlist(@PathVariable String seq, Model model) {
		
		model.addAttribute("seq", seq);
		
		return "selftest.list";
	}

	/**
	 * 의학테스트 테스트 화면 연결		
	 * 
	 * @param tseq 의학테스트 번호
	 * @param seq 유저 번호
	 * @param model 데이터 전달 객체
	 * @return 의학테스트 테스트 화면
	 */
	@GetMapping(value = "/selftest/{tseq}/{seq}/test.do")
	public String selftest(@PathVariable String tseq, @PathVariable String seq, Model model) {
		
		model.addAttribute("tseq", tseq);
		model.addAttribute("seq", seq);
		
		return "selftest.test";
	}
	
}
