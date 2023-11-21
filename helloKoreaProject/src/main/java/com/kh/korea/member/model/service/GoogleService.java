package com.kh.korea.member.model.service;

import java.io.IOException;

import org.json.simple.parser.ParseException;

public interface GoogleService {
	String getToken(String code) throws IOException, ParseException;

	void getUserInfo(String accessToken) throws IOException;
}
