package com.kh.korea.member.controller;

import java.io.IOException;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.korea.member.model.service.GoogleService;


@Controller
public class GoogleController {
	
	@Autowired
	private GoogleService googleService;
	
	
	@RequestMapping("gcode")
	public void getCode(String code) throws IOException, ParseException {
		//System.out.println(code);
		String accessToken = googleService.getToken(code);
		googleService.getUserInfo(accessToken);
		
	}
}
