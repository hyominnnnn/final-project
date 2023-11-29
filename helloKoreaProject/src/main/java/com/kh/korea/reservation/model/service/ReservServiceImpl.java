package com.kh.korea.reservation.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.korea.reservation.model.dao.ReservDao;
import com.kh.korea.reservation.model.vo.Reservation;

@Service
public class ReservServiceImpl implements ReservService {

	@Autowired
	private ReservDao reservDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> selectTime(Date reDate) { // 가져올 결과값을 담을 모양 / 인터페이스에서 지은 이름 / 화면에서 받아온 값
		return reservDao.selectTime(sqlSession, reDate); // dao호출.인터페이스에서 지은이름(sql, 화면에서 받아온 값)
	}

}
