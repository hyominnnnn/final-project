package com.kh.korea.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}
	
	@RequestMapping("memberPosting")
	public String memberPosting(HttpServletRequest request) {
		return "admin/memberPosting";
	}
	
	@RequestMapping("memberReply")
	public String memberReply() {
		return "admin/memberReply";
	}
	
	

}
