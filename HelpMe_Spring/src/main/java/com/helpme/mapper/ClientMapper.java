package com.helpme.mapper;

import java.util.HashMap;
import java.util.List;

import com.helpme.domain.ClientVO;

public interface ClientMapper {
	
	//고객 회원 가입
	public int signup(ClientVO client);

	//고객 아이디 중복 체크
	public int checkId(String client_id);

	//고객 로그인
	public String login(HashMap<String, String> data);

	//고객 아이디로 모든 정보 조회
	public List<ClientVO> getDetailById(String client_id);

	//고객 번호로 모든 정보 조회
	public List<ClientVO> getDetailByNum(int client_no);

	//고객 번호 조회
	public int getClientNo(String client_name);

	//고객 이름으로 이름 조회
	public String getClientNameByName(String client_name);

	//고객 이름 조회
	public String getClientName(int client_no);

	//고객 비밀번호 수정
	public int updatePw(ClientVO client);

	//고객 이메일 수정
	public int updateEmail(ClientVO client);

	//고객 핸드폰 번호 수정
	public int updatePhoneNumber(ClientVO client);

	//고객 계정 삭제
	public int deleteAccount(int client_no);

	//고객 아이디 찾기
	public String findId(HashMap<String, String> data);

	//고객 비밀번호 찾기
	public String findPw(HashMap<String, String> data);
	
	//고객 비밀번호 변경
	public int changePw(HashMap<String, String> data);

	//고객이 이미 등록되어 있는지 판단
	public int memberCheck(HashMap<String, String> data);
}
