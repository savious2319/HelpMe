package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_CertificateVO;

public class HelperBackgroundOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HelperDAO h_dao = new HelperDAO();

		//만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_profile_background.jsp");

			return forward;
			
		} else {
			
			//헬퍼의 자격증 취득 날짜 형식을 가공하기 위한 작업
			for (Helper_CertificateVO hc_vo : h_dao.getCertificateInfo(helper_id)) {
				if (hc_vo.getDate_obtained() != null) {
					String[] date = hc_vo.getDate_obtained().split(" ");
					hc_vo.setDate_obtained(date[0]);
				}
			}

			//헬퍼의 이력 정보를 응답페이지로 전달하기
			request.setAttribute("helperId", helper_id);
			request.setAttribute("helperEducation", h_dao.getEducation(helper_id));
			request.setAttribute("helperWork", h_dao.getWork(helper_id));
			request.setAttribute("helperCertificate", h_dao.getCertificateInfo(helper_id));

			forward.setRedirect(false);
			forward.setPath("/helper_profile_background.jsp");

			return forward;
		}
	}
}
