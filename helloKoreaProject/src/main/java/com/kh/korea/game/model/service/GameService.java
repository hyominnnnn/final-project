package com.kh.korea.game.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;
import com.kh.korea.game.model.vo.MiddleGame;
import com.kh.korea.game.model.vo.Score;
import com.kh.korea.game.model.vo.UpperGame;
import com.kh.korea.game.model.vo.UserBadge;

public interface GameService {
	
	// ----- 초급 -----
	LowerGame lowQuiz();
	int lastNo();
	LowerGame nextQuiz(int quizNo);
	LowerGame prevQuiz(int quizNo);
	int checkAnswer(ArrayList<Answer> list);
	
	// ----- 중급 -----
	MiddleGame middleQuiz();
	int lastMiddleNo();
	MiddleGame nextMiddleQuiz(int quizNo);
	MiddleGame prevMiddleQuiz(int quizNo);
	int checkMiddleAnswer(ArrayList<Answer> list);
	
	// ----- 고급 -----
	UpperGame upperQuiz();
	int lastUpperNo();
	UpperGame nextUpperQuiz(int quizNo);
	UpperGame prevUpperQuiz(int quizNo);
	int checkUpperAnswer(ArrayList<Answer> list);
	
	// 난이도별 점수 insert
	int insertScore(HashMap<String, Integer> map);
	
	// 난이도별 점수 select
	ArrayList<Score> selectScore(int memberNo);
	
	// 난이도별 뱃지 insert
	int insertBadge(HashMap<String, Integer> map);

	// 뱃지 select
	ArrayList<UserBadge> selectBadge(int memberNo);
}
