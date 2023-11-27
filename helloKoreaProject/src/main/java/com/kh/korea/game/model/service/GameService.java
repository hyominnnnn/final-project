package com.kh.korea.game.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;
import com.kh.korea.game.model.vo.Score;

public interface GameService {
	
	LowerGame firstQuiz();
	
	int lastNo();
	
	LowerGame nextQuiz(int quizNo);
	
	LowerGame prevQuiz(int quizNo);
	
	int checkAnswer(ArrayList<Answer> list);
	
	int insertScore(HashMap<String, Integer> map);
	
	ArrayList<Score> selectScore(int memberNo);

}
