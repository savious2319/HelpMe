package com.helpme.app.board;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.dao.FilesDAO;
import com.helpme.app.board.vo.Helpme_FilesVO;

public class BoardDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
//		System.out.println("BoardDeleteAction 들어옴");
		
		BoardDAO b_dao = new BoardDAO();
		FilesDAO f_dao = new FilesDAO();
		
		ActionForward forward = new ActionForward();
		
		int board_num = Integer.parseInt(request.getParameter("seq"));
		//saveFolder의 경로를 수정해야한다.
		String loginAs = request.getParameter("loginAs");
		//String saveFolder = "D:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";		
		//String saveFolder = "C:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";		
		
		//후기가 지워지면 그 후기에 업로드한 파일도 지워야한다.
		//파일이 저장된 경로를 지정해준다.
		String saveFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT/upload";
		
		
		for(Helpme_FilesVO file : f_dao.getDetail(board_num)) {
			File f = new File(saveFolder+"/"+file.getFile_name());
			if(f.exists()) {
				f.delete();
			}
		}
		
		//FileDAO에 있는 deleteFiles 메소드를 실행하여 등록된 파일 제거
		f_dao.deleteFiles(board_num);
		//BoardDAO에 있는 deleteAllReply 메소드를 실행하여 해당 후기에 등록된 댓글들 제거 
		b_dao.deleteAllReply(board_num);
		//BoardDAO에 있는 deleteBoard 메소드를 실행하여 해당 후기 제거
		b_dao.deleteBoard(board_num);
		
		forward.setRedirect(true);;
		forward.setPath(request.getContextPath()+"/BoardList.bo?loginAs="+loginAs);
		
		return forward;
	}

}
