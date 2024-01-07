package com.project.apa.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.project.apa.api.user.domain.UserDTO;
import com.project.apa.api.user.domain.UserDetailRecordDTO;
import com.project.apa.api.user.domain.UserMediCounselQuestionDTO;
import com.project.apa.api.user.domain.UserMediTestDTO;
import com.project.apa.api.user.domain.UserMyCommunityDTO;
import com.project.apa.api.user.domain.UserRecordDTO;
import com.project.apa.api.user.domain.UserReviewDTO;
import com.project.apa.api.user.domain.SelfTestDTO;
import com.project.apa.api.user.domain.UserAppointmentDTO;
import com.project.apa.api.user.domain.UserBookmarkDTO;
import com.project.apa.api.user.domain.UserChildDTO;

/**
 * 회원 마이페이지 및 의학테스트 매퍼입니다.
 * 관련 데이터에 대한 데이터베이스 액세스를 담당합니다.
 * 매퍼의 각 메서드는 특정 데이터베이스 작업을 수행합니다.
 * 
 * @author Yeonseob
 *
 */
public interface UserMapper {

	/**
	 * 내 정보 조회
	 * @param seq 유저 번호
	 * @return 유저 정보
	 */
	UserDTO getUser(String seq);
	
	/**
	 * 내 정보 수정
	 * 
	 * @param dto 유저 DTO
	 * @return 성공시 1 실패시 0 혹은 -5
	 */
	int editUser(UserDTO dto);
	
	/**
	 * 회원 탈퇴
	 * 
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteUser(String seq);
	
	/**
	 * 자녀 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 자녀 목록
	 */
	List<UserChildDTO> getChild(String seq);
	
	/**
	 * 자녀 이름 수정
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */
	int editChild(UserChildDTO dto);

	/**
	 * 자녀 삭제
	 * 
	 * @param seq 자녀 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteChild(String seq);
	
	/**
	 * 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */
	int addChild(UserChildDTO dto);

	/**
	 * 첫 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */	
	int addFirstChild(UserChildDTO dto);
	
	/**
	 * 예약 진료 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 예약 진료 목록
	 */
	List<UserAppointmentDTO> getUserAppointment(String seq);
	
	/**
	 * 진료 내역 조회
	 * 
	 * @param seq 유저 번호
	 * @return 진료 내역 목록
	 */
	List<UserRecordDTO> getUserRecord(String seq);
	
	/**
	 * 진료 내역 상세 보기
	 * 
	 * @param seq 병원 예약 번호
	 * @return 진료 내역 상세 정보
	 */
	UserDetailRecordDTO getUserDetailRecord(String seq);
	
	/**
	 * 리뷰 작성 (정보 조회)
	 * 
	 * @param seq 병원 예약 번호
	 * @return 등록할 리뷰 정보
	 */
	UserReviewDTO insertReview(String seq);
	
	/**
	 * 리뷰 작성 완료
	 * 
	 * @param dto 회원 리뷰 DTO
	 * @return 성공시 1 실패시 0
	 */
	int insertReviewOK(UserReviewDTO dto);

	/**
	 * 마지막 리뷰 번호 조회
	 * 
	 * @return 마지막 리뷰번호
	 */
	int getLastReviewSeq();
	

	/**
	 * 리뷰 작성 태그 등록
	 * 
	 * @param dto 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	int insertTag(UserReviewDTO dto);

	/**
	 * 즐겨찾기 병원 조회
	 * 
	 * @param seq 유저 번호
	 * @return 즐겨찾기한 병원 목록
	 */
	List<UserBookmarkDTO> getUserBookmark(String seq);
	
	/**
	 * 즐겨찾기 병원 삭제
	 * 
	 * @param seq 즐겨찾기 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteBookmark(String seq);
	
	/**
	 * 의학 테스트 결과 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 테스트 결과 목록
	 */
	List<UserMediTestDTO> getUserMediTest(String seq);
	
	/**
	 * 의학 테스트 상세 조회
	 * 
	 * @param seq 의학 테스트 저장 번호
	 * @return 의학 테스트 상세 정보
	 */
	UserMediTestDTO getUserDetailMediTest(String seq);

	/**
	 * 의학 상담 내 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 상담 내 질문 목록
	 */
	List<UserMediCounselQuestionDTO> getUserMyMediCounselQuestion(String seq);

