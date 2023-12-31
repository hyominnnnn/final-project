package com.kh.korea.game.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	// ----- 초급 -----
	
	// 초급 게임페이지
	@GetMapping("lower.ga")
	public ModelAndView lowerGame(ModelAndView mv) {
		mv.addObject("firstQuiz", gameService.lowQuiz()).setViewName("game/lowerGame");
		return mv;
	}
	
	// DB에 저장된 초급 문제 번호 중 가장 큰 번호
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
	public int checkAnswer(@RequestBody String answers) throws ParseException {
		// answers(객체배열)을 파싱해서 JSONArray에 넣는다.
		// answers의 키값에 해당하는 값들을 가져오기 위해서
		JSONArray arr = (JSONArray)new JSONParser().parse(answers);
		// 문제번호와 정답을 저장하는 VO 배열
		ArrayList<Answer> list = new ArrayList();
		// 점수
		int score;
		
		for(Object obj : arr) {
			// JsonArray 데이터를 순차적으로 JsonObject에 담는다.
			JSONObject jsonObj = (JSONObject)obj;
			
			Answer answer = new Answer();
			
			// jsonObject의 키값(no, answer)에 해당하는 값을 뽑아서 answer VO의 no와 answer에 담는다.
			// 기본 int형 값이 필요하기에 value를 string으로 바꾼 후에 parseInt메소드를 통해서 int형으로 바꾼다.
			// jsonObject로 받아온 값의 value가 object타입이기 때문에 string으로 바꾼 후에 int형으로 바꾼다.
			answer.setNo(Integer.parseInt(jsonObj.get("no").toString()));
			answer.setAnswer(Integer.parseInt(jsonObj.get("answer").toString()));
			list.add(answer);
		}
		
		// 사용자가 작성한 답 리스트
		// System.out.println(list);
		
		// 정답 개수
		return gameService.checkAnswer(list);
	}
	
	// ----- 중급 -----
	
	// 중급 게임페이지
	@GetMapping("middle.ga")
	public ModelAndView middleGame(ModelAndView mv) {
		mv.addObject("firstQuiz", gameService.middleQuiz()).setViewName("game/middleGame");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("lastMiddleNo.ga")
	public int lastMiddleNo() {
		return gameService.lastMiddleNo();
	}
	
	@ResponseBody
	@GetMapping(value="nextMiddleQuiz.ga", produces="application/json; charset=UTF-8")
	public String nextMiddleQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.nextMiddleQuiz(quizNo));
	}
	
	@ResponseBody
	@GetMapping(value="prevMiddleQuiz.ga", produces="application/json; charset=UTF-8")
	public String prevMiddleQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.prevMiddleQuiz(quizNo));
	}
	
	@ResponseBody
	@PostMapping("checkMiddleAnswer.ga")
	public int checkMiddleAnswer(@RequestBody String answers) throws ParseException {
		// answers(객체배열)을 파싱해서 JSONArray에 넣는다.
		// answers의 키값에 해당하는 값들을 가져오기 위해서
		JSONArray arr = (JSONArray)new JSONParser().parse(answers);
		// 문제번호와 정답을 저장하는 VO 배열
		ArrayList<Answer> list = new ArrayList();
		// 점수
		int score;
		
		for(Object obj : arr) {
			// JsonArray 데이터를 순차적으로 JsonObject에 담는다.
			JSONObject jsonObj = (JSONObject)obj;
			
			Answer answer = new Answer();
			
			// jsonObject의 키값(no, answer)에 해당하는 값을 뽑아서 answer VO의 no와 answer에 담는다.
			// 기본 int형 값이 필요하기에 value를 string으로 바꾼 후에 parseInt메소드를 통해서 int형으로 바꾼다.
			// jsonObject로 받아온 값의 value가 object타입이기 때문에 string으로 바꾼 후에 int형으로 바꾼다.
			answer.setNo(Integer.parseInt(jsonObj.get("no").toString()));
			answer.setAnswer(Integer.parseInt(jsonObj.get("answer").toString()));
			list.add(answer);
		}
		
		// 사용자가 작성한 답 리스트
		// System.out.println(list);
		
		// 정답 개수
		return gameService.checkMiddleAnswer(list);
	}
	
	// ----- 고급 -----
	
	// 고급 게임페이지
	@GetMapping("upper.ga")
	public ModelAndView upperGame(ModelAndView mv) {
		mv.addObject("firstQuiz", gameService.upperQuiz()).setViewName("game/upperGame");
		return mv;
	}
	
	@ResponseBody
	@GetMapping("lastUpperNo.ga")
	public int lastUpperNo() {
		return gameService.lastUpperNo();
	}
	
	@ResponseBody
	@GetMapping(value="nextUpperQuiz.ga", produces="application/json; charset=UTF-8")
	public String nextUpperQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.nextUpperQuiz(quizNo));
	}
	
	@ResponseBody
	@GetMapping(value="prevUpperQuiz.ga", produces="application/json; charset=UTF-8")
	public String prevUpperQuiz(int quizNo) {
		// System.out.println(quizNo);
		return new Gson().toJson(gameService.prevUpperQuiz(quizNo));
	}
	
	@ResponseBody
	@PostMapping("checkUpperAnswer.ga")
	public int checkUpperAnswer(@RequestBody String answers) throws ParseException {
		// answers(객체배열)을 파싱해서 JSONArray에 넣는다.
		// answers의 키값에 해당하는 값들을 가져오기 위해서
		JSONArray arr = (JSONArray)new JSONParser().parse(answers);
		// 문제번호와 정답을 저장하는 VO 배열
		ArrayList<Answer> list = new ArrayList();
		// 점수
		int score;
		
		for(Object obj : arr) {
			// JsonArray 데이터를 순차적으로 JsonObject에 담는다.
			JSONObject jsonObj = (JSONObject)obj;
			
			Answer answer = new Answer();
			
			// jsonObject의 키값(no, answer)에 해당하는 값을 뽑아서 answer VO의 no와 answer에 담는다.
			// 기본 int형 값이 필요하기에 value를 string으로 바꾼 후에 parseInt메소드를 통해서 int형으로 바꾼다.
			// jsonObject로 받아온 값의 value가 object타입이기 때문에 string으로 바꾼 후에 int형으로 바꾼다.
			answer.setNo(Integer.parseInt(jsonObj.get("no").toString()));
			answer.setAnswer(Integer.parseInt(jsonObj.get("answer").toString()));
			list.add(answer);
		}
		
		// 사용자가 작성한 답 리스트
		// System.out.println(list);
		
		// 정답 개수
		return gameService.checkUpperAnswer(list);
	}
	
	// 난이도별 점수 insert
	@ResponseBody
	@GetMapping("insertScore.ga")
	public int insertScore(int memberNo, int score, int levelNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("score", score);
		map.put("levelNo", levelNo);
		
		return gameService.insertScore(map);
	}
	
	// 사용자의 난이도별 점수 가져오기
	@ResponseBody
	@PostMapping(value="selectScore.ga", produces="application/json; charset=UTF-8")
	public String selectScore(int memberNo) {
		return new Gson().toJson(gameService.selectScore(memberNo));
		
	}
	
	// 난이도별 뱃지 insert (정답이 20개 이상인 사람만)
	@ResponseBody
	@GetMapping("insertBadge.ga")
	public int insertBadge(int memberNo, int badgeNo) {
		
		HashMap<String, Integer> map = new HashMap();
		map.put("memberNo", memberNo);
		map.put("badgeNo", badgeNo);
		
		return gameService.insertBadge(map);
	}
	
	// 사용자가 획득한 뱃지 가져오기
	@ResponseBody
	@GetMapping(value="selectBadge.ga", produces="application/json; charset=UTF-8")
	public String selectBadge(int memberNo) {
		return new Gson().toJson(gameService.selectBadge(memberNo));
	}
	
	
}
