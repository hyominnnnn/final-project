package com.kh.korea.game.model.service;

import java.util.ArrayList;

import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;

public interface GameService {
	
	LowerGame firstQuiz();
	
	int lastNo();
	
	LowerGame nextQuiz(int quizNo);
	
	LowerGame prevQuiz(int quizNo);
	
	int checkAnswer(ArrayList<Answer> list);

}
