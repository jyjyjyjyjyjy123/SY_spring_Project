/**
 * 검색과 관련된 RESTful API를 처리하는 컨트롤러 클래스입니다.
 */
package com.project.apa.api.search;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.search.model.BookMarkDTO;
import com.project.apa.api.search.model.FindHospitalDTO;
import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.SelfsymtomDTO;
import com.project.apa.api.search.service.SearchService;

/**
 * 검색과 관련된 RESTful API를 처리하는 컨트롤러 클래스입니다.
 */
@RestController
@RequestMapping("/search")
public class RestSearchController {

    @Autowired
    private SearchService service;

    /**
     * 태그를 기반으로 병원을 검색하는 요청을 처리합니다.
     *
     * @param dto FindHospitalDTO 객체
     * @return 병원 정보 목록
     */
    @PostMapping(value = "/tagfind")
    public List<HospitalInfoDTO> tagfind(@RequestBody FindHospitalDTO dto) {

        List<String> findsystomlist = service.findsystomlist(dto);
        List<HospitalInfoDTO> list = null;
        if (findsystomlist.isEmpty()) {
            list = service.findHospitalList2(dto.getDeptseq());
        } else {
            list = service.findHospitalList(findsystomlist);
        }
        Date nowtime = new Date();
        Date opentime = new Date();
        Date closetime = new Date();
        for (HospitalInfoDTO HosInfodto : list) {

            opentime.setHours(Integer.parseInt(HosInfodto.getOpentime().substring(11, 13)));
            opentime.setMinutes(Integer.parseInt(HosInfodto.getOpentime().substring(14, 16)));
            closetime.setHours(Integer.parseInt(HosInfodto.getClosetime().substring(11, 13)));
            closetime.setMinutes(Integer.parseInt(HosInfodto.getClosetime().substring(14, 16)));
            long timeopen = opentime.getTime();
            long timeclose = closetime.getTime();
            long timenow = nowtime.getTime();
            if (timeopen <= timenow && timeclose >= timenow) {
                HosInfodto.setOpentime("영업중");
            } else {
                HosInfodto.setOpentime("영업종료");
            }

        }
        return list;
    }

    /**
     * 부서를 기반으로 증상을 찾는 요청을 처리합니다.
     *
     * @param dto HospitalInfoDTO 객체
     * @return 부서별 증상 목록
     */
    @PostMapping(value = "/deptfind")
    public List<SelfsymtomDTO> deptfind(@RequestBody HospitalInfoDTO dto) {
        System.out.println(dto.getHospitalid());
        return service.finddept(dto);
    }

    /**
     * 북마크 추가 요청을 처리합니다.
     *
     * @param dto BookMarkDTO 객체
     * @return 북마크 추가 결과 (성공 시 1, 실패 시 0)
     */
    @PostMapping(value = "/bookmark")
    public int bookmark(@RequestBody BookMarkDTO dto) {
        return service.bookmarkin(dto);
    }

    /**
     * 북마크 제거 요청을 처리합니다.
     *
     * @param dto BookMarkDTO 객체
     * @return 북마크 제거 결과 (성공 시 1, 실패 시 0)
     */
    @PostMapping(value = "/bookmarkout")
    public int bookmarkout(@RequestBody BookMarkDTO dto) {
        return service.bookmarkout(dto);
    }
}
