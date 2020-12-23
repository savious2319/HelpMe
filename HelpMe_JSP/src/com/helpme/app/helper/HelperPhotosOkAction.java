package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_PicsVO;

public class HelperPhotosOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();

		HelperDAO h_dao = new HelperDAO();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");

		//만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_profile_photos.jsp");

			return forward;
		} else {

			//헬퍼의 사진을 저장할 변수 초기화
			String main_pic = "", pic1 = "", pic2 = "", pic3 = "", pic4 = "", pic5 = "";

			//DB에 저장된 헬퍼의 사진 파일을 저장한다
			for (Helper_PicsVO hp_vo : h_dao.getPics(helper_id)) {
				main_pic = hp_vo.getMain_filename();
				pic1 = hp_vo.getPic1_filename();
				pic2 = hp_vo.getPic2_filename();
				pic3 = hp_vo.getPic3_filename();
				pic4 = hp_vo.getPic4_filename();
				pic5 = hp_vo.getPic5_filename();
			}
			
			//응답페이지로 전송한다
			request.setAttribute("helperId", helper_id);
			request.setAttribute("main_pic", main_pic);
			request.setAttribute("pic1", pic1);
			request.setAttribute("pic2", pic2);
			request.setAttribute("pic3", pic3);
			request.setAttribute("pic4", pic4);
			request.setAttribute("pic5", pic5);

			forward.setRedirect(false);
			forward.setPath("/helper_profile_photos.jsp");

			return forward;
		}
	}
}
