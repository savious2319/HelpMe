package com.helpme.app.helper;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");

		HelperDAO h_dao = new HelperDAO();
		
		//세션을 가져온다
		HttpSession session = request.getSession();
		
		//헬퍼가 로그인했을 때 아이디, 패스워드, loginAs(헬퍼인지 고객인지 판별)를 전달 받는다
		String id = request.getParameter("helper_id");
		String pw = request.getParameter("helper_password");
		String radio = request.getParameter("loginAs");
		
		//로그인이 성공하면 헬퍼 아이디가 리턴된다
		String helper_id = h_dao.helperLogin(id, pw);
		
		if (helper_id != null) {
			//만약 아이디가 널이 아니면 세션에 로그인된 아이디를 등록한다
			session.setAttribute("session_id", helper_id);
		}else {
			//만약 아이디가 널이면 false 문자를 값에 저장한다
			radio = "false";
		}
		
		//로그인 성공/실패 판별을 하기위해 ajax로 radio값을 전송한다
		out.println(radio);
		out.close();
		
		return null;
	}

}
