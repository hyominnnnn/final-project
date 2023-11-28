package com.kh.korea.game.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.game.model.dao.GameDao;
import com.kh.korea.game.model.vo.Answer;
import com.kh.korea.game.model.vo.LowerGame;
import com.kh.korea.game.model.vo.MiddleGame;
import com.kh.korea.game.model.vo.Score;
import com.kh.korea.game.model.vo.UpperGame;

@Service
public class GameServiceImpl implements GameService {
	
	@Autowired
	private GameDao gameDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// ----- 초급 -----
	
	@Override
	public LowerGame lowQuiz() {
		return gameDao.lowQuiz(sqlSession);
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
	
	// ----- 중급 -----
	
	@Override
	public MiddleGame middleQuiz() {
		return gameDao.middleQuiz(sqlSession);
	}
	
	@Override
	public int lastMiddleNo() {
		return gameDao.lastMiddleNo(sqlSession);
	}
	
	@Override
	public MiddleGame nextMiddleQuiz(int quizNo) {
		return gameDao.nextMiddleQuiz(sqlSession, quizNo);
	}
	
	@Override
	public MiddleGame prevMiddleQuiz(int quizNo) {
		return gameDao.prevMiddleQuiz(sqlSession, quizNo);
	}
	
	@Override
	public int checkMiddleAnswer(ArrayList<Answer> list) {
		return gameDao.checkMiddleAnswer(sqlSession, list);
	}
	
	// ----- 고급 -----
	
	@Override
	public UpperGame upperQuiz() {
		return gameDao.upperQuiz(sqlSession);
	}
	
	@Override
	public int lastUpperNo() {
		return gameDao.lastUpperNo(sqlSession);
	}

	@Override
	public UpperGame nextUpperQuiz(int quizNo) {
		return gameDao.nextUpperQuiz(sqlSession, quizNo);
	}

	@Override
	public UpperGame prevUpperQuiz(int quizNo) {
		return gameDao.prevUpperQuiz(sqlSession, quizNo);
	}

	@Override
	public int checkUpperAnswer(ArrayList<Answer> list) {
		return gameDao.checkUpperAnswer(sqlSession, list);
	}
	
	// 난이도별 점수 insert
	@Override
	public int insertScore(HashMap<String, Integer> map) {
		return gameDao.insertScore(sqlSession, map);
	}

	// 난이도별 점수 select
	@Override
	public ArrayList<Score> selectScore(int memberNo) {
		return gameDao.selectScore(sqlSession, memberNo);
	}

	
	
}
