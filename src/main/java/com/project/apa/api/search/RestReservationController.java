/**
 * 예약과 관련된 RESTful API를 처리하는 컨트롤러 클래스입니다.
 */
package com.project.apa.api.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.search.model.ChildInfoDTO;
import com.project.apa.api.search.model.HospitalDoctorDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReservationHospitalAppointmentDTO;
import com.project.apa.api.search.model.ReservationPharmacyAppointmentDTO;
import com.project.apa.api.search.service.SearchService;

/**
 * 예약과 관련된 RESTful API를 처리하는 컨트롤러 클래스입니다.
 */
@RestController
@RequestMapping("/search/reservation")
public class RestReservationController {

    @Autowired
    private SearchService service;

    /**
     * 의사를 찾는 요청을 처리합니다.
     *
     * @param dto 의사 정보 DTO
     * @return 해당 부서의 의사 목록
     */
    @PostMapping(value = "/finddoc")
    public List<HospitalDoctorDTO> finddoc(@RequestBody HospitalDoctorDTO dto) {

        List<HospitalDoctorDTO> list = service.finddeptdoc(dto);

        return list;
    }

    /**
     * 어린이 정보를 조회하는 요청을 처리합니다.
     *
     * @param childseq 어린이 일련번호
     * @return 어린이 정보 DTO
     */
    @PostMapping(value = "/child")
    public ChildInfoDTO child(@RequestBody String childseq) {
        return service.childinfo(childseq);
    }

    /**
     * 약국 선택을 처리하는 요청을 처리합니다.
     *
     * @param parmacyseq 약국 일련번호
     * @return 선택한 약국의 정보 DTO
     */
    @PostMapping(value = "/pharmacychoice")
    public PharmacyDTO pharmacychoice(@RequestBody String parmacyseq) {
        return service.pharmacychoice(parmacyseq);
    }
}
