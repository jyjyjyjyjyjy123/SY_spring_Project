package com.project.apa.api.pharmacy.controller;

import com.project.apa.api.pharmacy.domain.DispenseDTO;
import com.project.apa.api.pharmacy.domain.PharmacyInfoDTO;
import com.project.apa.api.pharmacy.service.DispenseService;
import com.project.apa.api.pharmacy.service.PharmacyInfoService;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;


/**
 * 약국 작업을 처리하는 REST 컨트롤러입니다.
 * 약국 정보 가져오기, 제조 목록, 제조 진행 처리 등의 약국 기능이 포함되어 있습니다.
 * @author 김민정
 */
@RestController
@RequestMapping("/api/pharmacy/{id}")
public class RestPharmacyController {
	
	// RestPharmacyController에 대한 Logger
	private static final Logger logger = Logger.getLogger(RestPharmacyController.class.getName());
	
	 // 약국 정보 서비스에 대한 Autowired
	@Autowired
	private PharmacyInfoService pharmacyInfoService;
    
	// 제조 진행 처리를 위한 서비스에 대한 Autowired
	@Autowired
    private DispenseService dispenseService;
	
	/**
     * ID를 기반으로 약국 정보를 가져옵니다.
     *
     * @param id 약국 ID
     * @return 약국 정보를 담은 PharmacyInfoDTO
     */
	
    //약국정보 가져오기
	 @GetMapping("/info")
	  public @ResponseBody PharmacyInfoDTO getPharmacyInfo(@PathVariable String id) {
	        return pharmacyInfoService.getPharmacyInfo(id);
	 }
	  

	    /**
	     * ID를 기반으로 약국 운영 정보를 가져옵니다.
	     *
	     * @param id 약국 ID
	     * @return 약국 운영 정보를 담은 PharmacyInfoDTO
	     */
	 
	  //약국운영정보 가져오기
	 @GetMapping("/opening")
	  public @ResponseBody PharmacyInfoDTO getPharmacyOpeningInfo(@PathVariable String id) {
		  return pharmacyInfoService.getPharmacyOpeningInfo(id);
	 }
	  
	 /**
	  * 약국의 제조 목록을 가져옵니다.
	  *
	  * @param id   약국 ID
	  * @param page 페이지 번호
	  * @return 제조 목록을 담은 DispenseDTO 리스트
	  */ 
    //전체제조목록 가져오기
    @GetMapping("/dispenselist")
    public List<DispenseDTO> getDispenseList(@PathVariable String id,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int pageSize = 10;
		int begin = (page - 1) * pageSize + 1;
		int end = begin + pageSize - 1;
		
		return dispenseService.getDispenseList(id, begin, end);
    }
    

    /**
     * 약국의 제조 대기 목록을 가져옵니다.
     *
     * @param id   약국 ID
     * @param page 페이지 번호
     * @return 제조 대기 목록을 담은 DispenseDTO 리스트
     */
  //제조대기목록 가져오기
    @GetMapping("/dispensewaiting")
    public List<DispenseDTO> getDispenseWaiting(@PathVariable String id,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int pageSize = 10;
		int begin = (page - 1) * pageSize + 1;
		int end = begin + pageSize - 1;
		
		return dispenseService.getDispenseWaiting(id, begin, end);
    }
    
    
    /**
     * 제조 대기 중인 항목에 대한 승인 또는 거부를 처리합니다.
     *
     * @param id   약국 ID
     * @param data 요청 데이터 (액션 및 제조 ID 목록 포함)
     * @return 처리 결과에 대한 ResponseEntity
     */  
  //제조 대기 승인/거부    
    @PutMapping("/dispensewaiting")
    public ResponseEntity<String> dispenseAction(
            @PathVariable String id
            ,@RequestBody Map<String, String> data
            ) {
    	//logger.info("--------------------dispensewaiting START----------------------");
    	//logger.info("input:" + data);
    	String action = data.get("action");
    	List<Integer> dispenseIds = new ArrayList<Integer>();
    	
    	for(String dispense: data.get("dispenseIds").split(",")) {
    		dispenseIds.add(Integer.parseInt(dispense));
    	}
    	
        boolean success =true;
        String message;

       
        //logger.info("dispenseIds:" + dispenseIds);
        if (action.equals("approve")) {
            success = dispenseService.approveDispense(dispenseIds);
            message = "성공적으로 승인되었습니다.";
        } else if (action.equals("reject")) {
            success = dispenseService.rejectDispense(dispenseIds);
            message = "성공적으로 거절되었습니다.";
        } else {
            return ResponseEntity.badRequest().body("Action Type Error");
        }
        //logger.info("success:" + success);
        //logger.info("--------------------dispensewaiting END----------------------");
        if (success) {
            return ResponseEntity.ok("선택한 처방내역이 성공적으로 " + message + "되었습니다.");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
            		.body("dispensewaiting error");
        }
       
    }
    
