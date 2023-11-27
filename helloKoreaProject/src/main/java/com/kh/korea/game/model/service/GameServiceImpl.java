package com.kh.korea.game.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.game.model.dao.GameDao;
import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;
import com.kh.korea.game.model.vo.Score;

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
	public int lastNo() {
		return gameDao.lastNo(sqlSession);
	}

	@Override
	public LowerGame nextQuiz(int quizNo) {
		return gameDao.nextQuiz(sqlSession, quizNo);
	}

	@Override
	public LowerGame prevQuiz(int quizNo) {
		return gameDao.prevQuiz(sqlSession, quizNo);
	}

	@Override
	public int checkAnswer(ArrayList<Answer> list) {
		return gameDao.checkAnswer(sqlSession, list);
	}

	@Override
	public int insertScore(HashMap<String, Integer> map) {
		return gameDao.insertScore(sqlSession, map);
	}

	@Override
	public ArrayList<Score> selectScore(int memberNo) {
		return gameDao.selectScore(sqlSession, memberNo);
	}

	
	
	

}
