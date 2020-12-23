package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ClientVO;

public interface ClientService {

	public boolean signup(ClientVO client);

	public boolean checkId(String client_id);

	public String login(HashMap<String, String> data);

	public List<ClientVO> getDetailById(String client_id);

	public List<ClientVO> getDetailByNum(int client_no);

	public int getClientNo(String client_name);

	public boolean getClientNameByName(String client_name);

	public String getClientName(int client_no);

	public int updatePw(ClientVO client);

	public int updateEmail(ClientVO client);

	public int updatePhoneNumber(ClientVO client);

//	public int updates(ClientVO client);
	
	public int deleteAccount(int client_no);

	public String findId(HashMap<String, String> data);

	public String findPw(HashMap<String, String> data);
	
	public int changePw(HashMap<String, String> data);

	public boolean memberCheck(HashMap<String, String> data);
}
