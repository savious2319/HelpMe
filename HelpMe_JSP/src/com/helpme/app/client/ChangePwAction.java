package com.helpme.app.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;

public class ChangePwAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		ClientDAO c_dao = new ClientDAO();
		
		//findPwChange로부터 아이디와 바꾸려고 하는 비밀번호 가져옴
		String id = request.getParameter("changeId");
		String pw = request.getParameter("changePw");
		String userRandomStr = request.getParameter("userRandomStr");
		HttpSession http_session = request.getSession();
		//비밀번호 바꿀 때 userRandomStr를 null로 만든다. -> 메일의 같은 링크로 또 들어올 수 없도록
		userRandomStr=null;
		
		//제대로 null로 나오는지 확인
		System.out.println("userRandomStr : "+userRandomStr);
		
		//null로 만든 userRandomStr을 세션에 등록. 이로써 똑같은 링크로 다시 이 페이지로 들어로 수 없다. 
		http_session.setAttribute("randomStr", userRandomStr);
		
		//ClientDAO에 있는 비밀번호 바꾸기 메소드로 이동
		c_dao.changePw(id, pw);
		
		//다 끝나면 로그인 페이지로
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/login.jsp");
		
		return forward;
	}

}
