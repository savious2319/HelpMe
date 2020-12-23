package com.helpme.app.helper.vo;

public class Helper_WorkVO {
	String helper_id;
	String work_experience;
	int work_startyear;
	int work_endyear;
	
	public Helper_WorkVO() {;}

	
	
	public Helper_WorkVO(String helper_id, String work_experience, int work_startyear, int work_endyear) {
		super();
		this.helper_id = helper_id;
		this.work_experience = work_experience;
		this.work_startyear = work_startyear;
		this.work_endyear = work_endyear;
	}



	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public String getWork_experience() {
		return work_experience;
	}

	public void setWork_experience(String work_experience) {
		this.work_experience = work_experience;
	}

	public int getWork_startyear() {
		return work_startyear;
	}

	public void setWork_startyear(int work_startyear) {
		this.work_startyear = work_startyear;
	}

	public int getWork_endyear() {
		return work_endyear;
	}

	public void setWork_endyear(int work_endyear) {
		this.work_endyear = work_endyear;
	}
	
	
}
