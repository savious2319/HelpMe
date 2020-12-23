package com.helpme.app.helper.vo;

public class Helper_LanguagesVO {
	String helper_id;
	String level;
	String language;
	
	public Helper_LanguagesVO() {;}

	
	
	public Helper_LanguagesVO(String helper_id, String level, String language) {
		super();
		this.helper_id = helper_id;
		this.level = level;
		this.language = language;
	}



	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
	
}
