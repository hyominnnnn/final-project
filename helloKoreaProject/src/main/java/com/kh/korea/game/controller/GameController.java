package com.kh.korea.game.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.korea.game.model.service.GameService;
import com.kh.korea.game.model.vo.LowerGame;

@Controller
public class GameController {
	
	@Autowired
	private GameService gameService;
	
	// 게임 메인페이지
	@GetMapping("main.ga")
	public String gameMain() {
		return "game/gameMain";
	}
	
	// 초급 게임페이지
	@GetMapping("lower.ga")
	public ModelAndView lowerGame(ModelAndView mv) {
		mv.addObject("firstQuiz", gameService.firstQuiz()).setViewName("game/lowerGame");
		return mv;
	}
	
	// 다음 문제
	// 현재 번호를 가져와서 거기에 + 1 한 값으로 출력
	@ResponseBody
	@GetMapping(value="nextQuiz.ga", produces="application/json; charset=UTF-8")
	public String nextQuiz(int quizNo) {
		System.out.println(quizNo);
		return new Gson().toJson(gameService.nextQuiz(quizNo));
	}
	
	// 이전 문제
	// 현재 번호를 가져와서 거기에 - 1 한 값으로 출력
	@ResponseBody
	@GetMapping(value="prevQuiz.ga", produces="application/json; charset=UTF-8")
	public String prevQuiz(int quizNo) {
		System.out.println(quizNo);
		return new Gson().toJson(gameService.prevQuiz(quizNo));
	}
	
	
	
}
