package com.kh.korea.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.korea.board.model.service.BoardService;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 자유게시판 리스트
	@GetMapping("list.fbo") 
	public String freeSelectList() {
		
		return "board/freeBoardListView";
	}
	
	// 자유게시판 작성폼
	@GetMapping("enrollForm.fbo")
	public String freeEnrollForm() {
		return "board/freeBoardEnrollForm";
	}
	
	// 자유게시판 글상세
	@GetMapping("detail.fbo")
	public String freeDetailView() {
		return "board/freeBoardDetailView";
	}
	
	// 자유게시판 글수정
	@GetMapping("update.fbo")
	public String freeUpdateForm() {
		return "board/freeBoardUpdateForm";
	}
	
	// 정보게시판 리스트
	@GetMapping("list.ibo")
	public String infoList(@RequestParam(value="iPage", defaultValue="1") int currentPage, Model model) {
		
		PageInfo infoPi = Pagination.getPageInfo(boardService.countInfoList(), currentPage, 5, 5);
		
		model.addAttribute("infoList", boardService.selectInfoList(infoPi));
		model.addAttribute("infoPi", infoPi);
		
		return "board/infoBoardListView";
	}
	
	// 정보게시판 글 상세
	@GetMapping("detail.ibo")
	public String infoDetailView() {
		return "board/infoBoardDetailView";
	}
	
	// 정보게시판 글 작성
	@GetMapping("enrollForm.ibo")
	public String infoEnrollForm() {
		return "board/infoBoardEnrollForm";
	}
	
	// 자유 게시판 댓글 리스트 
	
	// 자유 게시판 댓글 작성
	
	// 자유 게시판 댓글 리스트 
	
	// 자유 게시판 댓글 작성
	
	
	
	
	
}
