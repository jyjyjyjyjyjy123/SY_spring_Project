package com.project.apa.api.hospital.medi.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.apa.api.hospital.medi.domain.AppointmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.AppointmentListDTO;
import com.project.apa.api.hospital.medi.domain.RecordDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentDetailDTO;
import com.project.apa.api.hospital.medi.domain.TreatmentListDTO;
import com.project.apa.api.hospital.medi.persistence.AppointmentDetailDAO;
import com.project.apa.api.hospital.medi.persistence.AppointmentListDAO;
import com.project.apa.api.hospital.medi.persistence.RecordDAO;
import com.project.apa.api.hospital.medi.persistence.TreatmentDetailDAO;
import com.project.apa.api.hospital.medi.persistence.TreatmentListDAO;

/**
 * 진료 관리 서비스의 구현 클래스입니다.
 * 병원 내 예약 및 진료와 관련된 다양한 기능을 구현하고 있습니다.
 * 서비스 레이어에서 비즈니스 로직을 처리합니다.
 * 
 * @author Eunha
 *
 */
@Service
public class PracticeServiceImpl implements PracticeService {

	@Autowired
	private AppointmentListDAO appointmentListDAO;

	@Autowired
	private AppointmentDetailDAO appointmentDetailDAO;

	@Autowired
	private TreatmentListDAO treatmentListDAO;

	@Autowired
	private TreatmentDetailDAO treatmentDetailDAO;

	@Autowired
	private RecordDAO recordDAO;

	/**
	 * 오늘 예약된 환자 목록과 페이지 정보를 반환합니다.
	 * 
	 * @param map 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 오늘 예약된 환자 목록과 페이지 정보
	 */
	@Override
	public Map<String, Object> getTodayAppointmentList(HashMap<String, Object> map) {

		int page = (int) map.get("page");

		int end = page * 10;
		int begin = end - 9;

		map.put("begin", begin);
		map.put("end", end);

		List<AppointmentListDTO> orgList = appointmentListDAO.getTodayAppointmentList(map);
		List<AppointmentListDTO> shortenList = new ArrayList<>();

		// 상세증상 줄이기
		for (AppointmentListDTO dto : orgList) {
			String symptom = dto.getSymptom();

			if (symptom != null && symptom.length() > 20) {
				symptom = symptom.substring(0, 20) + "...";
				dto.setSymptom(symptom);
			}
			shortenList.add(dto);
		}

		Map<String, Object> result = new HashMap<>();
		result.put("list", shortenList);
		result.put("pagebar", getTodayAppointmentListPageBar(map)); // 페이지바 정보 추가

		return result;
	}

	/**
	 * 오늘 예약된 환자 목록의 페이지바 정보를 반환합니다.
	 * 
	 * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 페이지바 정보
	 */
	@Override
	public String getTodayAppointmentListPageBar(HashMap<String, Object> map) {

		int nowPage = 0;
		int totalCount = 0; // 해당 병원의 총 오늘의 예약 수
		int pageSize = 10; // 한 페이지에서 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 페이징 시작 위치
		int end = 0; // 페이징 끝 위치
		int n = 0; // 현재 페이지
		int loop = 0;
		int blockSize = 10; // 한번에 보여줄 페이지 개수

		nowPage = (int) map.get("page");

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		totalCount = appointmentListDAO.getTodayAppointmentCount((String) map.get("id"));

		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		StringBuilder sb = new StringBuilder();

		loop = 1; // 루프 변수(10바퀴)

		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

		// 이전 10페이지
		if (n == 1) {
			sb.append(" <a href='#!';>[이전 페이지]</a>&nbsp;&nbsp;");
		} else {
			sb.append(String.format(
					" <a href='/apa/hospital/%s/medi/today/appointment?page=%d';>[이전 페이지]</a>&nbsp;&nbsp;",
					(String) map.get("id"), n - 1));
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color:tomato;'>%d</a>&nbsp;&nbsp;", n));
			} else {
				sb.append(String.format(" <a href='/apa/hospital/%s/medi/today/appointment?page=%d'>%d</a>&nbsp;&nbsp;",
						(String) map.get("id"), n, n));
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			sb.append(" <a href='#!';>[다음 페이지]</a> ");
		} else {
			sb.append(String.format(" <a href='/apa/hospital/%s/medi/today/appointment?page=%d';>[다음 페이지]</a> ",
					(String) map.get("id"), n));
		}

		return sb.toString();
	}

