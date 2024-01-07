package com.project.apa.api.hospital.medi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.api.hospital.medi.domain.PatientDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;
import com.project.apa.api.hospital.medi.service.PatientService;
import com.project.apa.api.hospital.medi.service.PracticeService;

/**
 * 병원 - 내 진료 메뉴와 관련된 엔드포인트를 처리합니다. 필요한 데이터를 가져오기 위해 예약 서비스 및 진료 서비스를 사용합니다.
 * 
 * @author Eunha
 *
 */
@RestController
@RequestMapping("/api/hospital/{id}/medi")
public class RestHospitalMediController {

	@Autowired
	private PatientService patientService;

	@Autowired
	private PracticeService practiceService;

	/**
	 * 오늘의 진료 메뉴에서 예약 목록을 조회하는 엔드포인트입니다.
	 * 
	 * @param id   조회할 병원 아이디
	 * @param page 보여줄 페이지 번호
	 * @return 예약 데이터 리스트와 페이지바 문자열이 담긴 맵
	 */
	@GetMapping(value = "/today/appointment")
	public Map<String, Object> getTodayAppointmentList(@PathVariable(name = "id") String id,
			@RequestParam(defaultValue = "1") int page) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);

		return practiceService.getTodayAppointmentList(map);
	}

	/**
	 * 오늘의 진료 메뉴에서 진료 목록을 조회하는 엔드포인트입니다.
	 * 
	 * @param id   병원 아이디
	 * @param page 페이지 번호 (기본값: 1)
	 * @return 진료 데이터 리스트와 페이지바 문자열이 담긴 맵
	 */
	@GetMapping(value = "/today/treatment")
	public Map<String, Object> getTodayTreatmentList(@PathVariable(name = "id") String id,
			@RequestParam(defaultValue = "1") int page) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);

		return practiceService.getTodayTreatmentList(map);
	}

	/**
	 * 모든 진료 메뉴에서 예약 목록을 조회하는 엔드포인트입니다.
	 *
	 * @param id    병원 아이디
	 * @param page  페이지 번호 (기본값: 1)
	 * @param order 정렬 키워드 (기본값: "old-regdate")
	 * @return 예약 목록이 담긴 리스트
	 */
	@GetMapping(value = "/all/appointment")
	public List<AppointmentListDTO> getAllAppointmentList(@PathVariable String id,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "old-regdate") String order) {

		// 매개변수를 Map에 담아 서비스로 전달
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);
		map.put("order", order);

		return practiceService.getAllAppointmentList(map);
	}

	/**
	 * 모든 진료 메뉴에서 예약 상세 내역을 조회하는 엔드포인트입니다.
	 * 
	 * @param appointmentSeq 조회할 예약번호
	 * @return 해당 예약번호의 예약 내역 DTO
	 */
	@GetMapping(value = "/all/appointment/{appointmentSeq}")
	public AppointmentDetailDTO getAppointmentDetail(@PathVariable int appointmentSeq) {

		return practiceService.getAppointmentDetail(appointmentSeq);
	}

	/**
	 * 진료 예약을 승인 또는 거절하는 엔드포인트입니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @param data           승인 또는 거절을 나타내는 키워드가 담긴 맵 
	 * 							- "action" 값이 "approve"일 경우, 해당 예약을 승인합니다. 
	 * 							- "action" 값이 "decline"일 경우, 해당 예약을 거절합니다.
	 * @return 성공 시 1, 실패 시 0
	 */
	@PutMapping(value = { "/today/appointment/{appointmentSeq}", "/all/appointment/{appointmentSeq}" })
	public int handleAppointment(@PathVariable int appointmentSeq, @RequestBody Map<String, String> data) {

		String action = data.get("action");

		// 승인할 경우
		if (action.equals("approve")) {

			return practiceService.approveAppointment(appointmentSeq);
		}

		// 거절할 경우
		return practiceService.declineAppointment(appointmentSeq);
	}

	/**
	 * 모든 진료 메뉴의 진료 목록을 조회하는 엔드포인트입니다.
	 * 
	 * @param id    병원 아이디
	 * @param page  페이지 번호 (기본값: 1)
	 * @param order 정렬 키워드 (기본값: "old-regdate")
	 * @return 진료 목록이 담긴 리스트
	 */
	@GetMapping(value = "/all/treatment")
	public List<TreatmentListDTO> getAllTreatmentList(@PathVariable String id,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "old-regdate") String order) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("page", page);
		map.put("order", order);

		return practiceService.getAllTreatmentList(map);
	}

	/**
	 * 모든 진료 메뉴에서 진료 상세정보를 조회하는 엔드포인트입니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 해당 예약번호의 진료 상세정보 DTO
	 */
	@GetMapping(value = "/all/treatment/{appointmentSeq}")
	public TreatmentDetailDTO getAllTreatmentDetail(@PathVariable int appointmentSeq) {

		return practiceService.getTreatmentDetail(appointmentSeq);
	}

	/**
	 * 환자를 호출하거나 진료완료 처리를 하는 엔드포인트입니다.
	 * 
	 * @param appointmentSeq 예약번호
	  * @param data           승인 또는 거절을 나타내는 키워드가 담긴 맵 
	 * 							- "action" 값이 "approve"일 경우, 해당 예약을 승인합니다. 
	 * 							- "action" 값이 "decline"일 경우, 해당 예약을 거절합니다.
	 * @return 성공 시 1, 실패 시 0
	 */
	@PutMapping(value = { "/today/treatment/{appointmentSeq}", "/all/treatment/{appointmentSeq}" })
	public int handleTreatmentDetail(@PathVariable int appointmentSeq, @RequestBody HashMap<String, String> data) {

		String action = data.get("action");

		// 환자를 호출할 경우
		if (action.equals("call")) {

			return practiceService.callPatient(appointmentSeq);
		}

		// 진료완료를 할 경우(예방접종, 건강검진만)
		return practiceService.completeTreatment(appointmentSeq + "");
	}

	/**
	 * 진료내역서를 작성하고 진료완료처리를 하는 엔드포인트입니다.
	 * 
	 * @param data 작성한 진료내역서 정보
	 * @return 성공 시 1, 실패 시 0
	 */
	@PutMapping(value = { "/today/treatment/{appointmentSeq}/record", "/all/treatment/{appointmentSeq}/record" })
	public int writeMediRecord(@RequestBody HashMap<String, String> data) {

		return practiceService.writeMediRecord(data);
	}

	/**
	 * 내원환자 목록을 조회하는 엔드포인트입니다.
	 * 
	 * @param id 병원 아이디
	 * @return 내원환자 목록 정보가 담긴 리스트
	 */
	@GetMapping(value = "/patient")
	public List<PatientDTO> getPatientList(@PathVariable String id) {

		return patientService.getPatientList(id);
	}
}
