package com.kh.korea.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
		
	@RequestMapping("list.fbo") 
	public String selectList() {
		return "board/freeBoardListView";
	}
	
	@RequestMapping("enrollForm.fbo")
	public String enrollForm() {
		return "board/freeBoardEnrollForm";
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