	/**
	 * 오늘 진료된 환자 목록과 페이지 정보를 반환합니다.
	 * 
	 * @param map 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 오늘 진료된 환자 목록과 페이지 정보
	 */
	@Override
	public Map<String, Object> getTodayTreatmentList(HashMap<String, Object> map) {

		int page = (int) map.get("page");

		int end = page * 10;
		int begin = end - 9;

		map.put("begin", begin);
		map.put("end", end);

		List<TreatmentListDTO> orgList = treatmentListDAO.getTodayTreatmentList(map);
		List<TreatmentListDTO> shortenList = new ArrayList<>();

		// 데이터 수정하기
		for (TreatmentListDTO dto : orgList) {
			// 상세증상 줄이기
			String symptom = dto.getSymptom();

			if (symptom != null && symptom.length() > 20) {
				symptom = symptom.substring(0, 20) + "...";
				dto.setSymptom(symptom);
			}

			shortenList.add(dto);
		}

		String pagebar = getTodayTreatmentListPageBar(map);

		Map<String, Object> result = new HashMap<>();
		result.put("list", shortenList);
		result.put("pagebar", pagebar); // 페이지바 정보 추가

		return result;
	}

	/**
	 * 오늘 진료된 환자 목록의 페이지바 정보를 반환합니다.
	 * 
	 * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 페이지바 정보
	 */
	@Override
	public String getTodayTreatmentListPageBar(HashMap<String, Object> map) {

		int nowPage = 0;
		int totalCount = 0; // 해당 병원의 총 오늘의 진료 수
		int pageSize = 10; // 한 페이지에서 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 페이징 시작 위치
		int end = 0; // 페이징 끝 위치
		int n = 0; // 현재 페이지
		int loop = 0;
		int blockSize = 10; // 한번에 보여줄 페이지 개수

		nowPage = (int) map.get("page");

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		totalCount = treatmentListDAO.getTodayTreatmentCount((String) map.get("id"));

		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		StringBuilder sb = new StringBuilder();

		loop = 1; // 루프 변수(10바퀴)

		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

		// 이전 10페이지
		if (n == 1) {
			sb.append(" <a href='#!';>[이전 페이지]</a>&nbsp;&nbsp;");
		} else {
			sb.append(
					String.format(" <a href='/apa/hospital/%s/medi/today/treatment?page=%d';>[이전 페이지]</a>&nbsp;&nbsp;",
							(String) map.get("id"), n - 1));
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color:tomato;'>%d</a>&nbsp;&nbsp;", n));
			} else {
				sb.append(String.format(" <a href='/apa/hospital/%s/medi/today/treatment?page=%d'>%d</a>&nbsp;&nbsp;",
						(String) map.get("id"), n, n));
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			sb.append(" <a href='#!';>[다음 페이지]</a> ");
		} else {
			sb.append(String.format(" <a href='/apa/hospital/%s/medi/today/treatment?page=%d';>[다음 페이지]</a> ",
					(String) map.get("id"), n));
		}

		return sb.toString();
	}

	/**
	 * 예약된 모든 환자 목록을 조회합니다.
	 * 
	 * @param map 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 예약된 모든 환자 목록
	 */
	@Override
	public List<AppointmentListDTO> getAllAppointmentList(HashMap<String, Object> map) {

		int page = (int) map.get("page");

		int end = page * 10;
		int begin = end - 9;

		map.put("begin", begin);
		map.put("end", end);

		String order = (String) map.get("order");

		List<AppointmentListDTO> orgList = null;

		// 정렬 적용
		if (order.equals("old-regdate")) {
			orgList = appointmentListDAO.getAllAppointmentListOld(map);
		} else {
			orgList = appointmentListDAO.getAllAppointmentListLast(map);
		}

		List<AppointmentListDTO> shortenList = new ArrayList<>();

		// 상세증상 줄이기
		for (AppointmentListDTO dto : orgList) {
			String symptom = dto.getSymptom();

			if (symptom != null && symptom.length() > 20) {
				symptom = symptom.substring(0, 20) + "...";
				dto.setSymptom(symptom);
			}
			shortenList.add(dto);
		}

		return shortenList;
	}

