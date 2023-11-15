package com.kh.korea.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}
	
	@RequestMapping(value="memberPosting", method = {RequestMethod.GET})
	public String memberPosting() {
		return "admin/memberPosting";
	}
	
	@PostMapping("memberReply")
	public String memberReply() {
		return "admin/memberReply";
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete() {
		return "admin/memberDelete";
	}
	
	@RequestMapping("memberQuiz")
	public String memberQuiz() {
		return "admin/memberQuiz";
	}
	

}
