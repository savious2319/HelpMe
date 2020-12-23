package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class AllHelperAction implements Action{
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      ActionForward forward = new ActionForward();
      HelperDAO h_dao = new HelperDAO();

      //사용자가 요청한 페이지 번호
      String temp = request.getParameter("page");
      
      //요청한 페이지가 없다면 default로 1페이지를 응답해주고,
      //요청한 페이지가 있다면 해당 페이지로 응답해준다.
      int page = temp == null ? 1 : Integer.parseInt(temp);
      
      //한 페이지당 10개의 게시글이 보이도록 설정
      int pageSize = 10;
      
      //한 페이지에서 가장 마지막 글 번호
      int endRow = page * pageSize;
      
      //한 페이지에서 첫번째 글 번호
      int startRow = endRow - (pageSize - 1);
      
      //전체헬퍼의 수
      int totalCnt = h_dao.getHelperCnt();
      
      //하나의 응답 페이지에서 보여질 페이지 수(1~10까지 보여준다)
      int startPage = ((page - 1) / pageSize) * pageSize + 1;
      
      int endPage = startPage + 9;
      
      //게시글의 총 개수로 페이지 수를 구분하여 총 페이지 수를 totalPage에 담아준다.
      int totalPage = (totalCnt - 1) / pageSize + 1;
      
      //실제 마지막 페이지와 연산으로 구한 마지막 페이지를 비교하여 일치하도록 해준다.
      endPage = endPage > totalPage ? totalPage : endPage;
      
      //로그인 유저 판별
      String loginAs = request.getParameter("loginAs");
      
      //응답페이지로 전달할 결과값들
      request.setAttribute("loginAs", loginAs);
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("totalCnt", totalCnt);
      request.setAttribute("nowPage", page);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("helperList", h_dao.getAllHelperList(startRow,endRow));			//헬퍼 정보 가져오기
      request.setAttribute("helperLanguages",h_dao.getAllHelperLanguages(startRow,endRow)); //헬퍼의 언어 가져오기
      request.setAttribute("helperPicture", h_dao.getAllHelperPicture(startRow,endRow));	//헬퍼 메인 사진 가져오기
      request.setAttribute("select_service", "all");
      
      /*forward 방식으로 전송해야 request 객체에 담긴 정보를 응답 페이지에서 사용할 수 있다.*/
      forward.setRedirect(false);
      forward.setPath("/helper_search.jsp");
      
      return forward;
   }
}