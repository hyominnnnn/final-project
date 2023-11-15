package com.kh.korea;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ForwardController {
	
	@GetMapping("main")
	public String main() {
		return "main";
	}

	@GetMapping("header")
	public String header() {
		return "common/header";
	}
	
	

}
