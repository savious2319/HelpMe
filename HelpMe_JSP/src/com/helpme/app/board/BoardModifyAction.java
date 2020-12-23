package com.helpme.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.vo.Helpme_BoardVO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

//		System.out.println("BoardModifyAction 들어옴");

		ActionForward forward = new ActionForward();

		BoardDAO b_dao = new BoardDAO();
		//수정할 내용들이 담길 BoardVO 객체
		Helpme_BoardVO b_vo = null;

		//세션 아이디를 작성자 아이디로 가져온다.
		String client_id = (String) request.getSession().getAttribute("session_id");

		//로그인하지 않았을 때
		if (client_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_reviewModify.jsp");

			return forward;

		//로그인했을 때
		} else {

			int board_num = Integer.parseInt(request.getParameter("seq"));
			String loginAs = request.getParameter("loginAs");

			//BoardDAO에 있는 getDetail 메소드 실행
			b_vo = b_dao.getDetail(board_num);
			//BoardDAO에 있는 stayBoardCount 메소드 실행
			b_dao.stayBoardCount(board_num);

			request.setAttribute("boardBean", b_vo);
			forward.setRedirect(false);
			forward.setPath("/helper_reviewModify.jsp?loginAs=" + loginAs);

			return forward;
		}

	}

}
