package com.kh.korea;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForwardController {
	
	@GetMapping("main")
	public String main() {
		return "main";
	}

	@GetMapping("header")
	public String header() {
		return "common/header";
	}
	
	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}

	@GetMapping("info")
	public String infoList() {
		return "board/infoBoardListView";
	}
	
	

}
