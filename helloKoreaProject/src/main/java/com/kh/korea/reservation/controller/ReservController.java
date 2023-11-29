package com.kh.korea.reservation.controller;

import java.sql.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservController {
	
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
	public String kfreservcheck(Date reDate) {
		
		System.out.print(reDate);
		return "reservation/ReservationListView";
	}
	
	

}
