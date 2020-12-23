package com.helpme.app.reservation;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.ActionForward;

public class ReservationFrontController extends HttpServlet{

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
		case "/reservation/MakeReservationOk.rs": // 헬퍼가 고객의 예약을 신청할 때
			try {
				forward = new MakeReservationOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		case "/reservation/DeleteReservationOk.rs": //고객의 예약을 삭제할 때
			try {
				forward = new DeleteReservationOkAction().execute(req, resp);
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
