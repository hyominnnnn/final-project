package com.kh.korea.chatting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
@Configuration
@EnableWebSocket
public class WebSocketConfiguration /*implements WebSocketConfigurer*/{
	/*
	@Autowired
	SocketInterceptor socketInterceptor;
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry
		.addHandler(webSocketHandler(), "/chat")
		.setAllowedOriginPatterns("*").addInterceptors(socketInterceptor);
		registry
		.addHandler(webSocketHandler(), "/chat")
		.setAllowedOriginPatterns("*")
		.withSockJS().setInterceptors(socketInterceptor);
	}
	
	@Bean
	public WebSocketHandler webSocketHandler() {
		return new GroupChattingServer();
	}
	*/
}
