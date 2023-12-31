package com.kh.korea.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.korea.member.model.service.KakaoService;
import com.kh.korea.member.model.service.MemberService;
import com.kh.korea.member.model.vo.Member;

@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("code")
	public String getCode(String code, Model model, HttpSession session) throws IOException, ParseException {
		//인가코드 받아오기
		//System.out.println(code);
		// 코드받아온거에서 accessToken 뺴오기
		String accessToken = kakaoService.getToken(code);
		//accessToken으로 유저정보 가져오기
		HashMap<String, String>  map = kakaoService.getUserInfo(accessToken);
		String id = map.get("id");
		String profile = map.get("profile");
		
		//System.out.println("map id 는" + map.get("id") );
		//System.out.println("map profile은 " + map.get("profile"));
		//가져온 정보로 회원가입 여부 및 로그인 진행
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
			model.addAttribute("socialProfile",profile);
			model.addAttribute("social","kakao");
			return "member/socialLogon";
		}
			
	}
	
}
