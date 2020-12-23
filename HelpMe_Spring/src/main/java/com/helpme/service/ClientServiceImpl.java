package com.helpme.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helpme.domain.ClientVO;
import com.helpme.mapper.ClientMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service	// 서비스 객체임을 표시
@AllArgsConstructor	// 모든 파라미터를 이용하는 생성자를 선언
public class ClientServiceImpl implements ClientService {

	@Setter(onMethod_ = @Autowired)
	private ClientMapper mapper;
	
	@Override
	public boolean signup(ClientVO client) {
		log.info("signup : " +client);
		if(mapper.signup(client) == 1) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean checkId(String client_id) {
		log.info("checkId : " +client_id);
		if(mapper.checkId(client_id) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public String login(HashMap<String, String> data) {
		log.info("login : " + data);
		return mapper.login(data);
	}

	@Override
	public List<ClientVO> getDetailById(String client_id) {
		log.info("getDetailById : " + client_id);
		return mapper.getDetailById(client_id);
	}

	@Override
	public List<ClientVO> getDetailByNum(int client_no) {
		log.info("getDetailByNum : " + client_no);
		return mapper.getDetailByNum(client_no);
	}

	@Override
	public int getClientNo(String client_name) {
		log.info("getClientNo : " + client_name);
		return mapper.getClientNo(client_name);
	}

	@Override
	public boolean getClientNameByName(String client_name) {
		log.info("getClientNameByName : " + client_name);
		
		if(mapper.getClientNameByName(client_name) == null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public String getClientName(int client_no) {
		log.info("getClientName : " + client_no);
		return mapper.getClientName(client_no);
	}

	@Override
	public int updatePw(ClientVO client) {
		log.info("updatePw : " + client);
		return mapper.updatePw(client);
	}

	@Override
	public int updateEmail(ClientVO client) {
		log.info("updateEmail : " + client);
		return mapper.updateEmail(client);
	}

	@Override
	public int updatePhoneNumber(ClientVO client) {
		log.info("updatePhoneNumber : " + client);
		return mapper.updatePhoneNumber(client);
	}

//	@Override
//	public int updates(ClientVO client) {
//		log.info("updates : " + client);
//		
//		return mapper.updates(client);
//	}
	
	@Override
	public int deleteAccount(int client_no) {
		log.info("deleteAccount : " + client_no);
		return mapper.deleteAccount(client_no);
	}

	@Override
	public String findId(HashMap<String, String> data) {
		log.info("findId : " + data);
		return mapper.findId(data);
	}

	@Override
	public String findPw(HashMap<String, String> data) {
		log.info("findPw : " + data);
		return mapper.findPw(data);
	}

	@Override
	public int changePw(HashMap<String, String> data) {
		log.info("changePw : " + data);
		return mapper.changePw(data);
	}

	@Override
	public boolean memberCheck(HashMap<String, String> data) {
		log.info("memberCheck : " + data);
		if(mapper.memberCheck(data) == 1) {
			return false;
		}else {
			return true;
		}
	}

}
