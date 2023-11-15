package com.kh.korea.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	// 자유게시판 리스트
	@GetMapping("list.fbo") 
	public String freeSelectList() {
		return "board/freeBoardListView";
	}
	
	// 자유게시판 글작성
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
	
	@GetMapping("detail.ibo")
	public String infoDetailView() {
		return "board/infoBoardDetailView";
	}
	
	@GetMapping("enrollForm.ibo")
	public String infoEnrollForm() {
		return "board/infoBoardEnrollForm";
	}
	
	

}
