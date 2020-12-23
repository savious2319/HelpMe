package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_WorkVO;

public class HelperWorkAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//새로 작성한 경력, 시작 연도, 끝 연도를 전달 받는다
		String position = request.getParameter("position");
		int startYear = Integer.parseInt(request.getParameter("startYear"));
		int endYear = Integer.parseInt(request.getParameter("endYear"));
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//생성자를 통해 헬퍼의 경력, 시작 연도, 끝 연도를 저장한다
		Helper_WorkVO hw_vo = new Helper_WorkVO(helper_id, position, startYear, endYear);
		
		HelperDAO h_dao = new HelperDAO();
		
		//경력을 저장한다
		h_dao.insertWork(hw_vo);
		
		
		return null;
	}

}
