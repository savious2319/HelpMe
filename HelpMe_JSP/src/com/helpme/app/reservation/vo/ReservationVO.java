package com.helpme.app.reservation.vo;

public class ReservationVO {
	private int res_no;
	private String service;
	private String date_created;
	private String helper_id;
	private int client_no;
	private String meeting_area;
	private String meeting_place;
	private String meeting_date;
	private double start_time;
	private double end_time;
	private int points_spent;
	private String res_status;

	public ReservationVO() {;}


	public ReservationVO(String service, String helper_id, int client_no, String meeting_area, String meeting_place,
			String meeting_date, double start_time, double end_time, int points_spent) {
		super();
		this.service = service;
		this.helper_id = helper_id;
		this.client_no = client_no;
		this.meeting_area = meeting_area;
		this.meeting_place = meeting_place;
		this.meeting_date = meeting_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.points_spent = points_spent;
	}



	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getDate_created() {
		return date_created;
	}

	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}

	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public String getMeeting_area() {
		return meeting_area;
	}

	public void setMeeting_area(String meeting_area) {
		this.meeting_area = meeting_area;
	}

	public String getMeeting_place() {
		return meeting_place;
	}

	public void setMeeting_place(String meeting_place) {
		this.meeting_place = meeting_place;
	}

	
	
	public String getMeeting_date() {
		return meeting_date;
	}



	public void setMeeting_date(String meeting_date) {
		this.meeting_date = meeting_date;
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

	public int getPoints_spent() {
		return points_spent;
	}

	public void setPoints_spent(int points_spent) {
		this.points_spent = points_spent;
	}

	public String getRes_status() {
		return res_status;
	}

	public void setRes_status(String res_status) {
		this.res_status = res_status;
	}
	
	

}
