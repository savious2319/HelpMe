package com.helpme.app.client.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.helpme.app.client.vo.ClientVO;
import com.helpme.mybatis.config.SqlMapConfig;

public class ClientDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;

	public ClientDAO() {
		sqlsession = sessionf.openSession(true);
	}

	// 회원가입
	public boolean signup(ClientVO client) {
		// 외부에서 입력한 정보를 DB에 입력
		if (sqlsession.insert("Client.signup", client) == 1) {
			return true;
		}
		return false;
	}

	// 아이디 중복검사
	public boolean checkId(String id) {
		// 아이디를 DB에서 조회하여 중복되는 아이디가 있는지 확인한다.
		if ((Integer) sqlsession.selectOne("Client.checkId", id) == 1) {
			// 중복되는 아이디가 있을 때
			return true;
		}
		// 중복이 없을 때
		return false;
	}

	// 로그인
	public String login(String id, String pw) {
		System.out.println("ClientDAO 로그인 함수 들어옴.");
		HashMap<String, String> dataMap = new HashMap<>();
		dataMap.put("client_id", id);
		dataMap.put("client_password", pw);

		// DB 조회시 아이디와 비밀번호가 일치하면 해당 아이디를 리턴(세션에 넘기기 위해)
		return (String) sqlsession.selectOne("Client.login", dataMap);
	}

	//고객 id로 고객정보 가지고 오기
	public List<ClientVO> getDetailById(String client_id){
		
		return sqlsession.selectList("Client.getDetailById", client_id);
	}
	
	//고객 number로 고객정보 가지고 오기
	public List<ClientVO> getDetailByNum(int client_no){
		
		return sqlsession.selectList("Client.getDetailByNum", client_no);
	}
	
	// 고객번호 가지고 오기
	public int getClientNo(String client_name) {
		return (Integer) sqlsession.selectOne("Client.getClientNo", client_name);
	}
	
	// 헬퍼가 입력한 고객이름으로 데이터의 고객 이름 가지고 오기
	public boolean getClientNameByString(String client_name) {
		
		if(sqlsession.selectOne("Client.getClientNameByName", client_name) == null) {
			return false;
		}
		return true;
	}
	
	// 고객이름 가지고 오기
	public String getClientName(int client_no) {
		return (String) sqlsession.selectOne("Client.getClientName", client_no);
	}
	
	//비밀번호 수정
	public void updatePassword(String client_id, String password) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("client_id", client_id);
		data.put("password", password);
		
		sqlsession.update("Client.updatePw", data);
	}
	
	//이메일 수정
	public void updateEmail(String client_id, String email) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("client_id", client_id);
		data.put("email", email);
		
		sqlsession.update("Client.updateEmail", data);
	}
	
	//핸드폰 번호 수정
	public void updatePhoneNumber(String client_id, String phone) {
		HashMap<String, String> data = new HashMap<>();
		
		data.put("client_id", client_id);
		data.put("phone", phone);
		
		sqlsession.update("Client.updatePhoneNumber", data);
	}
	
	
	//고객 계정 삭제
	public void deleteAccount(int client_no) {
		
		sqlsession.delete("Client.deleteAccount", client_no);
	}
	
	//고객이 평점 매긴 헬퍼의 카운트 값 저장
	public void insertHelperRateCnt(String helper_id, int client_no) {
		HashMap<String, Object> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("client_no", client_no);
		
		sqlsession.insert("Rating.insertCnt", data);
		
	}
	
	
	//고객이 평점 매긴 헬퍼의 카운트 값 업데이트
	public void updateHelperRateCnt(String helper_id, int client_no) {
		HashMap<String, Object> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("client_no", client_no);
		
		sqlsession.update("Rating.updateCnt", data);
	}
	
	//헬퍼마다 평점 매긴 카운트 값 가져오기
	public Object getHelperRateCnt(String helper_id, int client_no) {
		HashMap<String, Object> data = new HashMap<>();
		
		data.put("helper_id", helper_id);
		data.put("client_no", client_no);
		
		Object rate_cnt = sqlsession.selectOne("Rating.getCnt", data);
		
		if(sqlsession.selectOne("Rating.getCnt", data) == null) {
			rate_cnt = null; 
		}
				
		return rate_cnt;
	}
	
	
	
	//아이디 찾기
	   public String findId(String name, String email){
	      HashMap<String, String> fIdMap = new HashMap<>();
	      
	      fIdMap.put("client_name", name);
	      fIdMap.put("client_email", email);
	      
	      //DB 조회할 때 이름하고 이메일이 일치하면 해당 아이디를 리턴
	      String fId = (String)sqlsession.selectOne("Client.findId", fIdMap);
	      
	      return fId;
	   }
	   
	   //비밀번호 찾기
	   public String findPw(String id, String email){
		   HashMap<String, String> fPwMap = new HashMap<>();
		   
		   
		   fPwMap.put("client_id", id);
		   fPwMap.put("client_email", email);
		   
		   String fPw = (String)sqlsession.selectOne("Client.findPw", fPwMap);
		   
		   return fPw;
	   }
	   
	   //비밀번호 변경
	   public void changePw(String id, String pw) {
		   HashMap<String, String> chPwMap = new HashMap<>();
		   
		   chPwMap.put("client_id", id);
		   chPwMap.put("client_password", pw);
		   
		   sqlsession.update("Client.changePw", chPwMap);
	   }
	   
	   //이름, 이메일 중복
	   public int memberCheck(String client_name, String client_email) {
		   HashMap<String, String> data = new HashMap<>();
		   
		   data.put("client_name", client_name);
		   data.put("client_email", client_email);
		   
		   return sqlsession.selectOne("Client.memberCheck", data);
	   }
	
}
