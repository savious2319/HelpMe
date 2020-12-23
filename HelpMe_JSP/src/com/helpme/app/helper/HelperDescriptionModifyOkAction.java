package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperDescriptionModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HelperDAO h_dao = new HelperDAO();
		
		//새로 수정한 소개글 제목과 소개글 전달 받기
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//소개글 제목, 소개글 업데이트 하기
		h_dao.updateDescription(helper_id, title, content);
		
		return null;
	}

}
