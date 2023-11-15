package com.kh.korea.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}
	
	@PostMapping("memberPosting")
	public String memberPosting() {
		return "admin/memberPosting";
	}
	
	@PostMapping("memberReply")
	public String memberReply() {
		return "admin/memberReply";
	}
	
	

}
