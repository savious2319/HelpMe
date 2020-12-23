package com.helpme.app.schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.ActionForward;


public class ScheduleFrontController extends HttpServlet{

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
		case "/schedule/HelperScheduleOk.sc": //헬퍼 마이 페이지 My Schedule로 이동할 때
			try {
				forward = new HelperScheduleOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/schedule/HelperScheduleChangeOk.sc": //헬퍼의 스케줄을 수정할 때
			try {
				forward = new HelperScheduleChangeOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/schedule/HelperScheduleAddOk.sc": //헬퍼의 스케줄을 추가할 때
			try {
				forward = new HelperScheduleAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/schedule/HelperScheduleDeleteOk.sc": //헬퍼의 스케줄을 삭제할 때
			try {
				forward = new HelperScheduleDeleteOkAction().execute(req, resp);
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
