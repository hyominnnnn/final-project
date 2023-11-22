package com.kh.korea.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.korea.member.model.service.GoogleService;
import com.kh.korea.member.model.service.MemberService;
import com.kh.korea.member.model.vo.Member;


@Controller
public class GoogleController {
	
	@Autowired
	private GoogleService googleService;
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("gcode")
	public String getCode(String code, Model model, HttpSession session) throws IOException, ParseException {
		//System.out.println(code);
		String accessToken = googleService.getToken(code);
		HashMap<String, String> map = googleService.getUserInfo(accessToken);
		
		String id = map.get("id");
		String email = map.get("email");
		
		if(memberService.socialCheck(id) > 0) {
			//로그인 진행
			Member loginUser = memberService.socialLogin(id);
			if(loginUser != null) {
				 session.setAttribute("loginUser",loginUser);
				 return "redirect:/";
			}else {
				model.addAttribute("eorrorMsg","로그인 실패");
				return "common/errorPage";
			}
		}else {
			//회원가입 진행
			model.addAttribute("socialId",id);
			model.addAttribute("email",email);
			model.addAttribute("social","google");
			return "member/socialLogon";
		}
		
	}
}
