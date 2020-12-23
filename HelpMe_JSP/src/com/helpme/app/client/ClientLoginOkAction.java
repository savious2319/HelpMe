package com.helpme.app.client;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;

public class ClientLoginOkAction implements Action{

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		//세션 생성
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		
		ClientDAO c_dao = new ClientDAO();
		
		//login.jsp에서 입력한 아이디와 비밀번호를 가져온다.
		String id = request.getParameter("client_id");
		String pw = request.getParameter("client_password");
		
		//ClientDAO로 가서 로그인 메소드 실행
		String s_id = c_dao.login(id, pw);
		//라디오 버튼 -> 고객인지 헬퍼인지
		String radio = request.getParameter("loginAs");
		
		System.out.println("id : "+id);
		System.out.println("password : "+pw);
		System.out.println("loginAs : "+radio);
		
		
		
		System.out.println("ClientLoginOkAction 들어옴");
		System.out.println("client_id : "+s_id);
		
		
		//DB조회시 사용자가 입력한 아이디 및 패스워드가 일치하지 않다면 s_id에 null이 담긴다.
		if(s_id != null) {
			//로그인 성공
			session.setAttribute("session_id", s_id);	//세션에 로그인된 아이디 등록
		
		}else {
			radio = "false";
		}
		
		out.println(radio);
		out.close();
		
		return null;
	}

}
