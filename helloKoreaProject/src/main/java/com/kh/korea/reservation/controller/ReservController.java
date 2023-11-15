package com.kh.korea.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservController {
	
	@GetMapping("list.kf")
	public String kfReservList() {
		return "reservation/KoreanFoodFrontView";
	}

}
