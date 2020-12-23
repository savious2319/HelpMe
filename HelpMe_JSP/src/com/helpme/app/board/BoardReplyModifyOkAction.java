package com.helpme.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;

public class BoardReplyModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
//		System.out.println("BoardReplyModifyOkAction 들어옴");
		
		BoardDAO r_dao = new BoardDAO();
		ActionForward forward = new ActionForward();
		
		//어떤 댓글을 수정해야하는지 알기 위해 reply_num과 board_num을 특정한다.
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		int board_num = Integer.parseInt(request.getParameter("seq"));
		String reply_contents = request.getParameter("board_contents"+request.getParameter("num"));
		String loginAs = request.getParameter("loginAs");
		
		//BoardDAO의 updateReply를 통해 댓글 수정
		r_dao.updateReply(reply_num, reply_contents);
		
		//stayBoardCount 메소드를 통해 댓글을 등록하고 난 후 조회수가 늘어나지 않도록
		r_dao.stayBoardCount(board_num);
		
		forward.setRedirect(true);
		forward.setPath(request.getContextPath() + "/BoardView.bo?seq=" + board_num+"&loginAs="+loginAs);
		
		return forward;
	}

}
