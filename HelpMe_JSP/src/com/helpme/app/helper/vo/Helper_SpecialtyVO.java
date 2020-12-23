package com.helpme.app.helper.vo;

public class Helper_SpecialtyVO {
	int specialty_no;
	String helper_id;
	String specialized_field;
	
	public Helper_SpecialtyVO() {;}

	
	
	public Helper_SpecialtyVO(String helper_id, String specialized_field) {
		super();
		this.helper_id = helper_id;
		this.specialized_field = specialized_field;
	}



	public int getSpecialty_no() {
		return specialty_no;
	}

	public void setSpecialty_no(int specialty_no) {
		this.specialty_no = specialty_no;
	}

	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public String getSpecialized_field() {
		return specialized_field;
	}

	public void setSpecialized_field(String specialized_field) {
		this.specialized_field = specialized_field;
	}
	
	
}
