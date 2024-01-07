package com.project.apa.pharmacy;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.apa.api.pharmacy.domain.DispenseCntDTO;
import com.project.apa.api.pharmacy.domain.DispenseDTO;
import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;
import com.project.apa.api.pharmacy.persistence.DispenseDAO;
import com.project.apa.api.pharmacy.persistence.DispenseRepository;
import com.project.apa.api.pharmacy.service.DispenseService;
import com.project.apa.api.pharmacy.service.PharmacyInfoService;
import com.project.apa.mapper.PharmacyMapper;

/**
 * PharmacyController는 약국 정보와 관련된 페이지를 관리하는 컨트롤러입니다.
 * @author 김민정
 */
@Controller
@RequestMapping("/pharmacy/{id}")
//@RequestMapping("/pharmacy/sla0623")
public class PharmacyController {
	Logger logger = Logger.getLogger(PharmacyController.class.getName());
	
	 // PharmacyMapper 객체에 대한 주입
	@Autowired
	private PharmacyMapper mapper;
	
	// PharmacyInfoService 객체에 대한 주입
	@Autowired
	private PharmacyInfoService service;
	
	// DispenseService 객체에 대한 주입
	@Autowired
	private DispenseService dispenseService;
	
	// DispenseDAO 객체에 대한 주입
	@Autowired
	private DispenseDAO dispenseDAO;
	
	// DispenseRepository 객체에 대한 주입 (엘라스틱서치)
	@Autowired
	private DispenseRepository repo;	//엘라스틱서치
	
	// DispenseService 객체를 매개변수로 받는 생성자
	public PharmacyController(DispenseService dispenseService) {
        this.dispenseService = dispenseService;
    }
	
	
	/**
     * 약국 정보 페이지를 보여주는 메소드입니다.
     *
     * @param model Model 객체
     * @param id 약국 ID
     * @return pharmacy.info 페이지의 뷰 이름
     */
	  @GetMapping("/info.do")
	 //public String info(Model model, @RequestParam("id") String id) {
		public String info(Model model, @PathVariable("id") String id) {
		  
	        PharmacyInfoDTO pharmacyInfo = service.getPharmacyInfo(id);
	        
	        String[] ssnArr = pharmacyInfo.getPharmacySSN().split("-");
			
			pharmacyInfo.setPharmacySSNs(ssnArr[0]);
			pharmacyInfo.setPharmacySSNm(ssnArr[1]);
			pharmacyInfo.setPharmacySSNe(ssnArr[2]);
			
			
			String[] telArr = pharmacyInfo.getPharmacyTel().split("-");
			
			pharmacyInfo.setPharmacyTels(telArr[0]);
			pharmacyInfo.setPharmacyTelm(telArr[1]);
			pharmacyInfo.setPharmacyTele(telArr[2]);

			
			model.addAttribute("pharmacyInfo", pharmacyInfo);
			model.addAttribute("maskingSSN", ssnArr[2].charAt(0) + "******");
	        
	        return "pharmacy.info";
	    }
	
	
	/**
     * 약국 오픈 정보를 가져와서 모델에 추가한 후, pharmacy.opening 페이지를 반환합니다.
     *
     * @param model 모델 객체
     * @param id 약국 ID
     * @return pharmacy.opening 페이지
     */
	@GetMapping(value = "/opening.do")
	//public String opening(Model model, @RequestParam("id") String id) {
		public String opening(Model model, @PathVariable("id") String id) {	 
		
        PharmacyInfoDTO pharmacyOpeningInfo = service.getPharmacyOpeningInfo(id);
        model.addAttribute("pharmacyOpeningInfo", pharmacyOpeningInfo);
		return "pharmacy.opening";
	}
	
