package com.kh.korea.admin.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.korea.admin.model.service.AdminService;
import com.kh.korea.board.model.vo.Board;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.common.template.Pagination;
import com.kh.korea.member.model.vo.Member;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}

	// 관리자 페이지 시작
	@RequestMapping("admin")
	public String admin() {
		return "admin/memberInfo";
	}

	// 회원 정보 리스트
	@RequestMapping("list.me")
	public String selectMemberList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(),
											 currentPage,
											 5,
											 5);
		model.addAttribute("list", adminService.selectList(pi));
		model.addAttribute("pi", pi);
		//System.out.println(model.getAttribute("list"));
		

		return "admin/memberInfo";
	}
	
	// 회원 상세 조회
	@ResponseBody
	@GetMapping(value="memberDetail.me", produces="application/json; charset=UTF-8")
	public String memberInfoDetail(Member m) {
		
		//System.out.println(m);
		//Member memberDetail = adminService.memberDetail(m);
		
		//System.out.println(memberDetail);
		//mv.addObject("memberDetail",adminService.memberDetail(m))
		//  .setViewName("redirect:list.me");
		
		return new Gson().toJson(adminService.memberDetail(m));
		
	}
	
	// 게시판 리스트 조회
	@GetMapping("detail.me")
	public String selectMemberPostList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectBoardListCount(),
											 currentPage,
											 5,
											 5);
		model.addAttribute("list", adminService.selectBoardList(pi));
		model.addAttribute("pi", pi);
		
		return "admin/memberPosting";
	}
	
	// 게시판 리스트 상세 조회
	@ResponseBody
	@GetMapping(value="memberPosting.me", produces="application/json; charset=UTF-8")
	public String memberPostingDetail(Board b) {
		
		return new Gson().toJson(adminService.boardPosting(b));
		
	}
	
	
	// 회원 삭제
	@RequestMapping("delete.me")
	public String memberDelete(String memberPwd, String email, HttpSession session) {
		
		//Member m = new Member();
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		//String memberEmail = m.getEmail();
		String encPwd = loginUser.getMemberPwd();
		
		if(bcryptPasswordEncoder.matches(memberPwd, encPwd)) {
			
			//String email = loginUser.getEmail();
			
			if(adminService.memberDelete(email) > 0) {
				session.removeAttribute("loginUser");
				return "redirect:/";
			} else {
				return "common/errorPage";
			}
				
			} else {
				return "admin/memberInfo";
		}
	}
	
	
	// 회원 게시물 리스트 화면
	@GetMapping("memberPosting")
	public String memberPosting() {
		return "admin/memberPosting";
	}
	
	// 게시물 조회 버튼
	@RequestMapping("posting.me")
	public String memberPostingDatail() {
		return "admin/memberPosting";
	}
	
	// 댓글 버튼
	@GetMapping("reply.me")
	public String memberReplyDetail() {
		return "admin/memberReply";
	}
	
	// 회원 댓글 리스트 화면
	@GetMapping("memberReply")
	public String memberReply() {
		return "admin/memberReply";
	}
	
	
	@GetMapping("memberreply.me")
	public String MemberReply(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectBoardListCount(),
											 currentPage,
											 5,
											 5);
		model.addAttribute("list", adminService.selectReplyList(pi));
		model.addAttribute("pi", pi);
		
		return "admin/memberPosting";
	}
	
	
	@GetMapping("memberReply2")
	public String memberReply2() {
		return "admin/memberReply2";
	}
	
	// 회원 퀴즈 리스트 화면
	@GetMapping("memberQuiz")
	public String memberQuiz(){
		return "admin/memberQuiz";
	}
	//자유 게시판 화면
	@GetMapping ("memberFreePosting")
	public String freePosting() {
		return "admin/memberFreePosting";
	}
	
	@RequestMapping("freeList.me")
	public String selecFreeBoardList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectFreeBoardListCount(),
											 currentPage,
											 5,
											 5);
		model.addAttribute("list", adminService.selectFreeBoardList(pi));
		model.addAttribute("pi", pi);
		//System.out.println(model.getAttribute("list"));
		

		return "admin/memberFreePosting";
	}
	
	// 회원 개인 게시글 화면
	@GetMapping("personalPosting")
	public String personalPosting() {
		return "admin/personalPosting";
	}
	
	@ResponseBody
	@GetMapping(value="memberFreePosting.me", produces="application/json; charset=UTF-8")
	public String memberFreePostingDetail(Board b) {
		
		return new Gson().toJson(adminService.freeBoardPosting(b));
		
	}
	
}
