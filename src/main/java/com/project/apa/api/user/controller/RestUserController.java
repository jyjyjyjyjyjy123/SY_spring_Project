package com.project.apa.api.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.user.domain.SelfTestDTO;
import com.project.apa.api.user.domain.UserAppointmentDTO;
import com.project.apa.api.user.domain.UserBookmarkDTO;
import com.project.apa.api.user.domain.UserChildDTO;
import com.project.apa.api.user.domain.UserDTO;
import com.project.apa.api.user.domain.UserDetailRecordDTO;
import com.project.apa.api.user.domain.UserMediCounselQuestionDTO;
import com.project.apa.api.user.domain.UserMediTestDTO;
import com.project.apa.api.user.domain.UserMyCommunityDTO;
import com.project.apa.api.user.domain.UserRecordDTO;
import com.project.apa.api.user.domain.UserReviewDTO;
import com.project.apa.api.user.service.UserService;
import com.project.apa.mapper.AuthMapper;

/**
 * 회원 마이페이지 및 의학테스트 Rest컨트롤러입니다.
 * 
 * 
 * @author Yeonseob
 *
 */
@RestController
public class RestUserController {

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder encoder;	
	
	/**
	 * 내 정보 조회
	 * @param seq 유저 번호
	 * @return 유저 정보
	 */
	@GetMapping(value="/api/user/{seq}/mypage")
	public UserDTO getUser(@PathVariable String seq) {

		//seq = "1";
		
		UserDTO dto = userService.getUser(seq);

		String[] ssnArr = dto.getUserSSN().split("-");
		
		dto.setUserSSNs(ssnArr[0]);
		dto.setUserSSNe(ssnArr[1]);
		
		String[] telArr = dto.getUserTel().split("-");
		
		dto.setUserTels(telArr[0]);
		dto.setUserTelm(telArr[1]);
		dto.setUserTele(telArr[2]);
		
		dto.setMaskingSSN(ssnArr[1].charAt(0) + "******");
		
		return dto;
	}
	
	/**
	 * 내 정보 수정
	 * 
	 * @param dto 유저 DTO
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0 혹은 -5
	 */
	@PutMapping(value="/api/user/{seq}/mypage")
	public int editUser(@RequestBody UserDTO dto, @PathVariable("seq") String seq) {
		
		UserDTO pdto = userService.getUser(seq);
		
		if (!encoder.matches(dto.getInputCurrentPw(), pdto.getUserPw())) {
		    return -5;
		}
		
		String tel = dto.getUserTels() + "-" + dto.getUserTelm() + "-" + dto.getUserTele();
		
		dto.setUserTel(tel);
		
		if (!dto.getUserPw().equals("")) {
			dto.setUserPw(encoder.encode(dto.getUserPw()));
		}
		
		return userService.editUser(dto);
	}
	
	/**
	 * 회원 탈퇴
	 * 
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	@PatchMapping(value="/api/user/{seq}/mypage")
	public int deleteUser(@PathVariable("seq") String seq) {
		
		return userService.deleteUser(seq);
	}
	
	/**
	 * 자녀 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 자녀 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mychild")
	public List<UserChildDTO> myChild(@PathVariable("seq") String seq) {
		
		List<UserChildDTO> userChildList = userService.getChild(seq);
		
		for (UserChildDTO dto : userChildList) {
			String cSSN[] = dto.getChildSSN().split("-");
			
			dto.setChildSSNs(cSSN[0]);
			dto.setChildSSNe(cSSN[1].charAt(0) + "******");
		}
		
		return userChildList;
	}
	
	/**
	 * 자녀 이름 수정
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @param seq 자녀 번호
	 * @return 성공시 1 실패시 0
	 */
	@PutMapping(value = "/api/user/{seq}/mychild")
	public int editChild(@RequestBody UserChildDTO dto, @PathVariable("seq") String seq) {
		
		dto.setChildSeq(seq);
		
		return userService.editChild(dto);
	}	

	/**
	 * 자녀 삭제
	 * 
	 * @param seq 자녀 번호
	 * @return 성공시 1 실패시 0
	 */
	@PatchMapping(value="/api/user/{seq}/mychild")
	public int deleteChild(@PathVariable("seq") String seq) {
		
		return userService.deleteChild(seq);
	}	
	
