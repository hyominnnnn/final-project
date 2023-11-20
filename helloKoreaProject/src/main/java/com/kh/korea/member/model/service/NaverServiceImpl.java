package com.kh.korea.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.member.model.dao.MemberDao;

@Service
public class NaverServiceImpl implements NaverService {

	@Autowired
	private MemberDao memberDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public String getToken(String code) throws IOException, ParseException {
		
		String naverUrl = "https://nid.naver.com/oauth2.0/token";
		
		URL url = new URL(naverUrl);
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);  //post 방식일때는 추가로 해야줘야할 구문이다.	
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=Tf_XaxBirROlA8S513Ix");
		sb.append("&client_secret=1ABuG50EdD");
		sb.append("&code=" + code);
		
		bw.write(sb.toString());
		bw.flush();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line ="";
		String responseData ="";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		//System.out.println(element);
		String accessToken = element.get("access_token").toString();
		
		br.close();
		bw.close();
		
		//System.out.println(accessToken);
		return accessToken;
	}
	@Override
	public HashMap<String, String> getUserInfo(String accessToken) throws IOException, ParseException {
		
		String naverUrl = "https://openapi.naver.com/v1/nid/me";
		
		URL url = new URL(naverUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		urlConnection.setRequestMethod("GET");
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		System.out.println("응답값 : " + responseData);
		
		JSONObject obj = (JSONObject)new JSONParser().parse(responseData);
		JSONObject responseObj = (JSONObject)obj.get("response");
		String id = responseObj.get("id").toString();
		String profile = responseObj.get("profile_image").toString().replaceAll("\\/", "/");
		
		//System.out.println(id);
		//System.out.println(profile);
		HashMap<String, String> map = new HashMap();
		
		map.put("id", id);
		map.put("profile", profile);
		
		return map;
	}

}
