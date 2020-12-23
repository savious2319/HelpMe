package com.helpme.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.helpme.domain.ClientVO;
import com.helpme.service.ClientService;
import com.helpme.service.HelperService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/client/")
@RestController
@AllArgsConstructor
@Log4j
public class ClientController {

	private ClientService client_service;
	private HelperService helper_service;
	
	//고객 회원가입
	//브라우저에서 JSON 타입으로 데이터를 전송하고 서버에서는 댓글의 처리 결과에 따라 문자열로 결과를 리턴한다.
	//consumes와 produces를 통해서 JSON방식의 데이터만 처리하도록 한다.
	@PostMapping(value="/join", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	//@RequestBody를 적용하여 JSON데이터를 어노테이션 뒤에 타입으로 변환하도록 지정한다.
	public ResponseEntity<String> join(@RequestBody ClientVO client){
		//ResponseEntity : 서버의 상태코드, 응답 메세지 등을 담을 수 있는 타입
		
		log.info("join : " + client);
		
		HashMap<String, String> data = new HashMap<>();
		data.put("client_name", client.getName());
		data.put("client_email", client.getEmail());
		
		//고객이 이미 DB에 등록되어 있으면 계정이 존재한다는 메세지 전달
		if(!client_service.memberCheck(data)) {
			log.info("account exists");
			return new ResponseEntity<>("accountExists", HttpStatus.OK);
		}
		else if(!client_service.signup(client)) {
			log.info("signup failed");
			//회원가입 문제가 발생하면 전송하는 메세지
			return new ResponseEntity<>("signupFailed", HttpStatus.OK);
		}
		
		//회원 가입 성공 시 보내는 메세지
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	//아이디 중복 체크
	@GetMapping(value="/checkId", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> checkId(@RequestParam("client_id") String id){
		
		String result = "";
		
		 if(client_service.checkId(id) || helper_service.checkId(id)) {
	         //중복
	         result = "not-ok";
	      }else {
	         //중복 안 됨
	         result = "ok";
	      }
		 
		 return new ResponseEntity<>(result, HttpStatus.OK);
	}
	
	//고객 로그인
	@GetMapping(value="/login/{clientId}/{clientPassword}/{loginAs}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> login(HttpServletRequest request, @PathVariable("clientId") String clientId, 
			@PathVariable("clientPassword") String clientPassword, @PathVariable("loginAs") String loginAs){
		
		HttpSession session = request.getSession();
		
		log.info("clientId : " + clientId);
		log.info("clientPassword : " + clientPassword);
		log.info("loginAs : " + loginAs);
		
		HashMap<String, String> data = new HashMap<>();
		data.put("client_id", clientId);
		data.put("client_password", clientPassword);
		
		String session_id = client_service.login(data);
		
		if(session_id != null) {
			//로그인 성공시 세션에 아이디 저장
			log.info("session_id : " + session_id);
			session.setAttribute("session_id", session_id);
		}else {
			//로그인 실패 전송할 메세지
			loginAs = "false";
		}
		
		return new ResponseEntity<>(loginAs, HttpStatus.OK);
	}
	
	//고객 정보 업데이트
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/updates/{clientId}", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updates(@RequestBody ClientVO client, @PathVariable("clientId") String clientId){
		client.setClientId(clientId);
		
		int result = 0;
		
		log.info("clientId : " + clientId);
		log.info("updates : " + client);
		
		//변경된 비밀번호가 있다면 DB에서 업데이트함
		if(client.getPassword() != null) {
			result = client_service.updatePw(client);
		}
		//변경된 이메일이 있다면 DB에서 업데이트함
		if(client.getEmail() != null) {
			result = client_service.updateEmail(client);
		}
		//변경된 핸드폰 번호가 있다면 DB에서 업데이트함
		if(client.getPhoneNumber() != null) {
			result = client_service.updatePhoneNumber(client);
		}
		
		//변경된게 무조건 있으면 result는 1이다. 
		return result == 1 ? new ResponseEntity<>("success", HttpStatus.OK) :
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	//고객 계정 삭제
	@DeleteMapping(value="/deleteAccount", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteAccount(HttpServletRequest request){
		log.info("deleteAccount");
		
		String client_id = (String) request.getSession().getAttribute("session_id");
		int client_no = 0;
				
		for (ClientVO c_vo : client_service.getDetailById(client_id)) {
			client_no = c_vo.getClientNo();
		}
		
		
		int resultNum = client_service.deleteAccount(client_no);
		
		//세션에 있는 데이터 전체 삭제
		HttpSession session = request.getSession();
		session.invalidate();
		
		return resultNum == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	
	
}