	/**
	 * 의학상담 내 글 상세 조회
	 * 
	 * @param seq 의학 상담 질문 번호
	 * @return 의학 상담 내 글 상세 정보
	 */
	UserMediCounselQuestionDTO getUserMyMediCounselQuestionDetail(String seq);
	
	/**
	 * 의학상담 내 글 삭제 (내 글을 보관한 보관함 정보 삭제)
	 * 
	 * @param aseq 의학 상담 답변 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteMyCounselBox(String aseq);
	
	/**
	 * 의학상담 내 글 삭제 (답변 삭제)
	 * 
	 * @param qseq 의학 상담 질문 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteMyCounselAnswer(String qseq);
	
	/**
	 * 의학상담 내 글 삭제 (질문 삭제)
	 * 
	 * @param qseq 의학 상담 질문 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteMyCounselQuestion(String qseq);

	/**
	 * 의학상담 기타 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학상담 기타 질문 목록
	 */
	List<UserMediCounselQuestionDTO> getUserEtcMediCounselQuestion(String seq);
	
	/**
	 * 의학상담 기타 글 상세 조회
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 의학상담 기타 글 상세 정보
	 */
	UserMediCounselQuestionDTO getUserEtcMediCounselQuestionDetail(String seq);
	
	/**
	 * 의학상담 기타 글 삭제
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteEtcCounselQuestion(String seq);
	
	/**
	 * 커뮤니티 내 글 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 커뮤니티 내 글 목록
	 */
	List<UserMyCommunityDTO> getUserMyCommunity(String seq);
	
	/**
	 * 커뮤니티 내 글 상세 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 상세 정보
	 */
	UserMyCommunityDTO getUserMyCommunityDetail(String seq);

	/**
	 * 커뮤니티 내 글 댓글 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 댓글 목록
	 */
	List<UserMyCommunityDTO> getUserMyCommunityComment(String seq);
	
	/**
	 * 커뮤니티 내 글 수정
	 * 
	 * @param dto 커뮤니티 DTO
	 * @return 성공시 1 실패시 0
	 */
	int userCommunityUpdate(UserMyCommunityDTO dto);
	
	/**
	 * 커뮤니티 내 글 댓글 삭제
	 * 
	 * @param seq 커뮤니티 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteCommunityComment(String seq);
	
	/**
	 * 커뮤니티 내 글 삭제
	 * 
	 * @param seq 커뮤니티 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteCommunity(String seq);
	
	/**
	 * 리뷰 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 작성한 리뷰 목록
	 */
	List<UserReviewDTO> getUserReview(String seq);

	/**
	 * 리뷰 상세 조회
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보
	 */
	UserReviewDTO getUserReviewDetail(String seq);

	/**
	 * 리뷰 상세 조회(태그)
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보 태그 목록
	 */
	List<UserReviewDTO> getUserReviewDetailTag(String seq);
	
	/**
	 * 리뷰 삭제
	 * 
	 * @param seq 리뷰 번호
	 * @return 성공시 1 실패시 0
	 */
	int deleteReview(String seq);
	
	/**
	 * 의학 테스트 문항 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 문항 목록
	 */
	List<SelfTestDTO> getSelfTest(String seq);
	
	/**
	 * 의학 테스트 답변 점수
	 * 
	 * @param meditestQuestionNo 의학테스트 질문 번호
	 * @return 의학테스트 답변 점수 목록
	 */
	ArrayList<String> getSelfTestAnswer(String meditestQuestionNo);

	/**
	 * 의학 테스트 답변 내용
	 * 
	 * @param seq 의학테스트 질문 번호
	 * @return 의학테스트 답변 내용 목록
	 */
	List<SelfTestDTO> getSelfTestAnswerContent(String seq);

	/**
	 * 의학테스트 최소 질문 번호 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트의 최소 질문 번호
	 */
	String getSelfTestMinQuestionSeq(String seq);


	/**
	 * 의학테스트 결과 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 결과 목록
	 */
	List<SelfTestDTO> getSelfTestResult(String seq);
	
	/**
	 * 의학테스트 저장
	 * 
	 * @param dto 의학테스트 DTO
	 * @return 성공시 1 실패시 0
	 */
	int saveTestResult(SelfTestDTO dto);

	String getUserSeq(String id);
	
	
}
