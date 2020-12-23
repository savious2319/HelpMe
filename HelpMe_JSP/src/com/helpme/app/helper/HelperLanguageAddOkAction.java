package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_LanguagesVO;

public class HelperLanguageAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//새로 선택한 언어와 레벨 전달 받기
		String language = request.getParameter("language");
		String level = request.getParameter("level");
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//생성자를 통해 헬퍼의 언어와 레벨를 저장한다
		Helper_LanguagesVO hl_vo = new Helper_LanguagesVO(helper_id, level, language);
		
		HelperDAO h_dao = new HelperDAO();
		
		//언어와 레벨를 저장한다
		h_dao.insertLanguage(hl_vo);
		
		
		return null;
	}

}
