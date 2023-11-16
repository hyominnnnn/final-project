package com.kh.korea.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberForwardController {

	//맴버 관련
	//회원가입 버튼 클릭시 회원가입 페이지로 이동
	@GetMapping("logonForm")
	public String logon(){
		return "member/logon";
	}
	//회원가입 페이지에서 한국인 가입 페이지로 이동
	@GetMapping("LogonForm")
	public String koreanLogon() {
		return "member/LogonForm";
	}
	//회원가입 페이지에서 외국인 가입 페이지로 이동
	@GetMapping("foreignerLogonForm")
	public String foreignerLogon() {
		return "member/foreignerLogon";
	}
	//로그인 버튼 클릭시 로그인 페이지로 이동
	@GetMapping("loginForm")
	public String login() {
		return "member/login";
	}

	

	
}