	/**
     * 전체 조제 목록을 가져오거나, 검색어를 통해 엘라스틱서치에서 데이터를 조회합니다.
     * 목록을 가져온 후, 모델에 데이터를 추가하고, pharmacy.dispenselist 페이지를 반환합니다.
     *
     * @param model 모델 객체
     * @param id 약국 ID
     * @param word 검색어
     * @param page 페이지 정보
     * @return pharmacy.dispenselist 페이지
     */
	//전제 조제 목록
	@GetMapping(value = "/dispenselist.do")
		public String dispenselist(Model model, @PathVariable("id") String id, String word
				,@ModelAttribute("page") String page) {	
		logger.info("id:"+id);
		StringBuilder sb = new StringBuilder();
		// 제조 상태 건수 가져오기
		DispenseCntDTO cntDTO = dispenseService.getCountByStatus(id);
		model.addAttribute("cntDTO", cntDTO);
		int nowPage = 0;    // 현재 페이지 번호
        int begin = 0;      // 페이지 시작 위치
        int end = 0;        // 페이지 끝 위치
		int pageSize = 10;
	  
	    if (page == null || page.equals("")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(page);
        }
	    begin = ((nowPage - 1) * pageSize) + 1;
        end = begin + pageSize - 1;
        
		if(word == null || word.equals("")) { 
		
		//검색(X) > 목록보기 > 오라클 조회
		List<DispenseDTO> dispenseList = dispenseService.getDispenseList(id,begin,end);
		
		int totalPage = 0;
		
		totalPage = (int) Math.ceil((double) Integer.parseInt(cntDTO.getTotalCnt()) / pageSize);
        
        int n = 0;
        int loop = 0;
        loop = 1;  // 루프변수 
        n=((nowPage -1)/pageSize) * pageSize + 1;
        String url = "/apa/pharmacy/"+id+"/dispenselist.do";
        //이전페이지
        if(n == 1) {
            sb.append(String.format(("<a href='#!'><<<</a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'><<<</a>"), n-1, pageSize));
        }
        
        while(!(loop > pageSize || n > totalPage)) {
            
            if (n == nowPage) {
                sb.append(String.format(" <a href='#!' style='color:gray;'>%d</a> ", n));
            } else {
                sb.append(String.format(" <a href='"+url+"?page=%d'>%d</a> ", n, n));
            }
            
            loop++;
            n++;
        }
        
        //다음페이지
        if(n > totalPage) {
            sb.append(String.format(("<a href='#!'>>>></a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'>>>></a>"), n, pageSize));
        }
		
	    // JSP에 데이터 전달을 위해 모델에 dispenselist 추가
	    model.addAttribute("dispenseList", dispenseList);	
	    model.addAttribute("pagebar", sb.toString());
		} else {
	    
			//검색(O)  > 검색하기 > 엘라스틱서치 조회
			List<Map<String,Object>> list =  repo.search(word);
			model.addAttribute("dispenseList", list);
			model.addAttribute("word", word);
			
		}	
	    
		return "pharmacy.dispenselist";
	}
	
	
	/**
	 * 대기 중인 조제 상태의 목록을 가져와서 페이지네이션된 데이터를 반환합니다.
	 *
	 * @param model 모델 객체
	 * @param id 약국 ID
	 * @param page 페이지 정보
	 * @return pharmacy.dispensewaiting 페이지
	 */
	
	@GetMapping(value = "/dispensewaiting.do")
	//public String dispensewaiting(Model model, @RequestParam("id") String id){
		public String dispensewaiting(Model model, @PathVariable("id") String id, @ModelAttribute("page") String page) {
		
		StringBuilder sb = new StringBuilder();
		
		// 제조 상태 건수 가져오기
		DispenseCntDTO cntDTO = dispenseService.getCountByStatus(id);
		model.addAttribute("cntDTO", cntDTO);
		int nowPage = 0;    // 현재 페이지 번호
        int begin = 0;      // 페이지 시작 위치
        int end = 0;        // 페이지 끝 위치
		int pageSize = 10;
	  
	    if (page == null || page.equals("")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(page);
        }
	    begin = ((nowPage - 1) * pageSize) + 1;
        end = begin + pageSize - 1;
        
		List<DispenseDTO> dispenseWaiting = dispenseService.getDispenseWaiting(id,begin,end);
		int totalPage = 0;
		
		totalPage = (int) Math.ceil((double)(cntDTO.getWaitingCnt()) / pageSize);
        
        int n = 0;
        int loop = 0;
        loop = 1;  // 루프변수 
        n=((nowPage -1)/pageSize) * pageSize + 1;
        String url = "/apa/pharmacy/"+id+"/dispensewaiting.do";
        //이전페이지
        if(n == 1) {
            sb.append(String.format(("<a href='#!'><<<</a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'><<<</a>"), n-1, pageSize));
        }
        
        while(!(loop > pageSize || n > totalPage)) {
            
            if (n == nowPage) {
                sb.append(String.format(" <a href='#!' style='color:gray;'>%d</a> ", n));
            } else {
                sb.append(String.format(" <a href='"+url+"?page=%d'>%d</a> ", n, n));
            }
            
            loop++;
            n++;
        }
        
        //다음페이지
        if(n > totalPage) {
            sb.append(String.format(("<a href='#!'>>>></a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'>>>></a>"), n, pageSize));
        }
		
		
	    // JSP에 데이터 전달을 위해 모델에 dispensewaiting 추가
	    model.addAttribute("dispenseWaiting", dispenseWaiting);	
	    model.addAttribute("pagebar", sb.toString());
		return "pharmacy.dispensewaiting";
	}
	