	/**
	 * 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	@PostMapping(value="/api/user/{seq}/mychild")
	public int addChild(@RequestBody UserChildDTO dto, @PathVariable("seq") String seq) {
		
		dto.setUserSeq(seq);
		
		String childSSN = dto.getChildSSNs() + '-' + dto.getChildSSNe();
		
		dto.setChildSSN(childSSN);
		
		return userService.addChild(dto);
	}	
	
	/**
	 * 첫 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	@PostMapping(value="/api/user/{seq}/myfirstchild")
	public int addFirstChild(@RequestBody UserChildDTO dto, @PathVariable("seq") String seq) {
		
		dto.setUserSeq(seq);
		
		String childSSN = dto.getChildSSNs() + '-' + dto.getChildSSNe();
		
		dto.setChildSSN(childSSN);
		
		userService.addFirstChild(dto);
		
		return userService.addChild(dto);
	}
	
	/**
	 * 예약 진료 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 예약 진료 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mymedi/appointment")
	public List<UserAppointmentDTO> myappointment(@PathVariable("seq") String seq) {
		
		return userService.getUserAppointment(seq);
	}
	
	/**
	 * 진료 내역 조회
	 * 
	 * @param seq 유저 번호
	 * @return 진료 내역 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mymedi/record")
	public List<UserRecordDTO> myrecord(@PathVariable("seq") String seq) {
		
		return userService.getUserRecord(seq);
	}
	
	/**
	 * 진료 내역 상세 보기
	 * 
	 * @param seq 병원 예약 번호
	 * @return 진료 내역 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mymedi/detailrecord")
	public UserDetailRecordDTO detailrecord(@PathVariable("seq") String seq) {

		return userService.getUserDetailRecord(seq);
	}
	
	/**
	 * 리뷰 작성 (정보 조회)
	 * 
	 * @param seq 병원 예약 번호
	 * @return 등록할 리뷰 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mymedi/insertreview")
	public UserReviewDTO insertreview(@PathVariable("seq") String seq) {
		
		return userService.insertReview(seq);
	}
	
	/**
	 * 리뷰 작성 완료
	 * 
	 * @param dto 회원 리뷰 DTO
	 * @param seq 병원 예약 번호
	 * @return 성공시 1 실패시 0
	 */
	@PostMapping(value = "/api/user/{seq}/mymedi/insertreviewok")
	public int insertreviewok(@RequestBody UserReviewDTO dto ,@PathVariable("seq") String seq) {

		dto.setAppointmentSeq(seq);
		
		int result = userService.insertReviewOK(dto);
		
		int rseq = userService.getLastReviewSeq();
		
		dto.setReviewSeq(rseq + "");
		
		String tag[] = dto.getTagList().split(",");
		
		for (int i=0; i<tag.length; i++) {
			dto.setTagSeq(tag[i]);
			result = userService.insertTag(dto);			
		}			
		
		return result;
	}

	/**
	 * 즐겨찾기 병원 조회
	 * 
	 * @param seq 유저 번호
	 * @return 즐겨찾기한 병원 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybookmark")
	public List<UserBookmarkDTO> mybookmark(@PathVariable("seq") String seq) {
		
		return userService.getUserBookmark(seq);
	}
	
	/**
	 * 즐겨찾기 병원 삭제
	 * 
	 * @param seq 즐겨찾기 번호
	 * @return 성공시 1 실패시 0
	 */
	@DeleteMapping(value = "/api/user/{seq}/mybookmark")
	public int deletebookmark(@PathVariable("seq") String seq) {
		
		return userService.deleteBookmark(seq);
	}
	
