package com.helpme.app.helper;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperSearchAction implements Action{
   SimpleDateFormat simple = new SimpleDateFormat("yyyy/MM/dd");
   String day = "";
   Date date = null;
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      //로그인 유저 판별
      String loginAs = request.getParameter("loginAs");
      
      //선택한 서비스 
      String service = request.getParameter("service");
      
      //선택 지역 
      String Area = request.getParameter("Area");
      
      //선택 날짜
      String inputdate = request.getParameter("datepicker");
      
      //선택 타임
      String time = request.getParameter("time1");   
      
      //사용자가 요청한 페이지 번호
      String temp = request.getParameter("page");
      
      //요일 확인
      date = simple.parse(inputdate);
      Calendar cal = Calendar.getInstance();
      cal.setTime(date);    
      int dayNum = cal.get(Calendar.DAY_OF_WEEK);
      
      //리턴타입(전송방식, 응답경로)
      ActionForward forward = new ActionForward();
      HelperDAO h_dao = new HelperDAO();
      
      //요청한 페이지가 없다면 default로 1페이지를 응답해주고,
      //요청한 페이지가 있다면 해당 페이지로 응답해준다.
      int page = temp == null ? 1 : Integer.parseInt(temp);
      
      //한 페이지당 10개의 게시글이 보이도록 설정
      int pageSize = 10;            
      
      //한 페이지에서 가장 마지막 글 번호
      int endRow = page * pageSize;
            
      //한 페이지에서 첫번째 글 번호
      int startRow = endRow - (pageSize - 1);
   
      //전체 헬퍼수
      int totalCnt = h_dao.getHelperCnt(time,inputdate,Area,service,dayNum,startRow,endRow);
      
      //하나의 응답 페이지에서 보여질 페이지 수(1~10까지 보여준다)
      int startPage = ((page - 1) / pageSize) * pageSize + 1;
      
      int endPage = startPage + 9;
      
      //게시글의 총 개수로 페이지 수를 구분하여 총 페이지 수를 totalPage에 담아준다.
      int totalPage = (totalCnt - 1) / pageSize + 1;
      
      //실제 마지막 페이지와 연산으로 구한 마지막 페이지를 비교하여 일치하도록 해준다.
      endPage = endPage > totalPage ? totalPage : endPage;

      request.setAttribute("loginAs", loginAs);
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("totalCnt", totalCnt);
      request.setAttribute("nowPage", page);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("helperList", h_dao.getHelperList(time,inputdate,Area,service,dayNum,startRow,endRow));		//헬퍼 정보가져오기
      request.setAttribute("helperLanguages", h_dao.getHelperLanguanges(time,inputdate,Area,service,dayNum));   		//헬퍼 언어가져오기
      request.setAttribute("helperPicture", h_dao.getHelperPicture(time,inputdate,Area,service,dayNum,startRow,endRow));//헬퍼 메인사진 가져오기
      request.setAttribute("select_Area", Area);			//페이징 처리를 위해 선택지역값 설정
      request.setAttribute("select_inputdate", inputdate);	//페이징 처리를 위해 선택 날짜값 설정
      request.setAttribute("select_time", time);			//페이징 처리를 위해 선택 타임값 설정
      request.setAttribute("select_service", service);		//페이징 처리를 위해 선택 서비스값 설정
      
      forward.setRedirect(false);
      forward.setPath("/helper_search.jsp");
      
      return forward;
   }
}