	/**
	 * 예약된 모든 환자 목록의 페이지바 정보를 반환합니다.
	 * 
	 * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 페이지바 정보
	 */
	@Override
	public String getAllAppointmentListPageBar(HashMap<String, Object> map) {

		int nowPage = 0;
		int totalCount = 0; // 해당 병원의 총 예약 수
		int pageSize = 10; // 한 페이지에서 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 페이징 시작 위치
		int end = 0; // 페이징 끝 위치
		int n = 0; // 현재 페이지
		int loop = 0;
		int blockSize = 10; // 한번에 보여줄 페이지 개수

		nowPage = (int) map.get("page");

		String order = (String) map.get("order"); // 정렬 키워드
		String orderTail = ""; // 정렬이 적용된 페이지 호출을 위한 매개변수 문자열

		if (order.equals("old-regdate")) {
			orderTail = "&order=old-regdate";
		} else {
			orderTail = "&order=last-regdate";
		}

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		totalCount = appointmentListDAO.getAllAppointmentCount((String) map.get("id"));

		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		StringBuilder sb = new StringBuilder();

		loop = 1; // 루프 변수(10바퀴)

		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

		// 이전 10페이지
		if (n == 1) {
			sb.append(" <a href='#!';>[이전 페이지]</a>&nbsp;&nbsp;");
		} else {
			sb.append(String.format(
					" <a href='/apa/hospital/%s/medi/all/appointment?page=%d%s';>[이전 페이지]</a>&nbsp;&nbsp;",
					(String) map.get("id"), n - 1, orderTail));
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color:tomato;'>%d</a>&nbsp;&nbsp;", n));
			} else {
				sb.append(String.format(" <a href='/apa/hospital/%s/medi/all/appointment?page=%d%s'>%d</a>&nbsp;&nbsp;",
						(String) map.get("id"), n, orderTail, n));
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			sb.append(" <a href='#!';>[다음 페이지]</a> ");
		} else {
			sb.append(String.format(" <a href='/apa/hospital/%s/medi/all/appointment?page=%d%s';>[다음 페이지]</a> ",
					(String) map.get("id"), n, orderTail));
		}

		return sb.toString();
	}

	/**
	 * 예약 상세 정보를 조회합니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 예약 상세 정보
	 */
	@Override
	public AppointmentDetailDTO getAppointmentDetail(int appointmentSeq) {

		return appointmentDetailDAO.getAppointmentDetail(appointmentSeq);
	}

	/**
	 * 예약을 승인합니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 승인 결과 (성공 시 1, 실패 시 0)
	 */
	@Override
	public int approveAppointment(int appointmentSeq) {

		return appointmentDetailDAO.approveAppointment(appointmentSeq);
	}

	/**
	 * 예약을 거절합니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 거절 결과 (성공 시 1, 실패 시 0)
	 */
	@Override
	public int declineAppointment(int appointmentSeq) {

		return appointmentDetailDAO.declineAppointment(appointmentSeq);
	}

	/**
	 * 모든 진료 목록을 조회합니다.
	 * 
	 * @param map 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 모든 진료 목록
	 */
	@Override
	public List<TreatmentListDTO> getAllTreatmentList(HashMap<String, Object> map) {

		int page = (int) map.get("page");

		int end = page * 10;
		int begin = end - 9;

		map.put("begin", begin);
		map.put("end", end);

		// 정렬 적용
		String order = (String) map.get("order");

		List<TreatmentListDTO> orgList = null;

		if (order.equals("old-regdate")) { // 오래된 진료일순

			orgList = treatmentListDAO.getAllTreatmentListOldRegDate(map);

		} else if (order.equals("last-regdate")) {

			orgList = treatmentListDAO.getAllTreatmentListLastRegDate(map);

		} else if (order.equals("appointmentseq")) {

			orgList = treatmentListDAO.getAllTreatmentListAppointmentSeq(map);
		}

		List<TreatmentListDTO> shortenList = new ArrayList<>();

		// 데이터 수정하기
		for (TreatmentListDTO dto : orgList) {

			// 상세증상 줄이기
			String symptom = dto.getSymptom();

			if (symptom != null && symptom.length() > 20) {

				symptom = symptom.substring(0, 20) + "...";

				dto.setSymptom(symptom);
			}

			shortenList.add(dto);
		}

		return shortenList;
	}

