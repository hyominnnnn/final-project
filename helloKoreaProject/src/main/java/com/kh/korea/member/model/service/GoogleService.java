package com.kh.korea.member.model.service;

import java.io.IOException;
import java.util.HashMap;

import org.json.simple.parser.ParseException;

public interface GoogleService {
	String getToken(String code) throws IOException, ParseException;

	HashMap<String, String> getUserInfo(String accessToken) throws IOException, ParseException;
}