	/**
	 * 의학 테스트 결과 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 테스트 결과 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/meditest")
	public List<UserMediTestDTO> mymeditest(@PathVariable("seq") String seq) {
		
		return userService.getUserMediTest(seq);
	}
	
	/**
	 * 의학 테스트 상세 조회
	 * 
	 * @param seq 의학 테스트 저장 번호
	 * @return 의학 테스트 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/detailmeditest")
	public UserMediTestDTO detailmeditest(@PathVariable("seq") String seq) {

		return userService.getUserDetailMediTest(seq);
	}	

	/**
	 * 의학 상담 내 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 상담 내 질문 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/mymedicounselquestion")
	public List<UserMediCounselQuestionDTO> mymedicounselquestion(@PathVariable("seq") String seq) {
		
		List<UserMediCounselQuestionDTO> qlist = userService.getUserMyMediCounselQuestion(seq);
		
		for (UserMediCounselQuestionDTO qdto : qlist) {
			
			String subject = qdto.getCounselTitle();
			
			if (subject.length() > 22) {
				subject = subject.substring(0, 22) + "...";
			}
			
			subject = subject.replace("<", "&lt;");
			subject = subject.replace(">", "&gt;");
			
			qdto.setCounselTitle(subject);
			
		}
		
		return qlist;
	}	

	/**
	 * 의학상담 내 글 상세 조회
	 * 
	 * @param seq 의학 상담 질문 번호
	 * @return 의학 상담 내 글 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/mymedicounselquestiondetail")
	public UserMediCounselQuestionDTO mymedicounselquestiondetail(@PathVariable("seq") String seq) {
		
		return userService.getUserMyMediCounselQuestionDetail(seq);
	}
	
	
	/**
	 * 의학상담 내 글 삭제
	 * 
	 * @param qseq 의학 상담 질문 번호
	 * @param aseq 의학 상담 답변 번호
	 * @return 성공시 1 실패시 0
	 */
	@DeleteMapping(value = "/api/user/{qseq}/{aseq}/mybox/deletemycounsel")
	public int deletemycounsel(@PathVariable("qseq") String qseq, @PathVariable("aseq") String aseq) {
		
		int result = 0;
		
		if (!aseq.equals("null")) {
			result = userService.deleteMyCounselBox(aseq);	//보관함 테이블에서 내 글 삭제
			result = userService.deleteMyCounselAnswer(qseq);	//의학상담 답변 테이블에서 내 글 삭제			
		}
		
		result = userService.deleteMyCounselQuestion(qseq);	//의학상담 질문 테이블에서 내 글 삭제
		
		return result;
	}
	

	/**
	 * 의학상담 기타 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학상담 기타 질문 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/etcmedicounselquestion")
	public List<UserMediCounselQuestionDTO> etcmedicounselquestion(@PathVariable("seq") String seq) {
		
		List<UserMediCounselQuestionDTO> qlist = userService.getUserEtcMediCounselQuestion(seq);
		
		for (UserMediCounselQuestionDTO qdto : qlist) {
			
			String subject = qdto.getCounselTitle();
			
			if (subject.length() > 22) {
				subject = subject.substring(0, 22) + "...";
			}
			
			subject = subject.replace("<", "&lt;");
			subject = subject.replace(">", "&gt;");
			
			qdto.setCounselTitle(subject);
			
		}
		
		return qlist;
	
	}	
	
	/**
	 * 의학상담 기타 글 상세 조회
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 의학상담 기타 글 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/etcmedicounselquestiondetail")
	public UserMediCounselQuestionDTO etcmedicounselquestiondetail(@PathVariable("seq") String seq) {
		
		return userService.getUserEtcMediCounselQuestionDetail(seq);
	}
	
	/**
	 * 의학상담 기타 글 삭제
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 성공시 1 실패시 0
	 */
	@DeleteMapping(value = "/api/user/{seq}/mybox/deleteetccounsel")
	public int deleteetccounsel(@PathVariable("seq") String seq) {
		
		return userService.deleteEtcCounselQuestion(seq);
	}
	
	/**
	 * 커뮤니티 내 글 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 커뮤니티 내 글 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/mycommunity")
	public List<UserMyCommunityDTO> mycommunity(@PathVariable("seq") String seq) {
		
		return userService.getUserMyCommunity(seq);
	}
	
	/**
	 * 커뮤니티 내 글 상세 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/getusercommunitydetail")
	public UserMyCommunityDTO getusercommunitydetail(@PathVariable("seq") String seq) {
		
		return userService.getUserMyCommunityDetail(seq);
	}

	/**
	 * 커뮤니티 내 글 댓글 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 댓글 목록
	 */
	@GetMapping(value = "/api/user/{seq}/mybox/getusercommunitycomment")
	public List<UserMyCommunityDTO> getusercommunitycomment(@PathVariable("seq") String seq) {
		
		return userService.getUserMyCommunityComment(seq);
	}
	