	/**
	 * 진행 중인 조제 상태의 목록을 가져와서 페이지네이션된 데이터를 반환합니다.
	 *
	 * @param model 모델 객체
	 * @param id 약국 ID
	 * @param page 페이지 정보
	 * @return pharmacy.dispensing 페이지
	 */
	@GetMapping(value = "/dispensing.do")
	//public String dispensing(Model model, @RequestParam("id") String id){
		public String dispensing(Model model, @PathVariable("id") String id, @ModelAttribute("page") String page) {
			
		StringBuilder sb = new StringBuilder();
			
		DispenseCntDTO cntDTO = dispenseService.getCountByStatus(id);
		model.addAttribute("cntDTO", cntDTO);
		
		int nowPage = 0;    // 현재 페이지 번호
        int begin = 0;      // 페이지 시작 위치
        int end = 0;        // 페이지 끝 위치
		int pageSize = 10;
	  
	    if (page == null || page.equals("")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(page);
        }
	    begin = ((nowPage - 1) * pageSize) + 1;
        end = begin + pageSize - 1;
		
		List<DispenseDTO> dispensing = dispenseService.getDispensing(id,begin,end);
		int totalPage = 0;
		
		totalPage = (int) Math.ceil((double)(cntDTO.getDispensingCnt()) / pageSize);
        
        int n = 0;
        int loop = 0;
        loop = 1;  // 루프변수 
        n=((nowPage -1)/pageSize) * pageSize + 1;
        String url = "/apa/pharmacy/"+id+"/dispensing.do";
        //이전페이지
        if(n == 1) {
            sb.append(String.format(("<a href='#!'><<<</a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'><<<</a>"), n-1, pageSize));
        }
        
        while(!(loop > pageSize || n > totalPage)) {
            
            if (n == nowPage) {
                sb.append(String.format(" <a href='#!' style='color:gray;'>%d</a> ", n));
            } else {
                sb.append(String.format(" <a href='"+url+"?page=%d'>%d</a> ", n, n));
            }
            
            loop++;
            n++;
        }
        
        //다음페이지
        if(n > totalPage) {
            sb.append(String.format(("<a href='#!'>>>></a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'>>>></a>"), n, pageSize));
        }
		
	    // JSP에 데이터 전달을 위해 모델에 dispensing 추가
	    model.addAttribute("dispensing", dispensing);
	    model.addAttribute("pagebar", sb.toString());
		return "pharmacy.dispensing";
	}
	
	
	/**
	 * 완료된 조제 상태의 목록을 가져와서 페이지네이션된 데이터를 반환합니다.
	 *
	 * @param model 모델 객체
	 * @param id 약국 ID
	 * @param page 페이지 정보
	 * @return pharmacy.dispensecomplete 페이지
	 */
	@GetMapping(value = "/dispensecomplete.do")
	//public String dispensecomplete(Model model, @RequestParam("id") String id){
		public String dispensecomplete(Model model, @PathVariable("id") String id, @ModelAttribute("page") String page) {
			
			StringBuilder sb = new StringBuilder();
		
			DispenseCntDTO cntDTO = dispenseService.getCountByStatus(id);
			model.addAttribute("cntDTO", cntDTO);
			
			int nowPage = 0;    // 현재 페이지 번호
	        int begin = 0;      // 페이지 시작 위치
	        int end = 0;        // 페이지 끝 위치
			int pageSize = 10;
		  
		    if (page == null || page.equals("")) {
	            nowPage = 1;
	        } else {
	            nowPage = Integer.parseInt(page);
	        }
		    begin = ((nowPage - 1) * pageSize) + 1;
	        end = begin + pageSize - 1;
	        
			
			
		List<DispenseDTO> dispenseComplete = dispenseService.getDispenseComplete(id,begin,end);
		int totalPage = 0;
		
		totalPage = (int) Math.ceil((double)(cntDTO.getDispenseFinCnt()) / pageSize);
        
        int n = 0;
        int loop = 0;
        loop = 1;  // 루프변수 
        n=((nowPage -1)/pageSize) * pageSize + 1;
        String url = "/apa/pharmacy/"+id+"/dispensecomplete.do";
        //이전페이지
        if(n == 1) {
            sb.append(String.format(("<a href='#!'><<<</a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'><<<</a>"), n-1, pageSize));
        }
        
        while(!(loop > pageSize || n > totalPage)) {
            
            if (n == nowPage) {
                sb.append(String.format(" <a href='#!' style='color:gray;'>%d</a> ", n));
            } else {
                sb.append(String.format(" <a href='"+url+"?page=%d'>%d</a> ", n, n));
            }
            
            loop++;
            n++;
        }
        
        //다음페이지
        if(n > totalPage) {
            sb.append(String.format(("<a href='#!'>>>></a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'>>>></a>"), n, pageSize));
        }
	    // JSP에 데이터 전달을 위해 모델에 dispenseComplete 추가
	    model.addAttribute("dispenseComplete", dispenseComplete);	
	    model.addAttribute("pagebar", sb.toString());
		return "pharmacy.dispensecomplete";
	}
	
