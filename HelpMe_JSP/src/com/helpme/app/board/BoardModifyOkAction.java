package com.helpme.app.board;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.dao.FilesDAO;
import com.helpme.app.board.vo.Helpme_BoardVO;
import com.helpme.app.board.vo.Helpme_FilesVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
//		System.out.println("BoardModifyOkAction 들어옴");
		
		Helpme_BoardVO b_vo = new Helpme_BoardVO();
		BoardDAO b_dao = new BoardDAO();
		FilesDAO f_dao = new FilesDAO();
		
		ActionForward forward = new ActionForward();
		
//		String saveFolder = "D:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";
//		String saveFolder = "C:\\GB_0900_07_BSM\\JSP\\workspace\\HelpMe_final\\WebContent\\upload";
		
		//파일이 저장될 경로 설정
		String saveFolder = "/usr/local/apache-tomcat-8.5.59/webapps/ROOT/upload";
		
		//업로드할 파일의 크기 : 15 메가바이트
		int fileSize = 15 * 1024 * 1024;
		
		MultipartRequest multi = null;
		
		try {
//			System.out.println("try문 들어옴");
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			int board_num = Integer.parseInt(multi.getParameter("seq"));
			for(Helpme_FilesVO file : f_dao.getDetail(board_num)) {
//				System.out.println("for문 들어옴");
//				File f = new File(saveFolder + "\\" + file.getFile_name());
				File f = new File(saveFolder + file.getFile_name());
				if(f.exists()) {
//					System.out.println("if문 들어옴");
					f.delete();
				}
			}
			
			//일단 FileDAO의 delteFiles를 통해 업로드한 파일을 지우고
			f_dao.deleteFiles(board_num);
			//insertFiles를 통해 새로운 파일을 업로드
			f_dao.insertFiles(board_num, multi);
			
			String loginAs = multi.getParameter("loginAs");
			String multi_title = multi.getParameter("board_title");
			String multi_contents = multi.getParameter("board_contents");
			String multi_category = multi.getParameter("board_category");
			/*System.out.println("title : "+multi_title);
			System.out.println("contents : "+multi_contents);
			System.out.println("category : "+multi_category);*/
			
			//BoardVO에 갱신된 후기 정보 set
			b_vo.setBoard_num(board_num);
			b_vo.setBoard_title(multi_title);
			b_vo.setBoard_contents(multi_contents);
			b_vo.setBoard_category(multi_category);
			
			//BoardDAO의 updateBoard 실행
			b_dao.updateBoard(b_vo);
			
			forward.setRedirect(true);
			forward.setPath(request.getContextPath()+"/BoardView.bo?seq="+board_num+"&loginAs="+loginAs);
			
			return forward;
			
		} catch (Exception e) {
//			System.out.println("catch문 들어옴");
			System.out.println(e);
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("Modify failure. Please try again.");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}




























