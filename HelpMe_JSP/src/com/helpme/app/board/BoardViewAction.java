package com.helpme.app.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;
import com.helpme.app.board.dao.FilesDAO;
import com.helpme.app.board.vo.Helpme_BoardVO;
import com.helpme.app.board.vo.Helpme_Board_ReplyVO;
import com.helpme.app.board.vo.Helpme_FilesVO;

public class BoardViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
//		System.out.println("BoardViewAction 들어옴");
		
		FilesDAO f_dao = new FilesDAO();
		BoardDAO b_dao = new BoardDAO();
		Helpme_BoardVO b_vo = new Helpme_BoardVO();
		
		int board_num = Integer.parseInt(request.getParameter("seq"));
		String loginAs = request.getParameter("loginAs");
		
		System.out.println("loginAs : "+loginAs);
		
		//조회수 1 증가
		b_dao.updateBoardCount(board_num);
		
		//사용자가 요청한 게시글의 번호를 통해 게시글 정보를 모두 가져온다.
		b_vo = b_dao.getDetail(board_num);
		
		//해당 게시글에 첨부된 파일정보를 모두 가져온다.
		List<Helpme_FilesVO> filesList = f_dao.getDetail(board_num);
		
		//해당 게시글의 댓글 정보를 모두 가져온다.
		List<Helpme_Board_ReplyVO> replyBeanList = b_dao.getReply(board_num);
		
		if(b_vo!=null) {
			//응답 페이지로 해당 게시글의 정보를 전달해야 하므로 request객체에 저장한다.
			int like_count = b_dao.likeCount(board_num);
			request.setAttribute("loginAs", loginAs);
			request.setAttribute("cnt", like_count);
			request.setAttribute("boardBean", b_vo);
			request.setAttribute("replyBeanList", replyBeanList);
			if(filesList!=null) {
				request.setAttribute("filesBeanList", filesList);
				ActionForward forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/helper_reviewBoardView.jsp");
				return forward;
			}
		}
		
		return null;
	}



}
