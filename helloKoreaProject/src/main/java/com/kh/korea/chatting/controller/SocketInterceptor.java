package com.kh.korea.chatting.controller;

import java.util.Map;

import javax.security.auth.message.AuthException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.kh.korea.member.model.vo.Member;

@Component
public class SocketInterceptor /*implements HandshakeInterceptor*/ {
	/*	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
		Map<String, Object> attributes) throws Exception {
		HttpServletRequest req = ((ServletServerHttpRequest)request).getServletRequest();
		HttpSession session  =  req.getSession(false);
		System.out.println("session : "  + session);
		if(session != null) {
			Member member = (Member)session.getAttribute("loginUser");
			String memberNickname = member.getMemberNickname();
			attributes.put("memberNickname",memberNickname);
			return true;
		}
		throw new AuthException("로그인 해주세요");
			return true;
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			@Nullable Exception exception) {
		
	}
	*/
}
