package com.helpme.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.vo.Helpme_Board_ReplyVO;

public class BoardReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

//		System.out.println("BoardReplyOkAction 들어옴");

		ActionForward forward = null;

		HttpSession session = request.getSession();
		Helpme_Board_ReplyVO r_vo = new Helpme_Board_ReplyVO();
		BoardDAO r_dao = new BoardDAO();

		//로그인 했느지 여부를 확인
		if(session.getAttribute("session_id")==null) {
			forward = new ActionForward();
			forward.setRedirect(false);
			//로그인 안 했다면 로그인 페이지로
			forward.setPath("/login.jsp");
			return forward;
		}else {

			int board_num = Integer.parseInt(request.getParameter("seq"));
			//		int client_no = Integer.parseInt(request.getParameter("client_no"));
			String client_id = (String)session.getAttribute("session_id");
			String reply_contents = request.getParameter("reply_contents");
			String loginAs = request.getParameter("loginAs");

			//		System.out.println(client_id);
			//		System.out.println(reply_contents);

			//stayBoardCount 메소드를 통해 댓글을 등록하고 난 후 조회수가 늘어나지 않도록
			r_dao.stayBoardCount(board_num);

			//BoardVO에 댓글 정보 등록
			r_vo.setBoard_num(board_num);
			//		r_vo.setClient_no(client_no);
			r_vo.setReply_contents(reply_contents);
			r_vo.setClient_id(client_id);

			//사용자가 작성한 댓글 정보를 insertReply로 전달하여 DB에 추가해준다.
			if(r_dao.insertReply(r_vo)) {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/BoardView.bo?seq="+board_num+"&loginAs="+loginAs);
			}//댓글을 작성한 게시글로 돌아간다.		

			return forward;
		}
	}



}
