package com.helpme.app.reservation;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.reservation.dao.ReservationDAO;

public class DeleteReservationOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");
		
		//삭제할 예약번호를 전달 받는다
		int res_no = Integer.parseInt(request.getParameter("resNo"));
		
		ReservationDAO r_dao = new ReservationDAO();
		
		//예약번호로 예약을 삭제한다
		r_dao.deleteReservationByResNo(res_no);
		
		//삭제한 예약을 테이블에서 지우기 위해 예약번호를 ajax를 통해 전송한다
		out.println(res_no);
		out.close();
		
		return null;
	}

}
