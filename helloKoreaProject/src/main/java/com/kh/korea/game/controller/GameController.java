package com.kh.korea.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.korea.game.model.service.GameService;

@Controller
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	// 게임 메인페이지
	@GetMapping("main.ga")
	public String gameMain() {
		return "game/gameMain";
	}
	
	

}
