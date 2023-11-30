package com.kh.korea.game.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class UserBadge {
	
	private int memberNo;
	private int badgeNo;
	private Date badgeDate;
	private String badgeName;
	private String imgPath;

}
