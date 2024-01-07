/**
 * 예약과 관련된 기능을 처리하는 컨트롤러 클래스입니다.
 */
package com.project.apa.search;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;
import com.project.apa.api.search.model.UserInfoDTO;
import com.project.apa.api.search.service.SearchService;

/**
 * 예약과 관련된 동작을 관리하는 컨트롤러 클래스입니다.
 */
@Controller
@RequestMapping(value = "/search/reservation")
public class ReservationController {

    @Autowired
    private SearchService service;

    /**
     * 선택 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model      뷰 렌더링에 사용되는 모델
     * @param seq        일련번호
     * @param choicetype 선택 유형
     * @return 선택 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/select.do")
    public String select(Model model, String seq, String choicetype) {

        HospitalInfoDTO dto = service.hospitalInfo(seq);
        dto.setOpentime(dto.getOpentime().substring(11, 16));
        dto.setClosetime(dto.getClosetime().substring(11, 16));
        dto.setRestopentime(dto.getRestopentime().substring(11, 16));
        dto.setRestclosetime(dto.getRestclosetime().substring(11, 16));

        model.addAttribute("dto", dto);
        model.addAttribute("deptlist", service.deptlist(seq));
        model.addAttribute("doclist", service.doclist(seq));
        model.addAttribute("choicetype", choicetype);

        return "search.reservation.select";
    }

    /**
     * 상세 정보 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model         뷰 렌더링에 사용되는 모델
     * @param seq           일련번호
     * @param choicetype    선택 유형
     * @param choicedoc     선택 의사
     * @param choicedate    선택 날짜
     * @param choicetime    선택 시간
     * @param userid        사용자 ID
     * @return 상세 정보 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/detail.do")
    public String detail(Model model, String seq, String choicetype, String choicedoc, String choicedate, String choicetime, String userid) {

        String userseq = service.getuserseq(userid);

        UserInfoDTO userlist = service.userlist(userseq);

        model.addAttribute("firstssn", userlist.getUserssn().substring(0, 6));
        model.addAttribute("lastssn", userlist.getUserssn().substring(7));
        model.addAttribute("firsttel", userlist.getUsertel().substring(0, 3));
        model.addAttribute("middeltel", userlist.getUsertel().substring(4, 8));
        model.addAttribute("lastltel", userlist.getUsertel().substring(9));

        model.addAttribute("userseq", userseq);
        model.addAttribute("hospitalid", seq);
        model.addAttribute("choicetype", choicetype);
        model.addAttribute("choicedoc", choicedoc);
        model.addAttribute("choicedate", choicedate);
        model.addAttribute("choicetime", choicetime);
        model.addAttribute("userlist", userlist);
        model.addAttribute("childlist", service.childlist(userseq));

        model.addAttribute("pharmacylist", service.pharmacylist());

        return "search.reservation.detail";
    }

    /**
     * 예약 완료 페이지를 표시하는 요청을 처리합니다.
     *
     * @param rhadto             병원 예약 정보 DTO
     * @param rpadto             약국 예약 정보 DTO
     * @param username           사용자 이름
     * @param choicepharmacytime 선택한 약국 시간
     * @param model              뷰 렌더링에 사용되는 모델
     * @return 예약 완료 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/complete.do")
    public String detail(ReservationHospitalAppointmentDTO rhadto, ReservationPharmacyAppointmentDTO rpadto, String username, String choicepharmacytime, Model model) {

        service.addHospitalAppintment(rhadto);
        service.addHospitalAppintmentStatus();

        if (rpadto.getPharmacyid() != "" && rpadto.getPharmacyid() != null) {
            rpadto.setRegdate(rhadto.getAppointmentdate().substring(0, 11) + "" + choicepharmacytime + ":00");
            service.addPharmacyAppintment(rpadto);
            service.addPharmacyAppintmentStatus();
        }
        model.addAttribute("username", username);
        return "search.reservation.complete";
    }

}
