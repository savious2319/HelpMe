package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_SpecialtyVO;

public class HelperSpecialtyAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//새로 선택한 서비스 이름 전달 받기
		String service = request.getParameter("addSpecialty");
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//생성자를 통해 서비스 이름을 저장한다
		Helper_SpecialtyVO hs_vo = new Helper_SpecialtyVO(helper_id, service);
		
		HelperDAO h_dao = new HelperDAO();
		
		//서비스 이름을 저장한다
		h_dao.insertSpecialty(hs_vo);
		
		return null;
	}

}
