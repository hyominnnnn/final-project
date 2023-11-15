package com.kh.korea.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberForwardController {

	//맴버 관련
	@GetMapping("logon")
	public String logon(){
		return "member/logon";
	}
	
	@GetMapping("koreanLogon")
	public String koreanLogon() {
		return "member/koreanLogon";
	}
	
	@GetMapping("foreignerLogon")
	public String foreignerLogon() {
		return "member/foreignerLogon";
	}
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}

	

	
}
