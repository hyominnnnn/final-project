package com.kh.korea.game.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @NoArgsConstructor @ToString
public class MiddleGame {
	
	private int quizNo;
	private String quizContent;
	private String firstChoice;
	private String secondChoice;
	private int correct;
	private String status;
	private int levelNo;

}
