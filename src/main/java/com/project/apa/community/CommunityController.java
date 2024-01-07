package com.project.apa.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.apa.api.community.domain.CommunityCommentDTO;
import com.project.apa.api.community.domain.CommunityDTO;
import com.project.apa.api.community.service.CommunityService;
/**
 * 커뮤니티 관련 기능을 처리하는 컨트롤러 클래스
 */
@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityservice;
    /**
     * 커뮤니티 리스트 페이지 요청 처리
     * @param page 페이지 번호
     * @param model Spring MVC 모델
     * @return 리스트 페이지 뷰 이름
     */	
	@GetMapping(value = "/community/list.do")
	public String list(String page, Model model) {
		
		int nowPage = 0; // 현재 페이지 번호
		int totalCount = 0; // 총 게시물 수
		int pageSize = 30; // 한 페이지에서 출력할 게시물 수
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
		
		List<CommunityDTO> list = communityservice.getCommunityList(map);
		
		
		model.addAttribute("list", list);
		
		StringBuilder sb = new StringBuilder();

		totalCount = communityservice.getTotalCount();
		//System.out.println(totalCount);
		totalPage = (int) Math.ceil((double) totalCount / pageSize);
		 //System.out.println(totalPage);
		loop = 1; // 루프 변수(10바퀴)
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		if (n == 1) {
			sb.append(String.format("<a href='#'!> 이전 | </a>"));
		} else {
			sb.append(String.format("<a href='/apa/community/list.do?page=%d'> 이전 | </a>", n - 1));
		}

		while (!(loop > blockSize || n > totalPage)) {

			if (n == nowPage) {
				sb.append(String.format(" <a href='#!' style='color:tomato;'>%d</a> ", n));
			} else {
				sb.append(String.format(" <a href='/apa/community/list.do?page=%d'>%d</a> ", n, n));
			}

			loop++;
			n++;

			if (n > totalPage) {
				break;
			}
		}

		// 다음 10페이지
		System.out.println(pageSize);
		sb.append(String.format("<a href='/apa/community/list.do?page=%d'> | 다음</a>", n));

		
		model.addAttribute("pagebar", sb);
		model.addAttribute("userseq", '1');
	
		
		return "community.list";
	}
	
    /**
     * 커뮤니티 상세 페이지 요청 처리
     * @param model Spring MVC 모델
     * @param seq 커뮤니티 글 번호
     * @return 상세 페이지 뷰 이름
     */	
	//상세페이지
	//댓글불러오기
	@GetMapping(value = "/community/view.do")
	public String view(Model model, String seq) {
		
		CommunityDTO dto = communityservice.getCommunityInfo(seq);
		
		List<CommunityCommentDTO> listComment = communityservice.getCommentList(seq);
		
		//System.out.println(listComment.toString());
		model.addAttribute("listComment", listComment);
		model.addAttribute("dto", dto);
		model.addAttribute("userseq", '1');
		model.addAttribute("seq", listComment);
		model.addAttribute("communitycommentseq", listComment);
		return "community.view";
	}
    /**
     * AJAX를 통해 댓글 리스트 가져오기
     * @param seq 커뮤니티 글 번호
     * @return 댓글 리스트
     */
	@GetMapping(value = "/community/getCommentList")
	@ResponseBody
	public List<CommunityCommentDTO> getCommentList(String seq) {
		
	    return communityservice.getCommentList(seq);
	}
    /**
     * 댓글 추가 처리
     * @param dto 댓글 정보
     * @return 처리 결과 코드
     */	
	@PostMapping(value = "/community/commentadd")
	@ResponseBody
	public int commentadd(@RequestBody CommunityCommentDTO dto) {
		
		
		System.out.println(dto.toString());
		
		return communityservice.commentadd(dto);
	}
    /**
     * 댓글 삭제 처리
     * @param dto 댓글 정보
     * @param communitycommentseq 댓글 번호
     * @return 처리 결과 코드
     */
	@PostMapping(value="/community/commentdel")
	@ResponseBody
	public int commentdel(@RequestBody CommunityCommentDTO dto, String communitycommentseq) {
		
		
		System.out.println(dto.getCommunitycommentseq());
		
		return communityservice.commentdel(dto);
	}
    /**
     * 커뮤니티 추가 페이지 요청 처리
     * @param model Spring MVC 모델
     * @return 추가 페이지 뷰 이름
     */
	@GetMapping(value = "/community/add.do")
	public String add(Model model) {
		
		
		return "community.add";
	}
    /**
     * 커뮤니티 추가 처리
     * @param dto 커뮤니티 정보
     * @return 처리 결과 코드
     */
	@PostMapping(value = "/community/add")
	@ResponseBody
	public int add(@RequestBody CommunityDTO dto) {

		return communityservice.add(dto);
	}
	
	
	
	
	
}
