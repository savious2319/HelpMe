package com.helpme.domain;

import lombok.Data;

@Data
public class ClientVO {
	private int clientNo;
	private String clientId;
	private String password;
	private String name;
	private String email;
	private String country;
	private String address;
	private String phoneNumber;
	private int availablePoints;
	private int cancelCnt;
	

}
