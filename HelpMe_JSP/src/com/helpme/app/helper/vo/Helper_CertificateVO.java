package com.helpme.app.helper.vo;

public class Helper_CertificateVO {
	String helper_id;
	String certificate;
	String date_obtained;
	
	public Helper_CertificateVO() {;}

	
	public Helper_CertificateVO(String helper_id, String certificate, String date_obtained) {
		super();
		this.helper_id = helper_id;
		this.certificate = certificate;
		this.date_obtained = date_obtained;
	}


	public String getHelper_id() {
		return helper_id;
	}

	public void setHelper_id(String helper_id) {
		this.helper_id = helper_id;
	}

	public String getCertificate() {
		return certificate;
	}

	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}

	public String getDate_obtained() {
		return date_obtained;
	}

	public void setDate_obtained(String date_obtained) {
		this.date_obtained = date_obtained;
	}
	
	
}
