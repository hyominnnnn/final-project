package com.kh.korea.borad;

import org.springframework.stereotype.Controller;
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
	
	

}
