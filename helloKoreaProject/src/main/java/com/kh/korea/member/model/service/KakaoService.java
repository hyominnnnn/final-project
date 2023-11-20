package com.kh.korea.member.model.service;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.parser.ParseException;

import com.kh.korea.member.model.vo.Member;

public interface KakaoService {
	String getToken(String code) throws IOException, ParseException;
	HashMap<String, String>  getUserInfo(String accessToken) throws IOException, ParseException;
	int kakaoCheck(String id);
	Member kakaoLogin(String id);
}
