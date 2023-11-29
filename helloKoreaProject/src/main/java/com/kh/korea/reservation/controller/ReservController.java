package com.kh.korea.reservation.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.korea.reservation.model.service.ReservService;
import com.kh.korea.reservation.model.vo.Reservation;

@Controller
public class ReservController {
	
	@Autowired
	private ReservService reservService;
	
	@GetMapping("list.kf")
	public String kfReservList() {
		return "reservation/KoreanFoodFrontView";
	}
	
	@GetMapping("rsvEnrollForm.kf")
	public String kfReservForm() {
		return "reservation/KoreanFoodReservForm";
	}
	
	@GetMapping("rsvlist.kf")
	public String allReservForm() {
		return "reservation/ReservationListView";
	}
	
	@ResponseBody
	@GetMapping(value="rsvcheck.kf", produces="applicatrion/json; charset=UTF-8") //json쓰려고 적어놓음
	public String selectTime(Date reDate /*ajax에서 넘기는 값*/) {
		
		//System.out.print(reDate);
		ArrayList<Reservation> list = reservService.selectTime(reDate); //서비스호출.인터페이스에 이름(sql에 가져갈거)
		// 담아온 결과값 어디에 담겠다 / 이름짓기
		//System.out.print(list);
		return new Gson().toJson(list); 
	}
	
	

}
