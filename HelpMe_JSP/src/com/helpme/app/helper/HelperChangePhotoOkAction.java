package com.helpme.app.helper;

import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HelperChangePhotoOkAction implements Action {

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
		
		//사진파일이 저장될 서버 경로
		String saveFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT/images/"+helper_id;
		
		//삭제될 사진파일의 서버 경로
		String deleteFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT"; 
		
		// 첨부 파일의 크기 설정
		int fileSize = 5 * 1024 * 1024; // 5Mega

		// 메일 서버 객체(파일 업로드 및 다운로드) 선언
		MultipartRequest multi = null;

		// DefaultFileRenamePolicy : 파일 업로드 및 다운로드 정책(같은 이름이 존재하면 자동으로 이름이 변경되도록 한다)
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

		Enumeration<String> files = multi.getFileNames();
		String fileName = "";

		while (files.hasMoreElements()) {
			//파일 시스템 이름 형식으로 바꿔주는 작업
			fileName = multi.getFilesystemName(files.nextElement());
		}
		
		//헬퍼가 선택한 <img>의 id값 전달 받기
		String picId = multi.getParameter("picId");
		
		//헬퍼가 선택한 <img>의 src값 전달 받기
		String picSrc = multi.getParameter("picSrc");
		
		//DB에 저장할 사진 파일이름 설정하기
		fileName = "images/" + helper_id + "/" + fileName;
	
		//만약 picSrc에 "add_picture.png"가 아닌 다른 값이 포함되어 있다면 그 파일을 삭제한다
		if (!picSrc.contains("add_picture.png")) {
			File f = new File(deleteFolder + picSrc);
			if (f.exists()) {
				f.delete();
			}
		}

		//switch문을 통해서 해당 DB에 파일 시스템 이름을 추가한다
		switch (picId) {
		case "main_pic":
			h_dao.updateMainPic(helper_id, fileName);
			break;
		case "pic1":
			h_dao.updatePic1(helper_id, fileName);
			break;
		case "pic2":
			h_dao.updatePic2(helper_id, fileName);
			break;
		case "pic3":
			h_dao.updatePic3(helper_id, fileName);
			break;
		case "pic4":
			h_dao.updatePic4(helper_id, fileName);
			break;
		case "pic5":
			h_dao.updatePic5(helper_id, fileName);
			break;
		}
		
		//data에 ajax에 전송할 <img> id값과 파일이름을 저장한다
		String data = picId + "," + fileName;

		//ajax로 data를 전송해 해당 jsp에서 해당 사진을 보여준다
		out.println(data);
		out.close();

		return null;
	}

}
