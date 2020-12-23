package com.helpme.app.schedule.vo;

public class ScheduleVO {
	private String helper_id;
	private double start_time;
	private double end_time;
	private int avail_day;
	
	public ScheduleVO() {;}
	
	public ScheduleVO(String helper_id, double start_time, double end_time, int avail_day) {
		this.helper_id = helper_id;
		this.start_time = start_time;
		this.end_time = end_time;
		this.avail_day = avail_day;
	}

	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public double getStart_time() {
		return start_time;
	}

	public void setStart_time(double start_time) {
		this.start_time = start_time;
	}

	public double getEnd_time() {
		return end_time;
	}

	public void setEnd_time(double end_time) {
		this.end_time = end_time;
	}

	public int getAvail_day() {
		return avail_day;
	}

	public void setAvail_day(int avail_day) {
		this.avail_day = avail_day;
	}
	
	
}
