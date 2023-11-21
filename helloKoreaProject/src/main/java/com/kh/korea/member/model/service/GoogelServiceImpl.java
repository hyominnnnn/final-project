package com.kh.korea.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class GoogelServiceImpl implements GoogleService {

	@Override
	public String getToken(String code) throws IOException, ParseException {
		
		//토큰 받을 url 주소를 적는다.
		String googleUrl = "https://oauth2.googleapis.com/token";
		//작성한 url 기반으로 URL 객체 생성
		URL url = new URL(googleUrl);
		//URL을 사용하여 HTTP연결
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);  //post 방식일때는 추가로 해야줘야할 구문이다.	
		
		//추가적인 정보를 보내기 위한 작업
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("client_id=455689616363-l4geciacek63nj3u1rqa3v58l2qjgg7s.apps.googleusercontent.com");
		sb.append("&client_secret=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");
		sb.append("&code=" + code);
		sb.append("&grant_type=authorization_code");
		sb.append("&redirect_uri=http://localhost:9999/korea/gcode");		
		
		bw.write(sb.toString());
		bw.flush();
		//여기서 잘 연결 되는지 확인
		//System.out.println(urlConnection.getResponseCode());
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line ="";
		String responseData ="";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		//응답 값 잘 뽑힌지 확인
		//System.out.println(responseData);
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		System.out.println(accessToken);
		
		br.close();
		bw.close();
		
		return accessToken;
	}
	
	@Override
	public void getUserInfo(String accessToken) throws IOException {
		//System.out.println(accessToken);
		String googleUrl = "https://www.googleapis.com/drive/v2/files?access_token=" + accessToken;
		
		URL url = new URL(googleUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		urlConnection.setRequestMethod("GET");
		/* 책 사서 다시 도전!
		OAuth20Service oauthService = new ServiceBuilder().
		
		System.out.println(urlConnection.getResponseCode());
		*/
	}
	

}
