package com.kh.korea.member.controller;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.korea.member.model.service.MemberService;
import com.kh.korea.member.model.vo.Cert;
import com.kh.korea.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcPwd;
	
	@Autowired
	private JavaMailSender sender;
	
	@RequestMapping("Logon")
	public String logon(Member m, Model model) {
		//암호화 작업(암호문을 만들어내는 과정)
		String encPwd = bcPwd.encode(m.getMemberPwd());	
		//암호화 한 패스워드 다시 담기
		 m.setMemberPwd(encPwd);
		 //System.out.println(m);
		if(memberService.insertMember(m) > 0) {
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
		int count = memberService.idCheck(checkId);
		
		return count > 0 ? "NNN" : "NNY";
	}
	
	@ResponseBody
	@RequestMapping("cert")
	public String inertCert(String email) throws MessagingException {
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		//랜덤 숫자 6자리 만들기
		Random r = new Random();
		int i = r.nextInt(100000);
		Format f = new DecimalFormat("000000");
		String certNo = f.format(i);
		
		//객체를 생성하면서 SETTER 역할을 하면서 값을 담아준다.
		Cert cert = Cert.builder().email(email).certNo(certNo).build();
		int result = memberService.sendMail(cert);
		
		//메시지를 메일로 보내주자
		helper.setTo(email);
		helper.setSubject("어서와 한국은 처음이지의 회원가입 인증번호");
		helper.setText("인증번호 : " + certNo );
		
		sender.send(message);
		
		if(result > 0) {
			return "Y"; 
		}else {
			return "N";
		}
	}
	
	@ResponseBody
	@RequestMapping("certCheck")
	public Boolean certCheck(String certNo, String email, HttpServletRequest request) {
		Cert cert = Cert.builder().email(email).certNo(certNo).build();
		boolean result = memberService.validate(cert);
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping("nickCheck")
	public String nickCheck(String checkNick) {
		int count = memberService.nickCheck(checkNick);
		return count > 0 ? "NNN" : "NNY";
	}
	
	
	@RequestMapping("login")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser !=null && bcPwd.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			  session.setAttribute("loginUser",loginUser);
		      mv.setViewName("redirect:/");
		}else {
	         mv.addObject("errorMsg", "로그인실패").setViewName("common/errorPage");
		}
		
		System.out.println(loginUser);
		return mv;
		//시간나면 아이디저장 만들기
	}
	 @RequestMapping("logout")
	   public String logoutMember(HttpSession session) {
	      session.invalidate();
	      return "redirect:/";
	   }
	 

		@RequestMapping("socialLogon")
		public String kakaoLogon(Member m, Model model) {
			System.out.println(m);
			int result = memberService.insertMember(m); 
			if(result > 0) {
				return "redirect:/";
			}else {
				model.addAttribute("errorMsg","회원가입 실패");
				return "common/errorPage";
			}
		}
}