	/**
	 * 픽업 완료된 조제 상태의 목록을 가져와서 페이지네이션된 데이터를 반환합니다.
	 *
	 * @param model 모델 객체
	 * @param id 약국 ID
	 * @param page 페이지 정보
	 * @return pharmacy.dispensepickup 페이지
	 */
	@GetMapping(value = "/dispensepickup.do")
	public String dispensepickup(Model model, @PathVariable("id") String id, @ModelAttribute("page") String page) {
		
		StringBuilder sb = new StringBuilder();
		
		DispenseCntDTO cntDTO = dispenseService.getCountByStatus(id);
		model.addAttribute("cntDTO", cntDTO);
		
		int nowPage = 0;    // 현재 페이지 번호
        int begin = 0;      // 페이지 시작 위치
        int end = 0;        // 페이지 끝 위치
		int pageSize = 10;
	  
	    if (page == null || page.equals("")) {
            nowPage = 1;
        } else {
            nowPage = Integer.parseInt(page);
        }
	    begin = ((nowPage - 1) * pageSize) + 1;
        end = begin + pageSize - 1;
        
		
		List<DispenseDTO> dispensePickUp = dispenseService.getDispensePickUp(id,begin,end);
		int totalPage = 0;
		
		totalPage = (int) Math.ceil((double)(cntDTO.getPickUpFinCnt()) / pageSize);
        
        int n = 0;
        int loop = 0;
        loop = 1;  // 루프변수 
        n=((nowPage -1)/pageSize) * pageSize + 1;
        String url = "/apa/pharmacy/"+id+"/dispensepickup.do";
        //이전페이지
        if(n == 1) {
            sb.append(String.format(("<a href='#!'><<<</a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'><<<</a>"), n-1, pageSize));
        }
        
        while(!(loop > pageSize || n > totalPage)) {
            
            if (n == nowPage) {
                sb.append(String.format(" <a href='#!' style='color:gray;'>%d</a> ", n));
            } else {
                sb.append(String.format(" <a href='"+url+"?page=%d'>%d</a> ", n, n));
            }
            
            loop++;
            n++;
        }
        
        //다음페이지
        if(n > totalPage) {
            sb.append(String.format(("<a href='#!'>>>></a>"), pageSize));
        } else {
            sb.append(String.format(("<a href='"+url+"?page=%d'>>>></a>"), n, pageSize));
        }
	    // JSP에 데이터 전달을 위해 모델에 dispensePickUp 추가
	    model.addAttribute("dispensePickUp", dispensePickUp);
	    model.addAttribute("pagebar", sb.toString());
		
		return "pharmacy.dispensepickup";
	}
	
	
}
