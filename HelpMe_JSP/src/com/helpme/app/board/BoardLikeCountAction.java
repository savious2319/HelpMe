package com.helpme.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;

public class BoardLikeCountAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		ActionForward forward = null;
		
		//로그인하지 않은 상태로 좋아요를 누르면 로그인 페이지로 가도록 하고 싶었으나 어째서인지 작동이 안 된다.
		if(session.getAttribute("session_id")==null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/login.jsp");
			return forward;
		}else {
		
			BoardDAO b_dao = new BoardDAO();
			//BoardVO b_vo = new BoardVO();

			//어떤 후기의 좋아요 수를 늘려야하는지 알아야하기 때문에 board_num을 가져온다
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			
			//BoardDAO의 likeCount 메소드를 실행한다.
			int like_count = b_dao.likeCount(board_num);
			out.println(like_count);
			out.close();

			return null;
		}
	}

}
