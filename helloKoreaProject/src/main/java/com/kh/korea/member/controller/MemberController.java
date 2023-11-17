package com.kh.korea.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("Logon")
	public String koreanLogon(Member m, Model model) {
		//암호화 작업(암호문을 만들어내는 과정)
		String encPwd = bcPwd.encode(m.getMemberPwd());	
		//암호화 한 패스워드 다시 담기
		 m.setMemberPwd(encPwd);
		 System.out.println(m);
		if(ms.insertMember(m) > 0) {
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";
		}
	}
	@ResponseBody
	@RequestMapping("idCheck")
	public String idCheck(String checkId) {
		System.out.println(checkId);
		int count = ms.idCheck(checkId);
		
		return count > 0 ? "NNN" : "NNY";
	}
	
	@ResponseBody
	@RequestMapping("nickCheck")
	public String nickCheck(String checkNick) {
		int count = ms.nickCheck(checkNick);
		return count > 0 ? "NNN" : "NNY";
	}
	
	
	@RequestMapping("login")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = ms.loginMember(m);
		
		if(loginUser !=null && bcPwd.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			  session.setAttribute("loginUser",loginUser);
		      mv.setViewName("redirect:/");
		}else {
	         mv.addObject("errorMsg", "로그인실패").setViewName("common/errorPage");
		}
		return mv;
		//시간나면 아이디저장 만들기
	}
	 @RequestMapping("logout")
	   public String logoutMember(HttpSession session) {
	      session.invalidate();
	      return "redirect:/";
	   }
}
