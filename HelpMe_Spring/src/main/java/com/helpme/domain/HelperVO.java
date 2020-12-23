package com.helpme.domain;

import lombok.Data;

@Data
public class HelperVO {
	private String helperId;
	private String password;
	private String name;
	private String country;
	private String email;
	private int basicPay;
	private int fare;
	private double avgRating;
	private int ratingCnt;
	private int totalRating;
	private String helpLocation;
	private String kakaoUrl;
	private String introTitle;
	private String description;
	private String flagUrl;
	
}
