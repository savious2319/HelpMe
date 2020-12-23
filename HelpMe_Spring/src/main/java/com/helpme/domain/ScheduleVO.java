package com.helpme.domain;

import lombok.Data;

@Data
public class ScheduleVO {
	private String helperId;
	private double startTime;
	private double endTime;
	private int availDay;
	
	public ScheduleVO() {;}
	
	public ScheduleVO(String helperId, double startTime, double endTime, int availDay) {
		super();
		this.helperId = helperId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.availDay = availDay;
	}
	
	
}
