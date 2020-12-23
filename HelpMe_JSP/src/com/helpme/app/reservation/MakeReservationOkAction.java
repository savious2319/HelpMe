package com.helpme.app.reservation;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.reservation.dao.ReservationDAO;
import com.helpme.app.reservation.vo.ReservationVO;

public class MakeReservationOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//html코드를 작성하기 위해서 getWriter()를 out에 담아준다.
		PrintWriter out = response.getWriter();
		
		// out으로 작성할 문자열 환경을 text, html로 잡아준다.
		response.setContentType("text/html;charset=utf-8");

		HelperDAO h_dao = new HelperDAO();
		ClientDAO c_dao = new ClientDAO();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");

		//예약 신청 정보들을 ajax를 통해서 전달 받는다
		String name = request.getParameter("name");
		String service = request.getParameter("service");
		String meetingArea = request.getParameter("meetingarea");
		String meetingPlace = request.getParameter("meetingplace");
		String meetingDate = request.getParameter("datepicker");
		String meetingStartTime = request.getParameter("startTime");
		String meetingEndTime = request.getParameter("endTime");
		
		//만약 헬퍼가 작성한 고객 이름이 DB에 저장된 이름과 일치하지 않다면 ajax를 통해 경고 메세지를 보이게 한다
		if (!c_dao.getClientNameByString(name)) {
			
			out.println("fail");
			out.close();
			
			return null;
			
		} else {
			
			//고객 번호, 예약 시작 & 끝 시간, 소진되는 포인트를 저장할 변수 초기화
			int client_no = c_dao.getClientNo(name);
			double startTime = 0.0, endTime = 0.0;
			int points_spent = 0;
			
			//DB의 테이블의 컬럼값이 소수점이기 때문에 Double로 파싱을 한다
			startTime = Double.parseDouble(meetingStartTime);
			endTime = Double.parseDouble(meetingEndTime);
			
			//헬퍼마다 30분당 요금이 다르기 때문에 고객이 선택한 헬퍼의 요금에 고객이 원하는 총 예약 시간을 곱해서 총 소진될 포인트를 계산한다
			points_spent = (int) (endTime - startTime) * h_dao.getHelperFare(helper_id);

			//예약 날짜를 가공하는 작업
			String[] calendar = meetingDate.split(" ");
			String month = "";
			switch (calendar[1]) {
			case "Jan":
				month = "01";
				break;
			case "Feb":
				month = "02";
				break;
			case "Mar":
				month = "03";
				break;
			case "Apr":
				month = "04";
				break;
			case "May":
				month = "05";
				break;
			case "Jun":
				month = "06";
				break;
			case "Jul":
				month = "07";
				break;
			case "Aug":
				month = "08";
				break;
			case "Sep":
				month = "09";
				break;
			case "Oct":
				month = "10";
				break;
			case "Nov":
				month = "11";
				break;
			case "Dec":
				month = "12";
				break;
			}

			String date = calendar[3] + "/" + month + "/" + calendar[2];

			//생성자를 통해 예약정보를 저장한다
			ReservationVO r_vo = new ReservationVO(service, helper_id, client_no, meetingArea, meetingPlace, date,
					startTime, endTime, points_spent);

			//예약 정보를 DB에 저장한다
			ReservationDAO r_dao = new ReservationDAO();
			r_dao.insertReservation(r_vo);

			//예약 현황을 저장할 변수 초기화
			String res_status = "";
			
			//헬퍼의 아이디를 통해 예약 현황을 변수에 저장한다
			for (ReservationVO r : r_dao.getReservationByHelperId(helper_id)) {
				res_status = r.getRes_status();
			}
			
			//예약 번호를 가지고 온다
			int res_no = r_dao.getResNo(client_no, helper_id);

			//만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingStart 변수에 저장한다 
			if (meetingStartTime.contains(".5")) {
				meetingStartTime = meetingStartTime.substring(0, meetingStartTime.indexOf(".")) + ":30";
			} else {
				//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingStart에 변수에 저장한다
				meetingStartTime = meetingStartTime + ":00";
			}

			//만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingEnd 변수에 저장한다
			if (meetingEndTime.contains(".5")) {
				meetingEndTime = meetingEndTime.substring(0, meetingEndTime.indexOf(".")) + ":30";
			} else {
				//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingEnd에 변수에 저장한다
				meetingEndTime = meetingEndTime + ":00";
			}

			//ajax를 통해서 응답할 페이지에 예약 테이블을 생성한다
			out.println("<tr id=" + res_no + ">");
			out.println("<td>" + res_no + "</td>");
			out.println("<td>" + r_vo.getClient_no() + "</td>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + date + "    " + meetingStartTime + " ~ " + meetingEndTime + "</td>");
			out.println("<td>" + r_vo.getService() + "</td>");
			out.println("<td>" + r_vo.getMeeting_area() + "</td>");
			out.println("<td>" + r_vo.getPoints_spent() + "</td>");
			out.println("<td>" + res_status + "</td>");
			
			//예약 수정 및 취소를 원할 경우 아래 자바스크립트 함수로 예약번호를 전달한다
			out.println(
					"<td><a href=javascript:deleteReservation(" + res_no + ") class='button small'>Delete</a></td>");
			out.println("</tr>");
			out.close();

			return null;
		}
	}

}
