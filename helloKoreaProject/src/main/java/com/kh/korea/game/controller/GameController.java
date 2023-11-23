package com.kh.korea.game.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.korea.game.model.service.GameService;
import com.kh.korea.game.model.vo.Answer;

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
	
	// DB에 저장된 문제 번호 중 가장 큰 번호
	@ResponseBody
	@GetMapping("lastNo.ga")
	public int lastNo() {
		return gameService.lastNo();
	}
	
	// 다음 문제
	// 현재 번호를 가져와서 거기에 + 1 한 값으로 출력
	@ResponseBody
	@GetMapping(value="nextQuiz.ga", produces="application/json; charset=UTF-8")
	public String nextQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.nextQuiz(quizNo));
	}
	
	// 이전 문제
	// 현재 번호를 가져와서 거기에 - 1 한 값으로 출력
	@ResponseBody
	@GetMapping(value="prevQuiz.ga", produces="application/json; charset=UTF-8")
	public String prevQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.prevQuiz(quizNo));
	}
	
	// 사용자가 체크한 정답과 진짜 정답 비교
	@ResponseBody
	@PostMapping("checkAnswer.ga")
	public void correctAnswer(@RequestBody String answers) throws ParseException {
		JSONArray arr = (JSONArray)new JSONParser().parse(answers);
		List<Answer> userAnswer = new ArrayList<Answer>();
		
		for(Object obj : arr) {
			JSONObject jsonObj = (JSONObject)obj;
			
			Answer answer = new Answer();
			System.out.println(jsonObj.get("no").getClass().getSimpleName());
			System.out.println(jsonObj.get("answer").getClass().getSimpleName());
			//answer.setNo((Integer)jsonObj.get("no"));
			//answer.setAnswer((Integer)jsonObj.get("answer"));
			userAnswer.add(answer);
		}
		
		System.out.println(userAnswer);
	}
	
	
	
}
