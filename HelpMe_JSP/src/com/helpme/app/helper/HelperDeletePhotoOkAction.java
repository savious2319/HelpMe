package com.helpme.app.helper;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperDeletePhotoOkAction implements Action {

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
				
		//삭제될 사진파일의 서버 경로
		String deleteFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT";
		
		//삭제할 <img> id값 전달 받기
		String picId = request.getParameter("picId");
		
		//삭제할 <img> src값 전달 받기
		String picSrc = request.getParameter("picSrc");
		
		//삭제한 이후 대체할 이미지 파일명 전달 받기
		String emptyPic = request.getParameter("emptyPic");
		
		//해당 헬퍼 DB에 저장할 emptyPic 가공하는 작업
		String [] emptyPicSplit = emptyPic.split("/");
		emptyPic = emptyPicSplit[0] + "/" + helper_id + "/" + emptyPicSplit[1];
		
		//switch문을 통해 해당 DB의 emptyPic으로 변경하기 
		switch(picId) {
		case "pic1": h_dao.updatePic1(helper_id, emptyPic);break;
		case "pic2": h_dao.updatePic2(helper_id, emptyPic);break;
		case "pic3": h_dao.updatePic3(helper_id, emptyPic);break;
		case "pic4": h_dao.updatePic4(helper_id, emptyPic);break;
		case "pic5": h_dao.updatePic5(helper_id, emptyPic);break;
		}
		
		// 삭제할 사진파일을 제거한다
		File f = new File(deleteFolder + picSrc);
		if (f.exists()) {
			f.delete();
		}
		
		//data에 ajax로 전송할 <img> id값과 파일이름을 저장한다
		String data = picId + "," + emptyPic;
		
		//ajax로 data를 전송해 해당 jsp에서 해당 사진을 emptyPic으로 바꾼다
		out.println(data);
		out.close();
		
		return null;
	}

}
