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
	public ArrayList<Reservation> selectTime(Date reDate) {
		return null;
	}

}
