package com.helpme.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;

public class BoardReplyDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
//		System.out.println("BoardReplyDeleteOkAction 들어옴");
		
		BoardDAO r_dao = new BoardDAO();
		ActionForward forward = new ActionForward();
		
		//reply_num과 board_num을 가져와서 어느 후기의 어떤 댓글을 지워야하는지 특정한다.
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		int board_num = Integer.parseInt(request.getParameter("seq"));
		String loginAs= request.getParameter("loginAs");
		
		//BoardDAO에 있는 deleteReply를 통해 댓글 삭제
		r_dao.deleteReply(reply_num);
		
		//stayBoardCount 메소드를 통해 댓글을 등록하고 난 후 조회수가 늘어나지 않도록
		r_dao.stayBoardCount(board_num);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/BoardView.bo?seq="+board_num+"&loginAs="+loginAs);
		
		return forward;
	}



}
