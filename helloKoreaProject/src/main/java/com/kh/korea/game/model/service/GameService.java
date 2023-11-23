package com.kh.korea.game.model.service;

import com.kh.korea.game.model.vo.LowerGame;

public interface GameService {
	
	LowerGame firstQuiz();
	
	int lastNo();
	
	LowerGame nextQuiz(int quizNo);
	
	LowerGame prevQuiz(int quizNo);
	
	

}