    /**
     * 약국의 제조 중 목록을 가져옵니다.
     *
     * @param id   약국 ID
     * @param page 페이지 번호
     * @return 제조 중 목록을 담은 DispenseDTO 리스트
     */ 
    
  //제조중목록 가져오기
    @GetMapping("/dispensing")
    public List<DispenseDTO> getDispensing(@PathVariable String id,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int pageSize = 10;
		int begin = (page - 1) * pageSize + 1;
		int end = begin + pageSize - 1;
		
		return dispenseService.getDispensing(id, begin, end);
    }
    
    /**
     * 제조 중인 항목을 처리하여 제조를 완료합니다.
     *
     * @param id   약국 ID
     * @param data 요청 데이터
     * @return 처리 결과에 대한 ResponseEntity
     */ 
    
  //제조중 > 제조완료 처리하기  
   @PutMapping("/dispensing") 
   public ResponseEntity<String> dispensingAction(
           @PathVariable String id
           ,@RequestBody Map<String, String> data
           ) {
   	//logger.info("--------------------dispensing START----------------------");
   	//logger.info("input:" + data);
   	String action = data.get("action");
   	List<Integer> dispenseIds = new ArrayList<Integer>();
   	
   	for(String dispense: data.get("dispenseIds").split(",")) {
   		dispenseIds.add(Integer.parseInt(dispense));
   	}
   	
       boolean success =true;
       String message;

      
       //logger.info("dispenseIds:" + dispenseIds);
       if (action.equals("finish")) {
           success = dispenseService.finishDispense(dispenseIds);
           message = "성공적으로 처리되었습니다.";       
       } else {
           return ResponseEntity.badRequest().body("Action Type Error");
       }
       //logger.info("success:" + success);
       //logger.info("--------------------dispensing END----------------------");
       if (success) {
           return ResponseEntity.ok("선택한 처방내역이 성공적으로 " + message + "되었습니다.");
       } else {
           return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
           		.body("dispensing error");
       }
      
   } 
    
   /**
    * 약국의 제조 완료 목록을 가져옵니다.
    *
    * @param id   약국 ID
    * @param page 페이지 번호
    * @return 제조 완료 목록을 담은 DispenseDTO 리스트
    */

    
  //제조완료목록 가져오기
    @GetMapping("/dispensecomplete")
    public List<DispenseDTO> getDispenseComplete(@PathVariable String id,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int pageSize = 10;
		int begin = (page - 1) * pageSize + 1;
		int end = begin + pageSize - 1;
		
		return dispenseService.getDispenseComplete(id, begin, end);
    }
    
    
    /**
     * 제조가 완료된 항목을 수령 완료 처리합니다.
     *
     * @param id   약국 ID
     * @param data 요청 데이터
     * @return 처리 결과에 대한 ResponseEntity
     */ 
  //제조완료 >  수령완료 처리하기    
  @PutMapping("/dispensecomplete")
  public ResponseEntity<String> dispenseFinishAction(
          @PathVariable String id
          ,@RequestBody Map<String, String> data
          ) {
  	//logger.info("--------------------dispensing START----------------------");
  	//logger.info("input:" + data);
  	String action = data.get("action");
  	List<Integer> dispenseIds = new ArrayList<Integer>();
  	
  	for(String dispense: data.get("dispenseIds").split(",")) {
  		dispenseIds.add(Integer.parseInt(dispense));
  	}
  	
      boolean success =true;
      String message;

     
      //logger.info("dispenseIds:" + dispenseIds);
      if (action.equals("pickUpfinish")) {
          success = dispenseService.pickUpFinishDispense(dispenseIds);
          message = "성공적으로 처리되었습니다.";       
      } else {
          return ResponseEntity.badRequest().body("Action Type Error");
      }
      //logger.info("success:" + success);
      //logger.info("--------------------dispensing END----------------------");
      if (success) {
          return ResponseEntity.ok("선택한 처방내역이 성공적으로 " + message + "되었습니다.");
      } else {
          return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
          		.body("dispensing error");
      }
     
  }  
   
  /**
   * 약국의 수령 완료 목록을 가져옵니다.
   *
   * @param id   약국 ID
   * @param page 페이지 번호
   * @return 수령 완료 목록을 담은 DispenseDTO 리스트
   */
    
  //수령완료 목록 가져오기
    @GetMapping("/dispensepickup")
    public List<DispenseDTO> getDispensePickUp(@PathVariable String id,
            @RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		int pageSize = 10;
		int begin = (page - 1) * pageSize + 1;
		int end = begin + pageSize - 1;
		
		return dispenseService.getDispensePickUp(id, begin, end);
    }
    
}
