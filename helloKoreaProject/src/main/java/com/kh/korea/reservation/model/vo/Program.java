package com.kh.korea.reservation.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class Program {
	
	private int proNo;
	private String proName;
	private String proDe;
	private int price;
	private String category;
	
	

}
