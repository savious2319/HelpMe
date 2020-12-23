package com.helpme.app.helper.vo;

public class Helper_EducationVO {
	String helper_id;
	String education;
	int graduate_year;
	
	public Helper_EducationVO() {;}
	
	
	
	public Helper_EducationVO(String helper_id, String education, int graduate_year) {
		super();
		this.helper_id = helper_id;
		this.education = education;
		this.graduate_year = graduate_year;
	}



	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public int getGraduate_year() {
		return graduate_year;
	}

	public void setGraduate_year(int graduate_year) {
		this.graduate_year = graduate_year;
	}
	
	
}