	/**
	 * 커뮤니티 내 글 수정
	 * 
	 * @param dto 커뮤니티 DTO
	 * @param seq 커뮤니티 글 번호
	 * @return 성공시 1 실패시 0
	 */
	@PutMapping(value = "/api/user/{seq}/mybox/usercommunityupdate")
	public int usercommunityupdate(@RequestBody UserMyCommunityDTO dto, @PathVariable("seq") String seq) {
		
		dto.setCommunitySeq(seq);
		
		return userService.userCommunityUpdate(dto);
	}
	
	/**
	 * 커뮤니티 내 글 삭제
	 * 
	 * @param seq 커뮤니티 번호
	 * @return 성공시 1 실패시 0
	 */
	@DeleteMapping(value = "/api/user/{seq}/mybox/deletecommunity")
	public int deletecommunity(@PathVariable("seq") String seq) {

		int result = 0;
		
		result = userService.deleteCommunityComment(seq);
		result = userService.deleteCommunity(seq);

		return result;
		
	}
	
	/**
	 * 리뷰 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 작성한 리뷰 목록
	 */
	@GetMapping(value = "/api/user/{seq}/myreview")
	public List<UserReviewDTO> myreview(@PathVariable("seq") String seq) {
		
		List<UserReviewDTO> rlist = userService.getUserReview(seq);
		
		for (UserReviewDTO rdto : rlist) {
			
			String subject = rdto.getReviewContent();
			
			if (subject.length() > 20) {
				subject = subject.substring(0, 20) + "...";
			}
			
			subject = subject.replace("<", "&lt;");
			subject = subject.replace(">", "&gt;");
			
			rdto.setReviewContent(subject);
			
		}
		
		return rlist;
		
	}

	/**
	 * 리뷰 상세 조회
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보
	 */
	@GetMapping(value = "/api/user/{seq}/myreview/getuserreviewdetail")
	public UserReviewDTO getuserreviewdetail(@PathVariable("seq") String seq) {
		
		return userService.getUserReviewDetail(seq);
	}

	/**
	 * 리뷰 상세 조회(태그)
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보 태그 목록
	 */
	@GetMapping(value = "/api/user/{seq}/myreview/getuserreviewdetailtag")
	public List<UserReviewDTO> getuserreviewdetailtag(@PathVariable("seq") String seq) {
		
		return userService.getUserReviewDetailTag(seq);
	}
	
	/**
	 * 리뷰 삭제
	 * 
	 * @param seq 리뷰 번호
	 * @return 성공시 1 실패시 0
	 */
	@PutMapping(value = "/api/user/{seq}/myreview/deletereview")
	public int deletereview(@PathVariable("seq") String seq) {
		
		return userService.deleteReview(seq);
	}	
	
	/**
	 * 의학 테스트 문항 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 문항 목록
	 */
	@GetMapping(value = "/api/user/{seq}/selftest")
	public List<SelfTestDTO> getselftest(@PathVariable("seq") String seq) {
		
		List<SelfTestDTO> list = userService.getSelfTest(seq);
	    
		for (SelfTestDTO dto : list) {
			
			dto.setMeditestAnswerNo(userService.getSelfTestAnswer(dto.getMeditestQuestionSeq()));
			
		}
		
		return list;
	}
	
	/**
	 * 의학테스트 문항 답변 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 문항 답변 목록
	 */
	@GetMapping(value = "/api/user/{seq}/selftest/answercontent")
	public List<SelfTestDTO> getselftestanswercontent(@PathVariable("seq") String seq) {
		
		String min = userService.getSelfTestMinQuestionSeq(seq);
		
		return userService.getSelfTestAnswerContent(min);
	}

	/**
	 * 의학테스트 결과 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 결과 목록
	 */
	@GetMapping(value = "/api/user/{seq}/selftest/result")
	public List<SelfTestDTO> getselftestresult(@PathVariable("seq") String seq) {
		
		return userService.getSelfTestResult(seq);
	}
	
	/**
	 * 의학테스트 저장
	 * 
	 * @param dto 의학테스트 DTO
	 * @return 성공시 1 실패시 0
	 */
	@PostMapping(value = "/api/user/selftest/save")
	public int savetestresult(@RequestBody SelfTestDTO dto) {
		
		
		return userService.saveTestResult(dto);
	}
	
	
}
