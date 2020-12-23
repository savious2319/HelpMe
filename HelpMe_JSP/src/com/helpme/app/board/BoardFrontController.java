package com.helpme.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;

public class BoardFrontController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		Action action = null;
		ActionForward forward = null;
		
//		System.out.println("BoardFrontController 들어옴");
		
		switch(command) {
		case "/BoardList.bo" : //게시판 전체 게시물 볼 때
			try {
				forward = new BoardListAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/BoardWriteOk.bo": //게시판 글 작성 할 때
			try {
				forward = new BoardWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/BoardView.bo": //게시물 자세히 볼 때
			try {
				forward = new BoardViewAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/FileDownload.bo": //업로드한 파일 다운받을 때
			try {
				forward = new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardReplyOk.bo": //댓글 작성할 때
			try {
				forward = new BoardReplyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardDeleteOk.bo": //게시물 삭제할때
			try {
				forward = new BoardDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardReplyModifyOk.bo": //댓글 수정할때
			try {
				forward = new BoardReplyModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardReplyDeleteOk.bo": //댓글 삭제할때
			try {
				forward = new BoardReplyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardModify.bo":
			try {
				forward = new BoardModifyAction().execute(req,resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardModifyOk.bo": //게시물 수정할때
			try {
				forward = new BoardModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardLikeCountUpdate.bo": //게시물 좋아요 업데이트할 때
			try {
				action = new BoardLikeCountUpdateAction();
				action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/BoardLikeCount.bo": //게시물 좋아요 클릭 했을 때
			try {		
				new BoardLikeCountAction().execute(req, resp);				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		default:			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/404.jsp");
		}
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
}





























