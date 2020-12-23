package com.helpme.app.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.ActionForward;
import com.helpme.app.helper.HelperBackgroundOkAction;

public class ClientFrontController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//요청한 URI
		String requestURL = req.getRequestURI();
		
		//반복되는 기본 경로(www.naver.com, board_mv2 등)
		String contextPath = req.getContextPath();
		
		//요청한 URI에서 반복되는 기본 경로를 제외한 경로(사용자 요청 종류를 확인할 수 있다)
		String command = requestURL.substring(contextPath.length());
		
		//전송방식, 응답경로가 선언된 클래스
		ActionForward forward = null;
		
		//분기처리(사용자의 요청에 맞는 응답을 위함)
		switch(command) {
		case "/client/ClientJoin.cl": //회원가입 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/signup.jsp");
			break;
			
		case "/client/ClientJoinOk.cl": //회원가입 완료 버튼 클릭 시
			try {
				forward = new ClientJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientCheckIdOk.cl" : //회원가입 시 아이디 중복체크
			try {
				forward = new ClientCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientLoginOk.cl": //로그인 버튼 클릭 시 
			try {
				forward = new ClientLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientLogin.cl": // 로그인 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/login.jsp");
			break;
			
		case "/client/ClientLogOut.cl": // 로그아웃 할 때
			try {
				forward = new ClientLogOutAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		case "/client/ClientReservationOk.cl": // 고객 마이 페이지의 My Reservation
			try {
				forward = new ClientReservationOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientPointsOk.cl": // 고객 마이 페이지의 My Points
			try {
				forward = new ClientPointsOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "/client/ClientUpdatePasswordOk.cl": // 고객 페워드워 수정
			try {
				forward = new ClientUpdatePasswordOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientUpdateEmailOk.cl": // 고객 이메일 수정
			try {
				forward = new ClientUpdateEmailOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientUpdatePhoneNumberOk.cl": // 고객 핸드폰 번호 수정
			try {
				forward = new ClientUpdatePhoneNumberOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ClientDeleteAccountOk.cl": // 고객 계정 삭제
			try {
				forward = new ClientDeleteAccountOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		//최명기
		case "/client/FindId.cl":
			try {
				forward = new FindIdAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/FindPassword.cl":
			try {
				forward = new FindPasswordAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/client/ChangePw.cl":
			try {
				forward = new ChangePwAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		default: //비정상적인 경로일 경우(잘못된 경로일 경우)
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/404.jsp");
		}
		
		//forward가 null이 아니라면, 응답을 이 곳에서 처리하겠다는 의미이다.
		if(forward != null) {
			if(forward.isRedirect()) {
				//전송방식이 redirect일 경우
				resp.sendRedirect(forward.getPath());
			}else {
				//전송방식이 forward일 경우
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}
