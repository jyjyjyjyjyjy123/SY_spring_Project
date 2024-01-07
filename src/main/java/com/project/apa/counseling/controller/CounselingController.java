package com.project.apa.counseling.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.apa.counseling.model.CounselingDTO;
import com.project.apa.counseling.model.DoctorDto;
import com.project.apa.counseling.repository.CounselingDAO;
import com.project.apa.mapper.CounselingMapper;

/**
 * 병원 상담 관련 기능을 담당하는 컨트롤러 클래스
 */
@Controller
@RequestMapping("/hospital/counseling")
public class CounselingController {

	@Autowired
	private CounselingMapper mapper;
	

	@Autowired
	private CounselingDAO dao;
	
	
	/**
     * 대기 중인 상담 목록 페이지로 이동하는 메서드
     *
     * @param id    병원 ID
     * @param model Spring MVC의 모델 객체
     * @return 대기 중인 상담 목록 페이지의 뷰 이름
     */
	@GetMapping(value = "/{id}/list.do")
	public String waitingList(@PathVariable String id, Model model) {
		
		model.addAttribute("id", id);
		
		return "hospital.counseling.list";
	}

	
	 /**
     * 병원의 의사 목록을 조회하는 메서드
     *
     * @param hospitalId 병원 ID
     * @return ResponseEntity<List<DoctorDto>> 응답 엔터티
     */
	@GetMapping(value = "/doctors/{hospitalId}")
	@ResponseBody
	public ResponseEntity<List<DoctorDto>> getDoctors(@PathVariable String hospitalId) {
	    System.out.println("test");
		List<DoctorDto> doctorList = mapper.getDoctors(hospitalId);
	    return new ResponseEntity<>(doctorList, HttpStatus.OK);
	}
	
	/**
     * 상담 대기 목록에서 상담 내용을 조회하여 상담 대기 상세 페이지로 이동하는 메서드
     *
     * @param model                  Spring MVC의 모델 객체
     * @param mediCounselQuestionSeq 상담 질문 일련번호
     * @param doctorSeq              의사 일련번호
     * @return 상담 대기 상세 페이지의 뷰 이름
     */
	@GetMapping(value = "/waitingview.do")
	public String view(Model model, int mediCounselQuestionSeq, String doctorSeq) {
		
		CounselingDTO counselingdto = dao.get(mediCounselQuestionSeq);
		
		model.addAttribute("counselingdto", counselingdto);
		model.addAttribute("doctorSeq",doctorSeq);

		return "hospital.counseling.waitingview";
	}
	
	
	 /**
     * 상담 응답을 등록하는 메서드
     *
     * @param mediCounselQuestionSeq 상담 질문 일련번호
     * @param doctorSeq              의사 일련번호
     * @param counselAnswerContent   상담 응답 내용
     * @return 리다이렉트 URL
     */
	@PostMapping(value="/answeraddok.do")
	public String answeraddok(int mediCounselQuestionSeq, int doctorSeq, String counselAnswerContent) {
		CounselingDTO counselingdto = new CounselingDTO();
		counselingdto.setCounselAnswerContent(counselAnswerContent);
		counselingdto.setDoctorSeq(doctorSeq);
		counselingdto.setMediCounselQuestionSeq(mediCounselQuestionSeq);


		dao.answeradd(counselingdto);
		System.out.println("test");
		dao.answerupdate(counselingdto);
		System.out.println("test");
		
		
		
		return "redirect:/hospital/counseling/list.do";

	}
	
	 /**
     * 상담 완료 상세 페이지로 이동하는 메서드
     *
     * @param model                  Spring MVC의 모델 객체
     * @param mediCounselQuestionSeq 상담 질문 일련번호
     * @param doctorSeq              의사 일련번호
     * @param mediCounselAnswerSeq   상담 응답 일련번호
     * @return 상담 완료 상세 페이지의 뷰 이름
     */
	@GetMapping(value = "/completeview.do")
	public String completeview(Model model, int mediCounselQuestionSeq, int doctorSeq, int mediCounselAnswerSeq) {
		
		CounselingDTO counselingdto = dao.getcomplete(mediCounselQuestionSeq);
	
		model.addAttribute("counselingdto", counselingdto);
		model.addAttribute("doctorSeq",doctorSeq);

		return "hospital.counseling.completeview";
	}	

}
