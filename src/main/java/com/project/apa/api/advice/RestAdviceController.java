package com.project.apa.api.advice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.apa.api.advice.domain.AdviceDTO;
import com.project.apa.api.advice.domain.StorageDTO;
import com.project.apa.api.advice.service.AdviceService;


@RestController
public class RestAdviceController {
	
	@Autowired
	private AdviceService adviceservice;


    /**
     * 저장 API
     * @param dto StorageDTO 객체를 통해 저장할 데이터를 전달
     * @return 저장 결과 코드
     */	
	
	  @PostMapping(value = "/advice/storage") 
	  public int storage (@RequestBody StorageDTO dto) {
	  
	  return adviceservice.storage(dto); 
	  }
	    /**
	     * 의학상담 목록 검색 API
	     * @param dto AdviceDTO 객체를 통해 검색 조건을 전달
	     * @param page 현재 페이지 번호
	     * @return 검색 결과 목록
	     */
	  @PostMapping(value = "/advice/findlist")
	 public List<AdviceDTO> findlist(@RequestBody AdviceDTO dto, String page) {
		  	int nowPage = 0; // 현재 페이지 번호
			int totalCount = 0; // 총 게시물 수
			int pageSize = 10; // 한 페이지에서 출력할 게시물 수
			int totalPage = 0; // 총 페이지 수
			int begin = 0; // 페이징 시작 위치
			int end = 0; // 페이징 끝 위치
			int n = 0;
			int loop = 0;
			int blockSize = 10;

			if (page == null || page.equals("")) {
				nowPage = 1;
			} else {
				nowPage = Integer.parseInt(page);
			}
			HashMap<String, Integer> map = new HashMap<String, Integer>();

			begin = ((nowPage - 1) * pageSize) + 1;
			end = begin + pageSize - 1;

			map.put("begin", begin);
			map.put("end", end);
			
			// 의학 목록 및 검색 결과 목록 가져오기
			List<AdviceDTO> list = adviceservice.getAdviceList(map);
			List<AdviceDTO> findlist = adviceservice.findlist(dto);
			
			// 검색 결과에 대한 처리
			for (AdviceDTO finddto : findlist) {
				if (finddto.getIscounselanswer().equals("y") || finddto.getIscounselanswer().equals("Y")) {
					finddto.setIscounselanswer("답변완료");
				} else {
					finddto.setIscounselanswer("대기중");
				}
			}
			
			
		return findlist;
	}
	  
}
