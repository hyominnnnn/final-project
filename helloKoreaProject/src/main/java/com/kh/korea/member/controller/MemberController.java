package com.kh.korea.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;
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
	         //mv.addObject("errorMsg", "로그인실패").setViewName("common/errorPage");
			mv.addObject("errorMsg", "아이디 및 패스워드가 틀렸습니다.").setViewName("member/loginForm");
		}
		
		//System.out.println(loginUser);
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
	
	@RequestMapping("delete")
	public String deleteMember(String email, String emailCheck, Model model, HttpSession session) {
		System.out.println(email);
		System.out.println(emailCheck);
		if(email.equals(emailCheck)) {
			int result = memberService.deleteMember(email);
			if(result > 0) {
				session.removeAttribute("loginUser");
				return "common/goodbyePage";
			}else {
				model.addAttribute("errorMsg","회원 탈퇴에 실패했습니다.");
				return "common/errorPage";
			}
			
			
		}else {
			model.addAttribute("errorMsg","이메일을 잘못 입력했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateProfile")
	public String updateProfile( MultipartFile upfile, //여러개의 첨부파일을 전달받을 시 MultipartFile[]로 받을 수 있음
			HttpSession session, Model model ) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			loginUser.setSocialProfile(saveFile(upfile, session));
		  	int result = memberService.updateProfile(loginUser);
		  	System.out.println(loginUser);
		  	if(result > 0) {
		  		session.setAttribute("loginUser",loginUser);
		  		return "member/myPageForm";
		  	}else {
		  		model.addAttribute("errorMsg","게시글 작성 실패");
				return "common/errorPage";
		  	}
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		//파일 수정 작후 서버에 업로드
		String originName = upfile.getOriginalFilename();
		// "20231103102244"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) + 10000;
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/member_image/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "resources/member_image/" + changeName;
	}
		
}
