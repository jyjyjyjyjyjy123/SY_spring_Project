package com.project.apa.api.user.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.project.apa.mapper.UserMapper;

/**
 * 회원 마이페이지 및 의학테스트에 대한 데이터 액세스 객체 (DAO)입니다.
 * 이 클래스는 UserDAO 인터페이스의 메서드를 구현하여
 * 회원 마이페이지와 의학테스트에 관한 기능을 수행합니다.
 * 
 * @author Yeonseob
 *
 */
@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private UserMapper userMapper;

	/**
	 * 내 정보 조회
	 * @param seq 유저 번호
	 * @return 유저 정보
	 */	
	@Override
	public UserDTO getUser(String seq) {

		return userMapper.getUser(seq);
	}
	
	/**
	 * 내 정보 수정
	 * 
	 * @param dto 유저 DTO
	 * @return 성공시 1 실패시 0 혹은 -5
	 */
	@Override
	public int editUser(UserDTO dto) {

		return userMapper.editUser(dto);
	}
	
	/**
	 * 회원 탈퇴
	 * 
	 * @param seq 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteUser(String seq) {

		return userMapper.deleteUser(seq);
	}
	
	/**
	 * 자녀 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 자녀 목록
	 */
	@Override
	public List<UserChildDTO> getChild(String seq) {

		return userMapper.getChild(seq);
	}
	
	/**
	 * 자녀 이름 수정
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int editChild(UserChildDTO dto) {

		return userMapper.editChild(dto);
	}

	/**
	 * 자녀 삭제
	 * 
	 * @param seq 자녀 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteChild(String seq) {
		
		return userMapper.deleteChild(seq);
	}
	
	/**
	 * 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int addChild(UserChildDTO dto) {

		return userMapper.addChild(dto);
	}

	/**
	 * 첫 자녀 등록
	 * 
	 * @param dto 회원의 자녀 DTO
	 * @return 성공시 1 실패시 0
	 */	
	@Override
	public int addFirstChild(UserChildDTO dto) {
		
		return userMapper.addFirstChild(dto);
	}
	
	/**
	 * 예약 진료 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 예약 진료 목록
	 */
	@Override
	public List<UserAppointmentDTO> getUserAppointment(String seq) {

		return userMapper.getUserAppointment(seq);
	}
	
	/**
	 * 진료 내역 조회
	 * 
	 * @param seq 유저 번호
	 * @return 진료 내역 목록
	 */
	@Override
	public List<UserRecordDTO> getUserRecord(String seq) {

		return userMapper.getUserRecord(seq);
	}
	
	/**
	 * 진료 내역 상세 보기
	 * 
	 * @param seq 병원 예약 번호
	 * @return 진료 내역 상세 정보
	 */
	@Override
	public UserDetailRecordDTO getUserDetailRecord(String seq) {

		return userMapper.getUserDetailRecord(seq);
	}
	
	/**
	 * 리뷰 작성 (정보 조회)
	 * 
	 * @param seq 병원 예약 번호
	 * @return 등록할 리뷰 정보
	 */
	@Override
	public UserReviewDTO insertReview(String seq) {
		
		return userMapper.insertReview(seq);
	}
	
	/**
	 * 리뷰 작성 완료
	 * 
	 * @param dto 회원 리뷰 DTO
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int insertReviewOK(UserReviewDTO dto) {

		return userMapper.insertReviewOK(dto);
	}

	/**
	 * 마지막 리뷰 번호 조회
	 * 
	 * @return 마지막 리뷰번호
	 */
	@Override
	public int getLastReviewSeq() {

		return userMapper.getLastReviewSeq();
	}

	/**
	 * 리뷰 작성 태그 등록
	 * 
	 * @param dto 유저 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int insertTag(UserReviewDTO dto) {
		
		return userMapper.insertTag(dto);
	}

	/**
	 * 즐겨찾기 병원 조회
	 * 
	 * @param seq 유저 번호
	 * @return 즐겨찾기한 병원 목록
	 */
	@Override
	public List<UserBookmarkDTO> getUserBookmark(String seq) {

		return userMapper.getUserBookmark(seq);
	}
	
	/**
	 * 즐겨찾기 병원 삭제
	 * 
	 * @param seq 즐겨찾기 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteBookmark(String seq) {

		return userMapper.deleteBookmark(seq);
	}
	
	/**
	 * 의학 테스트 결과 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 테스트 결과 목록
	 */
	@Override
	public List<UserMediTestDTO> getUserMediTest(String seq) {

		return userMapper.getUserMediTest(seq);
	}
	
	/**
	 * 의학 테스트 상세 조회
	 * 
	 * @param seq 의학 테스트 저장 번호
	 * @return 의학 테스트 상세 정보
	 */
	@Override
	public UserMediTestDTO getUserDetailMediTest(String seq) {
		
		return userMapper.getUserDetailMediTest(seq);
	}

	/**
	 * 의학 상담 내 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학 상담 내 질문 목록
	 */
	@Override
	public List<UserMediCounselQuestionDTO> getUserMyMediCounselQuestion(String seq) {

		return userMapper.getUserMyMediCounselQuestion(seq);
	}

	/**
	 * 의학상담 내 글 상세 조회
	 * 
	 * @param seq 의학 상담 질문 번호
	 * @return 의학 상담 내 글 상세 정보
	 */
	@Override
	public UserMediCounselQuestionDTO getUserMyMediCounselQuestionDetail(String seq) {

		return userMapper.getUserMyMediCounselQuestionDetail(seq);
	}
	
	/**
	 * 의학상담 내 글 삭제 (내 글을 보관한 보관함 정보 삭제)
	 * 
	 * @param aseq 의학 상담 답변 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteMyCounselBox(String aseq) {

		return userMapper.deleteMyCounselBox(aseq);
	}
	
	/**
	 * 의학상담 내 글 삭제 (답변 삭제)
	 * 
	 * @param qseq 의학 상담 질문 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteMyCounselAnswer(String qseq) {
		
		return userMapper.deleteMyCounselAnswer(qseq);
	}
	
	/**
	 * 의학상담 내 글 삭제 (질문 삭제)
	 * 
	 * @param qseq 의학 상담 질문 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteMyCounselQuestion(String qseq) {
		
		return userMapper.deleteMyCounselQuestion(qseq);
	}

	/**
	 * 의학상담 기타 질문 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 의학상담 기타 질문 목록
	 */
	@Override
	public List<UserMediCounselQuestionDTO> getUserEtcMediCounselQuestion(String seq) {

		return userMapper.getUserEtcMediCounselQuestion(seq);
	}
	
	/**
	 * 의학상담 기타 글 상세 조회
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 의학상담 기타 글 상세 정보
	 */
	@Override
	public UserMediCounselQuestionDTO getUserEtcMediCounselQuestionDetail(String seq) {

		return userMapper.getUserEtcMediCounselQuestionDetail(seq);
	}
	
	/**
	 * 의학상담 기타 글 삭제
	 * 
	 * @param seq 의학상담 보관함 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteEtcCounselQuestion(String seq) {

		return userMapper.deleteEtcCounselQuestion(seq);
	}
	
	/**
	 * 커뮤니티 내 글 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 커뮤니티 내 글 목록
	 */
	@Override
	public List<UserMyCommunityDTO> getUserMyCommunity(String seq) {

		return userMapper.getUserMyCommunity(seq);
	}
	
	/**
	 * 커뮤니티 내 글 상세 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 상세 정보
	 */
	@Override
	public UserMyCommunityDTO getUserMyCommunityDetail(String seq) {

		return userMapper.getUserMyCommunityDetail(seq);
	}

	/**
	 * 커뮤니티 내 글 댓글 조회
	 * 
	 * @param seq 커뮤니티 글 번호
	 * @return 커뮤니티 내 글 댓글 목록
	 */
	@Override
	public List<UserMyCommunityDTO> getUserMyCommunityComment(String seq) {

		return userMapper.getUserMyCommunityComment(seq);
	}
	
	/**
	 * 커뮤니티 내 글 수정
	 * 
	 * @param dto 커뮤니티 DTO
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int userCommunityUpdate(UserMyCommunityDTO dto) {

		return userMapper.userCommunityUpdate(dto);
	}
	
	/**
	 * 커뮤니티 내 글 댓글 삭제
	 * 
	 * @param seq 커뮤니티 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteCommunityComment(String seq) {

		return userMapper.deleteCommunityComment(seq);
	}
	
	/**
	 * 커뮤니티 내 글 삭제
	 * 
	 * @param seq 커뮤니티 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteCommunity(String seq) {
		
		return userMapper.deleteCommunity(seq);
	}
	
	/**
	 * 리뷰 목록 조회
	 * 
	 * @param seq 유저 번호
	 * @return 작성한 리뷰 목록
	 */
	@Override
	public List<UserReviewDTO> getUserReview(String seq) {
		
		return userMapper.getUserReview(seq);
	}

	/**
	 * 리뷰 상세 조회
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보
	 */
	@Override
	public UserReviewDTO getUserReviewDetail(String seq) {
		
		return userMapper.getUserReviewDetail(seq);
	}

	/**
	 * 리뷰 상세 조회(태그)
	 * 
	 * @param seq 리뷰 번호
	 * @return 작성한 리뷰 상세 정보 태그 목록
	 */
	@Override
	public List<UserReviewDTO> getUserReviewDetailTag(String seq) {
		
		return userMapper.getUserReviewDetailTag(seq);
	}
	
	/**
	 * 리뷰 삭제
	 * 
	 * @param seq 리뷰 번호
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int deleteReview(String seq) {

		return userMapper.deleteReview(seq);
	}
	
	/**
	 * 의학 테스트 문항 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 문항 목록
	 */
	@Override
	public List<SelfTestDTO> getSelfTest(String seq) {
		
		return userMapper.getSelfTest(seq);
	}
	
	/**
	 * 의학 테스트 답변 점수
	 * 
	 * @param meditestQuestionNo 의학테스트 질문 번호
	 * @return 의학테스트 답변 점수 목록
	 */
	@Override
	public ArrayList<String> getSelfTestAnswer(String meditestQuestionNo) {

		return userMapper.getSelfTestAnswer(meditestQuestionNo);
	}

	/**
	 * 의학 테스트 답변 내용
	 * 
	 * @param seq 의학테스트 질문 번호
	 * @return 의학테스트 답변 내용 목록
	 */
	@Override
	public String getSelfTestMinQuestionSeq(String seq) {

		return userMapper.getSelfTestMinQuestionSeq(seq);
	}

	/**
	 * 의학테스트 최소 질문 번호 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트의 최소 질문 번호
	 */
	@Override
	public List<SelfTestDTO> getSelfTestAnswerContent(String seq) {
		
		return userMapper.getSelfTestAnswerContent(seq);
	}

	/**
	 * 의학테스트 결과 조회
	 * 
	 * @param seq 의학테스트 번호
	 * @return 의학테스트 결과 목록
	 */
	@Override
	public List<SelfTestDTO> getSelfTestResult(String seq) {
		
		return userMapper.getSelfTestResult(seq);
	}
	
	/**
	 * 의학테스트 저장
	 * 
	 * @param dto 의학테스트 DTO
	 * @return 성공시 1 실패시 0
	 */
	@Override
	public int saveTestResult(SelfTestDTO dto) {

		return userMapper.saveTestResult(dto);
	}
	
	@Override
	public String getUserSeq(String id) {

		return userMapper.getUserSeq(id);
	}
}
