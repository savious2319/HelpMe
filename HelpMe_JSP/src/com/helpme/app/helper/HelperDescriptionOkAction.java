package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.HelperVO;
import com.helpme.app.helper.vo.Helper_PicsVO;

public class HelperDescriptionOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();
		
		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");

		//만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_profile_description.jsp");

			return forward;
		} else {

			HelperDAO h_dao = new HelperDAO();
			
			//헬퍼이름, 소개글 제목, 소개글, 헬퍼 사진 파일경로를 저장할 변수 초기화
			String name = "";
			String title = "";
			String content = "";
			String fileName = "";
			
			
			for (HelperVO h_vo : h_dao.getHelperDetail(helper_id)) {
				title = h_vo.getIntro_title();
				content = h_vo.getDescription();
				name = h_vo.getName();
			}


			for (Helper_PicsVO hp_vo : h_dao.getPics(helper_id)) {
				fileName = hp_vo.getMain_filename();
			}

			// DB에서 조회한 content의 <br>을 모두 \n으로 수정 후 textarea에 대입
			content = content.replace("<br>", "\n");

			//응답페이지에 전송하기
			request.setAttribute("helperId", helper_id);
			request.setAttribute("helperName", name);
			request.setAttribute("helperIntro", title);
			request.setAttribute("helperDescription", content);
			request.setAttribute("helperPic", fileName);

			forward.setRedirect(false);
			forward.setPath("/helper_profile_description.jsp");

			return forward;
		}
	}
}
