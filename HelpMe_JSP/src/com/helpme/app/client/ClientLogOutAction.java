package com.helpme.app.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;

public class ClientLogOutAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		System.out.println("ClientLogOutAction 들어옴");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		//세션을 지운다 -> 세선에 저장된 s_id도 지워진다.
		session.invalidate();
		
		//로그아웃이 끝나면 main_Default.jsp로 이동
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/main_Default.jsp");
		
		return forward;
	}

}
