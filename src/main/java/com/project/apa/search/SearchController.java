/**
 * 검색 관련 기능을 처리하는 컨트롤러 클래스입니다.
 */
package com.project.apa.search;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.apa.api.search.model.HospitalInfoDTO;
import com.project.apa.api.search.model.PharmacyDTO;
import com.project.apa.api.search.model.ReviewDTO;
import com.project.apa.api.search.service.SearchService;

/**
 * 검색과 관련된 동작을 관리하는 컨트롤러 클래스입니다.
 */
@Controller
@RequestMapping(value = "/search")
public class SearchController {

    @Autowired
    private SearchService service;

    /**
     * 검색 목록 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model        뷰 렌더링에 사용되는 모델
     * @param loginuserseq 로그인한 사용자의 일련번호
     * @return 검색 목록 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/list.do")
    public String list(Model model, String loginuserseq) {

        model.addAttribute("symtomlist", service.symtomlist());
        model.addAttribute("deptlist", service.deptlist());
        model.addAttribute("loginuserseq", loginuserseq);

        return "search.list";
    }

    /**
     * 약국 목록 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model 뷰 렌더링에 사용되는 모델
     * @return 약국 목록 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/pharmacylist.do")
    public String pharmacylist(Model model) {
        Date nowtime = new Date();
        Date opentime = new Date();
        Date closetime = new Date();
        List<PharmacyDTO> list = service.pharmacylist();
        for (PharmacyDTO dto : list) {

            opentime.setHours(Integer.parseInt(dto.getOpentime().substring(0, 2)));
            opentime.setMinutes(Integer.parseInt(dto.getOpentime().substring(3, 5)));
            closetime.setHours(Integer.parseInt(dto.getClosetime().substring(0, 2)));
            closetime.setMinutes(Integer.parseInt(dto.getClosetime().substring(3, 5)));
            long timeopen = opentime.getTime();
            long timeclose = closetime.getTime();
            long timenow = nowtime.getTime();
            if (timeopen <= timenow && timeclose >= timenow) {
                dto.setOpentime("영업중");
            } else {
                dto.setOpentime("영업종료");
            }
        }
        model.addAttribute("list", list);

        return "search.pharmacylist";
    }

    /**
     * 상세 정보 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model        뷰 렌더링에 사용되는 모델
     * @param seq          일련번호
     * @param loginuserseq 로그인한 사용자의 일련번호
     * @return 상세 정보 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/view.do")
    public String view(Model model, String seq, String loginuserseq) {

        int positive = 0;
        int negative = 0;

        List<ReviewDTO> reviewtaglist = service.reviewtaglist(seq);

        for (ReviewDTO dto : reviewtaglist) {
            if (dto.getTagType().equals("긍정")) {
                positive++;
            } else {
                negative++;
            }
        }
        if (positive == 0 && negative == 0) {
            positive = 0;
        } else {
            positive = (positive * 100 / (positive + negative));
        }
        HospitalInfoDTO hospitallist = service.hospitalInfo(seq);
        hospitallist.setOpentime(hospitallist.getOpentime().substring(11, 16));
        hospitallist.setClosetime(hospitallist.getClosetime().substring(11, 16));
        hospitallist.setRestopentime(hospitallist.getRestopentime().substring(11, 16));
        hospitallist.setRestclosetime(hospitallist.getRestclosetime().substring(11, 16));

        model.addAttribute("dto", hospitallist);
        model.addAttribute("deptlist", service.deptlist(seq));
        model.addAttribute("doclist", service.doclist(seq));
        model.addAttribute("reviewlist", service.reviewlist(seq));
        model.addAttribute("positive", positive);
        model.addAttribute("negative", negative);
        model.addAttribute("reviewtaglist", reviewtaglist);
        model.addAttribute("loginuserseq", loginuserseq);
        model.addAttribute("bookmarkcount", service.bookmarkcount(seq));

        return "search.view";
    }

    /**
     * 약국 상세 정보 페이지를 표시하는 요청을 처리합니다.
     *
     * @param model 뷰 렌더링에 사용되는 모델
     * @param seq   일련번호
     * @return 약국 상세 정보 페이지의 논리적인 뷰 이름
     */
    @GetMapping(value = "/pharmacyview.do")
    public String pharmacyview(Model model, String seq) {

        model.addAttribute("dto", service.pharmacyinfo(seq));

        return "search.pharmacyview";
    }

}
