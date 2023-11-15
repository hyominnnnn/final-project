package com.kh.korea.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.korea.member.model.service.MemberService;
import com.kh.korea.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService ms;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;
	
	@Autowired
	private JavaMailSender sender;
	
	//@RequestMapping("logon")
	
	
	@RequestMapping("login")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		//Member loginUser = ms.loginMember(m);
		
		return mv;
	}
}
