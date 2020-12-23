package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperChangePasswordOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		//새로 작성한 패스워드를 전달 받는다
		String password = request.getParameter("password");
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HelperDAO h_dao = new HelperDAO();
		
		//패스워드를 업데이트 한다
		h_dao.updatePassword(helper_id, password);
		
		return null;
	}

}
