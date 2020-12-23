package com.helpme.app.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.board.dao.BoardDAO;

public class BoardLikeCountUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
//		System.out.println("BoardLikeCountUpdateAction 들어옴");
		
		//map에 board_num과 client_no를 저장
		Map<String, Object> m = new HashMap<>();
		m.put("client_id", request.getParameter("client_id"));
		m.put("board_num", request.getParameter("board_num"));
		
		BoardDAO b_dao = new BoardDAO();
		
		//이미 추천한 상태인지 아닌지를 판별하기 위한 변수
		int result = b_dao.likeCheck(m);
		
		if(result==0) {	//추천하지 않았을 때
			//좋아요 1 추가
			b_dao.likeUpdate(m);
		}else {			//이미 추천한 상태일 때
			//좋아요 취소
			b_dao.likeDelete(m);
		}
		
		return null;
	}

}
