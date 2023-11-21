package com.kh.korea.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
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

	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}

	
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
	
	@ResponseBody
	@GetMapping(value="memberPosting.me", produces="application/json; charset=UTF-8")
	public String memberPostingDetail(Board b) {
		
		return new Gson().toJson(adminService.boardPosting(b));
		
	}
	
	
	
	/*
	@RequestMapping("delete.me")
	public String memberDelete(String memberPwd, HttpSession session) {
		
		Member loginUser = ((Member)session.getAttribute("loginUser"));
		String adminPwd = loginUser.getMemberPwd();
		
		if(adminService.memberDelete(email) > 0) {
			session.removeAttribute("loginUser");
			return "redirect:/";
		} else {
			return "common/errorPage";
		}
		
	}
	*/
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
	
	@GetMapping("memberReply")
	public String memberReply() {
		return "admin/memberReply";
	}
	
	/*
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
	*/
	
	@GetMapping("memberReply2")
	public String memberReply2() {
		return "admin/memberReply2";
	}
	
	
}
