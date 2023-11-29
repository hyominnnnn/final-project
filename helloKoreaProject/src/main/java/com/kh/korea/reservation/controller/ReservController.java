package com.kh.korea.reservation.controller;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.korea.reservation.model.service.ReservService;

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
	@GetMapping(value="rsvcheck.kf", produces="applicatrion/json; charset=UTF-8")
	public String selectTime(Date reDate) {
		
		System.out.print(reDate);
		reservService.selectTime(reDate);
		
		return "reservation/ReservationListView";
	}
	
	

}
