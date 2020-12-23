package com.helpme.app.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.helpme.mybatis.config.SqlMapConfig;

import com.helpme.app.board.vo.Helpme_BoardVO;
import com.helpme.app.board.vo.Helpme_Board_ReplyVO;
public class BoardDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession sqlsession;
	
	public BoardDAO(){
		//true를 넣어서 커밋을 해줘야 한다!
		sqlsession = sessionf.openSession(true);
	}
	
	//작성된 게시글의 총 개수를 가져온다.
	public int getBoardCnt() {
		return sqlsession.selectOne("Board.boardCnt");
	}
	
	//게시판에 작성된 모든 게시글을 가져오는 메소드
	public List<Helpme_BoardVO> getBoardList(int startRow, int endRow){
		HashMap<String, Integer> pageMap = new HashMap<>();
		
		//DB 조회시 필요한 게시글 시작 번호와 끝 번호를 Map에 담아서 전달해준다.
		//전체 게시글을 가져온 후 연산을 하면 느리기 때문에
		//필요한 만큼의 게시글을 가져오도록 한다.
		pageMap.put("startRow", startRow);
		pageMap.put("endRow", endRow);
		
		List<Helpme_BoardVO> boardList = sqlsession.selectList("Board.listAll", pageMap);		
		return boardList;
	}
	
	//게시판의 현재 게시글 번호 가져오기
	public int getBoardSeq() {
		int boardSeq = sqlsession.selectOne("Board.getSeq");
//		System.out.println(boardSeq);
		return boardSeq;
	}
	
	//게시글 상세보기를 사용자가 요청했을 때 해당 게시글의 정보를 리턴해주는 메소드
	//사용자가 요청한 게시글 번호를 전달받는다.
	public Helpme_BoardVO getDetail(int board_num) {
		return sqlsession.selectOne("Board.getDetail",board_num);
	}
	
	//사용자가 작성한 게시글 내용을 BoardVO객체로 전달받는다.
	public boolean insertBoard(Helpme_BoardVO board) {
		if(sqlsession.insert("Board.insertBoard", board)==1) {
			return true;
		}
		return false;
	}
	
	//게시글 상세보기 시, 해당 게시글의 조회수를 증가시켜준다.
	//상세보기를 요청할 때 마다 증가하도록 구현한다.
	public void updateBoardCount(int board_num) {
		sqlsession.update("Board.updateViewCount", board_num);
	}
	
	//댓글을 달고 난 후 boardView로 돌아가는 과정에서 다시 카운트가 세진다.
	//하나를 지워서 그대로 유지시킬 필요가 있다.
	public void stayBoardCount(int board_num) {
		sqlsession.update("Board.stayViewCount", board_num);
	}
	
	//게시판 수정
	public void updateBoard(Helpme_BoardVO b_vo) {
		sqlsession.update("Board.updateBoard", b_vo);
	}
	public void deleteBoard(int board_num) {
		sqlsession.delete("Board.deleteBoard", board_num);
	}
	
	/*댓글*/
	public void deleteAllReply(int board_num) {
		sqlsession.delete("Board.deleteReply", board_num);
	}
	
	//댓글 추가 시, 사용자가 작성한 새로운 댓글 정보를 전달받는다.
	public boolean insertReply(Helpme_Board_ReplyVO r_vo) {
		if(sqlsession.insert("Board.insertReply", r_vo)==1) {
			return true;
		}
		return false;
	}
	
	//게시글 번호를 전달받은 후 DB에서 조회한다.
	//해당 게시글에 있는 모든 댓글 내용을 List로 리턴해준다.
	public List<Helpme_Board_ReplyVO> getReply(int board_num){
		List<Helpme_Board_ReplyVO> replyList = sqlsession.selectList("Board.getReply", board_num);
		return replyList;
	}
	
	//수정한 댓글 번호와 수정한 내용을 전달받는다.
	public void updateReply(int reply_num, String reply_contents) {
		HashMap<String, Object> replyMap = new HashMap<>();
		
		replyMap.put("reply_num", reply_num);
		replyMap.put("reply_contents", reply_contents);
		sqlsession.update("Board.updateReply", replyMap);
	}
	
	//댓글 삭제
	public void deleteReply(int reply_num) {
		sqlsession.delete("Board.deleteReply", reply_num);
	}
	
	//좋아요를 이미 했는지 확인 검사
	public int likeCheck(Map<String, Object> m) {
		int result = 1;
		
		try {
			result = (Integer)sqlsession.selectOne("Board.likeCheck", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//좋아요 하기
	public void likeUpdate(Map<String, Object> m) {
		try {
			sqlsession.insert("Board.likeUpdate", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//좋아요 취소
	public void likeDelete(Map<String, Object> m) {
		try {
			sqlsession.insert("Board.likeDelete", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//좋아요 추천수
	public int likeCount(int board_num) {
		int count = 0;
		
		try {
			count = (Integer)sqlsession.selectOne("Board.likeCount", board_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
}
