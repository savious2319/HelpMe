package com.helpme.app.helper;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperSetAsMainPhotoOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html; charset=UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		HelperDAO h_dao = new HelperDAO();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//<img> id값 전달 받기
		String picId = request.getParameter("picId");
		
		//메인 사진으로 변경할 <img> src값 전달 받기
		String picSrc = request.getParameter("picSrc");
		
		//메인 사진 src 전달 받기
		String mainSrc = request.getParameter("mainSrc");

		// mainSrc : /images/sky/sky1.jpg
		// picSrc : /images/sky/KakaoTalk_20201113_1425041571.jpg
		
		// 앞에 / 잘라내기
		picSrc = picSrc.substring(1);
		mainSrc = mainSrc.substring(1);
		
		//선택한 사진을 메인 사진으로 업데이트하기
		h_dao.updateMainPic(helper_id, picSrc);
		
		//선택한 사진이 있는 <img>에 메인 사진파일 경로 저장하기
		switch(picId) {
		case "pic1": h_dao.updatePic1(helper_id, mainSrc);break;
		case "pic2": h_dao.updatePic2(helper_id, mainSrc);break;
		case "pic3": h_dao.updatePic3(helper_id, mainSrc);break;
		case "pic4": h_dao.updatePic4(helper_id, mainSrc);break;
		case "pic5": h_dao.updatePic5(helper_id, mainSrc);break;
		}
		
		//data에 ajax로 전송할 <img> id값, 메인 사진으로 바꿀 파일이름, 메인 파일이름을 저장한다
		String data = picId+","+picSrc+","+mainSrc;
		
		//ajax로 data를 전송해 해당 jsp에서 바뀐 사진을 보여준다
		out.println(data);
		out.close();
		
		return null;
	}

}
