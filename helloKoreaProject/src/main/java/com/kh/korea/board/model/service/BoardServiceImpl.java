package com.kh.korea.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.board.model.dao.BoardDao;
import com.kh.korea.board.model.vo.Board;
import com.kh.korea.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int countInfoList() {
		return boardDao.countInfoList(sqlSession);
	}

	@Override
	public ArrayList<Board> selectInfoList(PageInfo infoPi) {
		int offset = (infoPi.getCurrentPage() - 1) * infoPi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, infoPi.getBoardLimit());
		return boardDao.selectInfoList(sqlSession, rowBounds);
	}
	
	
	
	

}
