package com.kh.korea.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	@GetMapping("rsvcheck.kf")
	public String kfreservcheck() {
		
		return "reservation/ReservationListView";
	}
	
	

}
