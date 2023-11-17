package com.kh.korea.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.korea.admin.model.service.AdminService;
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
	
	
	@GetMapping("memberPosting")
	public String memberPosting() {
		return "admin/memberPosting";
	}
	
	@ResponseBody
	@GetMapping(value="memberDetail.me", produces="application/json; charset=UTF-8")
	public String memberPostingDetail(Member m) {
		
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
	
	
	
	
	@GetMapping("reply.me")
	public String memberReply() {
		return "admin/memberReply";
	}
	
}
