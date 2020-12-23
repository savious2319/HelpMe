package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_EducationVO;

public class HelperEducationAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//새로 작성한 학력과 졸업연도를 전달받는다
		String education = request.getParameter("inst_name");
		int gradYear = Integer.parseInt(request.getParameter("grad_year"));
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//생성자를 통해 헬퍼의 학력과 졸업연도를 저장한다
		Helper_EducationVO he_vo = new Helper_EducationVO(helper_id, education, gradYear);
		
		HelperDAO h_dao = new HelperDAO();
		
		//학력과 졸업연도를 저장한다
		h_dao.insertEducation(he_vo);
		
		
		return null;
	}

}