	/**
	 * 모든 진료 목록의 페이지바 정보를 반환합니다.
	 * 
	 * @param map 페이지 정보 조회에 필요한 매개변수들이 담긴 HashMap
	 * @return 페이지바 정보
	 */
	@Override
	public String getAllTreatmentListPageBar(HashMap<String, Object> map) {

		int nowPage = 0;
		int totalCount = 0; // 해당 병원의 총 진료 수
		int pageSize = 10; // 한 페이지에서 출력할 게시물 수
		int totalPage = 0; // 총 페이지 수
		int begin = 0; // 페이징 시작 위치
		int end = 0; // 페이징 끝 위치
		int n = 0; // 현재 페이지
		int loop = 0;
		int blockSize = 10; // 한번에 보여줄 페이지 개수

		nowPage = (int) map.get("page");

		// 정렬
		String order = (String) map.get("order");
		String orderTail = "";

		if (order.equals("old-regdate")) { // 오래된 진료일순
			orderTail = "&order=old-regdate";
		} else if (order.equals("last-regdate")) {
			orderTail = "&order=last-regdate";
		} else if (order.equals("appointmentseq")) {
			orderTail = "&order=appointmentseq";
		}

		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		totalCount = treatmentListDAO.getAllTreatmentCount((String) map.get("id"));

		totalPage = (int) Math.ceil((double) totalCount / pageSize);

		StringBuilder sb = new StringBuilder();

		loop = 1; // 루프 변수(10바퀴)

		n = ((nowPage - 1) / blockSize) * blockSize + 1; // 출력 페이지 번호

		// 이전 10페이지
		if (n == 1) {
			sb.append(" <a href='#!';>[이전 페이지]</a>&nbsp;&nbsp;");
		} else {
			sb.append(
					String.format(" <a href='/apa/hospital/%s/medi/all/treatment?page=%d%s';>[이전 페이지]</a>&nbsp;&nbsp;",
							(String) map.get("id"), n - 1, orderTail));
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color:tomato;'>%d</a>&nbsp;&nbsp;", n));
			} else {
				sb.append(String.format(" <a href='/apa/hospital/%s/medi/all/treatment?page=%d%s'>%d</a>&nbsp;&nbsp;",
						(String) map.get("id"), n, orderTail, n));
			}

			loop++;
			n++;
		}

		// 다음 10페이지
		if (n > totalPage) {
			sb.append(" <a href='#!';>[다음 페이지]</a> ");
		} else {
			sb.append(String.format(" <a href='/apa/hospital/%s/medi/all/treatment?page=%d%s';>[다음 페이지]</a> ",
					(String) map.get("id"), n, orderTail));
		}

		return sb.toString();
	}

	/**
	 * 모든 진료의 상세 정보를 조회합니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 진료의 상세 정보
	 */
	@Override
	public TreatmentDetailDTO getTreatmentDetail(int appointmentSeq) {

		return treatmentDetailDAO.getTreatmentDetail(appointmentSeq);
	}

	/**
	 * 환자를 호출하는 메소드입니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 호출 결과 (성공 시 1, 실패 시 0)
	 */
	@Override
	public int callPatient(int appointmentSeq) {

		return treatmentDetailDAO.callPatient(appointmentSeq);
	}

	/**
	 * 건강검진이나 예방접종의 경우, 진료완료 처리만 진행하는 메소드입니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 완료 처리 결과 (성공 시 1, 실패 시 0)
	 */
	@Override
	public int completeTreatment(String appointmentSeq) {

		return recordDAO.changeTreatmentStatus(appointmentSeq);
	}

	/**
	 * 진료 내역서의 초기 정보를 가져오는 메소드입니다.
	 * 
	 * @param appointmentSeq 예약번호
	 * @return 초기 진료 내역서 정보
	 */

	@Override
	public RecordDTO getInitMediRecord(int appointmentSeq) {

		return recordDAO.getInitMediRecord(appointmentSeq);
	}

	/**
	 * 진료 내역서를 작성하는 메소드입니다.
	 * 
	 * @param data 진료 내역서 작성에 필요한 데이터
	 * @return 작성 결과 (성공 시 1, 실패 시 0)
	 */
	@Override
	public int writeMediRecord(Map<String, String> data) {

		// 진료내역서 작성
		int result1 = recordDAO.writeMediRecord(data);

		String appointmentSeq = data.get("appointmentSeq");

		if (result1 != 1) {
			System.out.println("진료내역서 작성 실패");
			return 0;
		}

		// 약 제조 대기 테이블에 추가
		// 약 제조 대기 테이블에서 약 제조번호 찾기
		String dispenseListSeq = recordDAO.getDispenseListSeq(appointmentSeq);

		// 약 진행상태를 '제조대기'로 추가
		int result2 = recordDAO.insertDispenseStatus(dispenseListSeq);

		if (result2 != 1) {
			System.out.println("약 제조 상태 변경 실패");
			return 0;
		}

		// 진료상태 변경
		int result3 = recordDAO.changeTreatmentStatus(appointmentSeq);

		if (result3 != 1) {
			System.out.println("진료상태 변경 실패");
			return 0;
		}

		return 1;
	}
}
