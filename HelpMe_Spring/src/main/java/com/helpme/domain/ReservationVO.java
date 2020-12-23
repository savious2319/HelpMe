package com.helpme.domain;

import lombok.Data;

@Data
public class ReservationVO {
	private int resNo;
	private String service;
	private String dateCreated;
	private String helperId;
	private int clientNo;
	private String meetingArea;
	private String meetingPlace;
	private String meetingDate;
	private double startTime;
	private double endTime;
	private int pointsSpent;
	private String resStatus;

}
