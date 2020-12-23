package com.helpme.app.client;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;

public class FindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");	//response도 필요한지는 모르겠지만 혹시 모르니까.
		
		ActionForward forward = new ActionForward();
		ClientDAO c_dao = new ClientDAO();
		//findId.jsp로부터 입력받은 이름과 이메일을 저장
		String name = request.getParameter("fIdName");
		String email = request.getParameter("fIdEmail");

		response.setContentType("text/html;charset=utf-8");
		
		//ClientDAO에 있는 아이디 찾기 메소드로 이름과 이메일을 보낸다.
		String id = (String)c_dao.findId(name, email);
		
		String msg = "Find your ID.";
		
		if(id!=null) {
			//아이디를 찾았을 경우
			msg="Your ID is ["+id+"]";
		}else {
			//아이디를 찾지 못했을 경우
			msg="Please check your name or email.";
		}
		//msg를 request에 등록 -> el문 ${msg}로 메세지를 가져올 수 있다.
		request.setAttribute("msg", msg);
		
		//
		forward.setRedirect(false);
		forward.setPath("/idCheck.jsp");
		
		return forward;
	}

}
