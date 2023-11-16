package com.kh.korea.admin.controller;

<<<<<<< Updated upstream
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
=======
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.korea.admin.model.service.AdminService;
import com.kh.korea.common.model.vo.PageInfo;
import com.kh.korea.common.template.Pagination;
import com.kh.korea.member.model.vo.Member;
>>>>>>> Stashed changes

@Controller
public class AdminController {
	
<<<<<<< Updated upstream
	@GetMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}
	
	@RequestMapping(value="memberPosting", method = {RequestMethod.GET})
	public String memberPosting() {
		return "admin/memberPosting";
=======
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping("memberInfo")
	public String memberInfo() {
		return "admin/memberInfo";
	}
	
	
	@RequestMapping("list.me")
	public String selectList(@RequestParam(value="cPage", defaultValue="1") int currentPage,
			Model model) {
		
		
		PageInfo pi = Pagination.getPageInfo(adminService.selectListCount(),
											 currentPage,
											 5,
											 5);
		model.addAttribute("list", adminService.selectList(pi));
		model.addAttribute("pi", pi);
		
		//ArrayList<Member> list	= adminService.selectList(pi);
		
		//System.out.println(list);
		
		return "admin/memberInfo";
	
>>>>>>> Stashed changes
	}
	
}
