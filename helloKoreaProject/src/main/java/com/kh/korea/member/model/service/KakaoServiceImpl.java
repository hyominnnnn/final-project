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
import com.kh.korea.member.model.vo.Member;

@Service
public class KakaoServiceImpl implements KakaoService {

	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public String getToken(String code) throws IOException, ParseException {
		//토큰 받을 url 주소를 적는다.
		String kakaoUrl = "https://kauth.kakao.com/oauth/token";
		//작성한 url 기반으로 URL 객체 생성
		URL url = new URL(kakaoUrl);
		//URL을 사용하여 HTTP연결
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestMethod("POST");
		urlConnection.setDoOutput(true);  //post 방식일때는 추가로 해야줘야할 구문이다.	
		
		//추가적인 정보를 보내기 위한 작업
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=cffe893c81dfeaa4bdcec332321e0001");
		sb.append("&redirect_uri=http://localhost:9999/korea/code");
		sb.append("&code=" + code);		
		
		bw.write(sb.toString());
		bw.flush();
		//여기서 잘 연결 되는지 확인
		//System.out.println(urlConnection.getResponseCode());
		
		//응답온 정보를 읽어내자
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String line ="";
		String responseData ="";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		//응답 값 잘 뽑힌지 확인
		//System.out.println(responseData);
		
		//json으로 받은 값 파싱 작업
		JSONParser parser = new JSONParser();
		JSONObject element = (JSONObject)parser.parse(responseData);
		
		String accessToken = element.get("access_token").toString();
		
		br.close();
		bw.close();
		
		return accessToken;
	}

	@Override
	public HashMap<String, String> getUserInfo(String accessToken) throws IOException, ParseException {
		String kakaoUrl = "https://kapi.kakao.com/v2/user/me";
		
		URL url = new URL(kakaoUrl);
		
		HttpURLConnection urlConnection = (HttpURLConnection)url.openConnection();
		urlConnection.setRequestProperty("Authorization", "Bearer " + accessToken);
		urlConnection.setRequestMethod("GET");
		
		//200돌아오면 굿잡
		//System.out.println(urlConnection.getResponseCode());
		
		//응답 들어온 값을 긁어오자
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		String line = "";
		String responseData = "";
		while((line = br.readLine()) != null) {
			responseData += line;
		}
		
		//긁어온 응답값 확인
		//System.out.println(responseData);
		
		JSONObject responseObj = (JSONObject)new JSONParser().parse(responseData);
		JSONObject properties = (JSONObject)responseObj.get("properties");
		
		String id = responseObj.get("id").toString();
		String profile = properties.get("profile_image").toString();
		
		//System.out.println(profile);
		//System.out.println(id);
		//System.out.println(profileImage);
		//System.out.println(kakaoAccount.get("profile_image_url").toString());
		
		HashMap<String, String> map = new HashMap();
		
		map.put("id", id);
		map.put("profile", profile);
		
		return map;
	}

	@Override
	public int kakaoCheck(String id) {
		
		return md.kakaoCheck(sqlSession, id);
	}

	@Override
	public Member kakaoLogin(String id) {
		return md.kakaoLogin(sqlSession, id);
	}

}
