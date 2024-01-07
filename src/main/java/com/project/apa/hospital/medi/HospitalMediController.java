package com.project.apa.hospital.medi;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.api.hospital.medi.domain.PatientDTO;
import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;
import com.project.apa.api.hospital.medi.service.PatientService;
import com.project.apa.api.hospital.medi.service.PracticeService;

/**
 * 병원의 내 진료 페이지 내부의 렌더링을 위한 컨트롤러입니다.
 * 환자 예약 및 진료와 관련된 다양한 기능을 처리하며, 뷰 페이지를 렌더링합니다.
 * 
 * @author Eunha
 *
 */
@Controller
@RequestMapping("/hospital/{id}/medi")
public class HospitalMediController {

	@Autowired
	private PatientService patientService;

	@Autowired
	private PracticeService practiceService;

	/**
	 * 병원 내 진료 페이지 컨트롤러의 생성자입니다.
	 * 
	 * @param patientService 환자 서비스 객체
	 * @param practiceService 진료 서비스 객체
	 */
	public HospitalMediController(PatientService patientService, PracticeService practiceService) {
		this.patientService = patientService;
		this.practiceService = practiceService;
	}

	/**
	 * 오늘의 진료 예약 목록을 렌더링합니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param page 페이지 번호
	 * @return 뷰 페이지 이름 ("hospital.medi.today.appointment-list")
	 */
	@GetMapping(value = "/today/appointment")
	public String getToadyAppointmentList(Model model, @PathVariable String id, @RequestParam(defaultValue = "1") int page) {
		
		model.addAttribute("id", id);
		model.addAttribute("page", page);

		return "hospital.medi.today.appointment-list";
	}

	/**
	 * 오늘의 진료 예약 상세보기를 렌더링합니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.today.appointment-detail")
	 */
	@GetMapping(value = "/today/appointment/{appointmentSeq}")
	public String getTodayAppointmentDetail(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		AppointmentDetailDTO dto = practiceService.getAppointmentDetail(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.today.appointment-detail";
	}

	/**
	 * 오늘의 진료 목록을 렌더링합니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param page 페이지 번호
	 * @return 뷰 페이지 이름 ("hospital.medi.today.treatment-list")
	 */
	@GetMapping(value = "/today/treatment")
	public String getTodayTreatmentList(Model model, @PathVariable String id, @RequestParam(defaultValue = "1") int page) {

		model.addAttribute("id", id);
		model.addAttribute("page", page);

		return "hospital.medi.today.treatment-list";
	}

	/**
	 * 오늘의 진료에서 진료내역서 작성 화면을 렌더링합니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.today.medi-record")
	 */
	@GetMapping(value = "/today/treatment/{appointmentSeq}/record")
	public String writeTodayMediRecord(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		// 기본 내용 가져오기 - 예약번호, 병원이름, 의사이름
		RecordDTO dto = practiceService.getInitMediRecord(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.today.medi-record";
	}

	/**
	 * 오늘의 진료 상세보기를 렌더링합니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.today.treatment-detail")
	 */
	@GetMapping(value = "/today/treatment/{appointmentSeq}")
	public String getTodayTreatmentDetail(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		TreatmentDetailDTO dto = practiceService.getTreatmentDetail(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.today.treatment-detail";
	}

	/**
	 * 모든 진료에서 예약 목록 페이지를 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param page 페이지 번호
	 * @param order 정렬
	 * @return 뷰 페이지 이름 ("hospital.medi.all.appointment-list")
	 */
	@GetMapping(value = "/all/appointment")
	public String getAllAppointmentList(Model model, @PathVariable String id,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue="old-regdate") String order) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);
		map.put("order", order);
		
		List<AppointmentListDTO> appointmentList = practiceService.getAllAppointmentList(map);

		// 페이지바 생성하기
		String pagebar = practiceService.getAllAppointmentListPageBar(map);
		
		model.addAttribute("id", id);
		model.addAttribute("order", order);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("appointmentList", appointmentList);

		return "hospital.medi.all.appointment-list";
	}

	/**
	 * 모든 진료 예약 세부 내역 페이지를 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.all.appointment-detail")
	 */
	@GetMapping(value = "/all/appointment/{appointmentSeq}")
	public String getAllAppointmentDetail(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		AppointmentDetailDTO dto = practiceService.getAppointmentDetail(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.all.appointment-detail";
	}

	/**
	 * 모든 진료 목록을 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param page 페이지 번호
	 * @param order 정렬
	 * @return 뷰 페이지 이름 ("hospital.medi.all.treatment-list")
	 */
	@GetMapping(value = "/all/treatment")
	public String getAllTreatmentList(Model model, @PathVariable String id,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "old-regdate") String order) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);
		map.put("order", order);

		// 진료 데이터 리스트
		List<TreatmentListDTO> treatmentList = practiceService.getAllTreatmentList(map);

		// 페이지바
		String pagebar = practiceService.getAllTreatmentListPageBar(map);

		model.addAttribute("treatmentList", treatmentList);
		model.addAttribute("pagebar", pagebar);
		model.addAttribute("order", order);

		return "hospital.medi.all.treatment-list";
	}

	/**
	 * 모든 진료 상세보기 페이지를 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.all.treatment-detail")
	 */
	@GetMapping(value = "/all/treatment/{appointmentSeq}")
	public String getAllTreatmentDetail(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		TreatmentDetailDTO dto = practiceService.getTreatmentDetail(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.all.treatment-detail";
	}

	/**
	 * 모든 진료에서 진료내역서 작성을 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @param appointmentSeq 예약번호
	 * @return 뷰 페이지 이름 ("hospital.medi.all.medi-record")
	 */
	@GetMapping(value = "/all/treatment/{appointmentSeq}/record")
	public String writeMediRecord(Model model, @PathVariable String id, @PathVariable int appointmentSeq) {

		// 기본 내용 가져오기 - 예약번호, 병원이름, 의사이름
		RecordDTO dto = practiceService.getInitMediRecord(appointmentSeq);

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);

		return "hospital.medi.all.medi-record";
	}

	/**
	 * 환자 목록을 렌더링하는 메소드입니다.
	 * 
	 * @param model 데이터를 뷰에 전달하는 Model 객체
	 * @param id 병원 아이디
	 * @return 뷰 페이지 이름 ("hospital.medi.patient")
	 */
	@GetMapping(value = "/patient")
	public String getPatientList(Model model, @PathVariable String id) {

		List<PatientDTO> patientList = patientService.getPatientList(id);

		model.addAttribute("id", id);
		model.addAttribute("patientList", patientList);

		return "hospital.medi.patient";
	}
}
