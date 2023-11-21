package com.kh.korea.game.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.game.model.dao.GameDao;
import com.kh.korea.game.model.vo.LowerGame;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	private GameDao gameDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public LowerGame firstQuiz() {
		return gameDao.firstQuiz(sqlSession);
	}

	@Override
	public LowerGame nextQuiz(int quizNo) {
		return gameDao.nextQuiz(sqlSession, quizNo);
	}

	@Override
	public LowerGame prevQuiz(int quizNo) {
		return gameDao.prevQuiz(sqlSession, quizNo);
	}
	
	

}
