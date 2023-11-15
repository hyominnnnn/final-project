package com.kh.korea.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberForwardController {

	//맴버 관련
	@GetMapping("logonForm")
	public String logon(){
		return "member/logon";
	}
	
	@GetMapping("koreanLogonForm")
	public String koreanLogon() {
		return "member/koreanLogon";
	}
	
	@GetMapping("foreignerLogonForm")
	public String foreignerLogon() {
		return "member/foreignerLogon";
	}
	
	@GetMapping("loginForm")
	public String login() {
		return "member/login";
	}

	

	
}
