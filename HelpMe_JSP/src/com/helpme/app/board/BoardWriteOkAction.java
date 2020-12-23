package com.helpme.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.dao.FilesDAO;
import com.helpme.app.board.vo.Helpme_BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		BoardDAO b_dao = new BoardDAO();
		Helpme_BoardVO b_vo = new Helpme_BoardVO();
		FilesDAO f_dao = new FilesDAO();
		
		ActionForward forward = new ActionForward();
		
//		System.out.println("BoardWriteOKAction 들어옴");
		
		//request.getServletContext().getRealPath("/") + "\\upload"
		//String saveFolder = "D:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";
//		String saveFolder = "C:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";
		
		//첨부한 파일이 업로드 될 서버 경로 설정
		String saveFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT/upload";
		
		//첨부 파일의 크기 설정
		int fileSize = 15*1024*1024;	//15메가바이트
		
		//int client_no = Integer.parseInt(request.getParameter("client_num"));
		//String client_id = request.getParameter("client_id");
		//String board_category = request.getParameter("board_category");
		//int like_count = Integer.parseInt(request.getParameter("like_count"));
		
		//메일 서버 객체(파일 업로드 및 다운로드) 선언
		MultipartRequest multi = null;
		
		//DefaultFileRenamePolicy : 파일 업로드 및 다운로드 정책(같은 이름이 존재하면 자동으로 이름이 변경되도록 한다)
		multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		//MultipartRequest에 request객체를 전달하기 때문에 요청된 파라미터는 모두
		//multi객체를 통해서 전달받아야 한다.
		b_vo.setBoard_title(multi.getParameter("board_title"));
		b_vo.setBoard_contents(multi.getParameter("board_contents"));
		b_vo.setClient_id(multi.getParameter("client_id"));
		//b_vo.setLike_count(like_count);
		b_vo.setBoard_category(multi.getParameter("board_category"));
		
		String loginAs = multi.getParameter("loginAs");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		
		/*System.out.println(b_vo.getBoard_title());
		System.out.println(b_vo.getBoard_contents());
		System.out.println(b_vo.getClient_id());
		System.out.println(b_vo.getBoard_category());*/
		
		
		//게시판의 현재 시퀀스 가져오기
		//가져온 값 + 1이 지금 추가할 게시판의 번호이다.
		//따라서 현재 시퀀스 + 1을 insertFiles에 전달해야 한다.
		if(b_dao.insertBoard(b_vo)) {
//			System.out.println("if(b_dao.insertBoard(b_vo)) 들어가고");
			if(f_dao.insertFiles(b_dao.getBoardSeq(), multi)) {
//				System.out.println("if(f_dao.insertFiles(b_dao.getBoardSeq(), multi)) 들어가고");
				/*
				 * insertFiles(추가될 게시판 번호, 파일정보);
				 * 
				 * 추가될 게시판 번호는 현재 SEQ + 1 이다.
				 * 하지만 현재 세션에서 증가시키지 않고 바로 현재 SEQ를 조회하면 오류가 발생하기 때문에
				 * 게시판을 먼저 추가해줌으로써 SEQ를 증가시키고, 그 후에 현재 시퀀스를 가지고 오는 것이 적합하다.
				 * 따라서 insertBoard()를 먼저 실행해주고 그 다음 insertFiles()를 실행해준다.
				 * 
				 * ※ NEXTVAL 사용 후 CURRVAL을 사용한다.
				 * 
				 */
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/BoardList.bo?loginAs="+loginAs);
				//forward로 응답을 하기 위해서는 PrintWriter로 어떠한 응답도 해서는 안된다.
				//응답은 반드시 딱 한 번만 할 수 있다.
				//			out.println("<script>");
				//			out.println("alert('Enrollment successed.');");
				//			out.println("</script>");
				//			out.close();
//				System.out.println("등록 성공");
				return forward;
			}
		}
		out.println("<script>");
		out.println("alert('Enrollment failed. Please try again.');");
		out.println("</script>");
		out.close();
//		System.out.println("등록 실패");
		
		return null;
	}



}






























