package com.helpme.app.client;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.client.vo.ClientVO;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.HelperVO;
import com.helpme.app.helper.vo.Helper_PicsVO;
import com.helpme.app.reservation.dao.ReservationDAO;
import com.helpme.app.reservation.vo.ReservationVO;

public class ClientReservationOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();
		
		//응답페이지로 전달할 값 변수 초기화
		int client_no = 0;
		int res_cnt = 0;
		String helper_id = "";
		String helper_name = "";
		String flag_url = "";
		String kakao_url = "";
		String helper_pic = "";
		String meetingDate = "";
		String meetingStart = "";
		String meetingEnd = "";
		String meetingPlace = "";
		int points = 0;
		String service = "";

		ClientDAO c_dao = new ClientDAO();
		
		//세션에 저장된 고객 아이디를 client_id에 저장한다
		String client_id = (String) request.getSession().getAttribute("session_id");

		//만약 고객 아이디가 널이면 forward방식으로 client_points.jsp로 이동한다
		if (client_id == null) {
			forward.setRedirect(false);
			forward.setPath("/client_reservation.jsp");

			return forward;
		//만약 고객 아이디가 널이 아니면 아래 데이터를 client_points.jsp로 전송한다	
		} else {
			
			//고객 아이디로 고객 번호를 가져와 저장한다
			for (ClientVO c_vo : c_dao.getDetailById(client_id)) {
				client_no = c_vo.getClient_no();
			}

			ReservationDAO r_dao = new ReservationDAO();
			
			//yyyyMMdd로 날짜 형식을 지정한다
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			
			//오늘날짜를 sdf 형식으로 바꿔 now 변수에 저장한다
			String now = sdf.format(new Date());
			
			//현재 날짜 또는 현재 날짜 이후에 예약된 정보들을 저장하기 위한 list
			ArrayList<String> currentHelperId = new ArrayList<>();
			ArrayList<String> currentResDate = new ArrayList<>();
			ArrayList<String> currentStartTime = new ArrayList<>();
			ArrayList<String> currentEndTime = new ArrayList<>();
			ArrayList<Integer> currentResPoints = new ArrayList<>();
			ArrayList<String> currentService = new ArrayList<>();
			ArrayList<String> currentResMeetingPlace = new ArrayList<>();
			ArrayList<String> currentResHelperName = new ArrayList<>();
			ArrayList<String> currentResFlag = new ArrayList<>();
			ArrayList<String> currentResPic = new ArrayList<>();
			ArrayList<String> openChat_url = new ArrayList<>();
			
			//현재 날짜 이전에 예약된 정보들을 저장하기 위한 list
			ArrayList<String> previousHelperId = new ArrayList<>();
			ArrayList<String> previousResDate = new ArrayList<>();
			ArrayList<String> previousStartTime = new ArrayList<>();
			ArrayList<String> previousEndTime = new ArrayList<>();
			ArrayList<Integer> previousResPoints = new ArrayList<>();
			ArrayList<String> previousService = new ArrayList<>();
			ArrayList<String> previousResMeetingPlace = new ArrayList<>();
			ArrayList<String> previousResHelperName = new ArrayList<>();
			ArrayList<String> previousResFlag = new ArrayList<>();
			ArrayList<String> previousResPic = new ArrayList<>();

			//예약한 헬퍼 아이디를 저장하기 위한 list
			ArrayList<String> helperId = new ArrayList<>();

			HelperDAO h_dao = new HelperDAO();

			// 고객 번호로 예약 정보 가져오기
			for (ReservationVO r_vo : r_dao.getReservationByClientNo(client_no)) {
				meetingDate = r_vo.getMeeting_date();
				helper_id = r_vo.getHelper_id();
				meetingStart = r_vo.getStart_time() + "";
				meetingEnd = r_vo.getEnd_time() + "";
				meetingPlace = r_vo.getMeeting_place();
				points = r_vo.getPoints_spent();
				service = r_vo.getService();

				// 예약된 모든 헬퍼 아이디 추가
				helperId.add(helper_id);

				// 헬퍼 이름 & 나라 국기 url 정보 담기
				for (String id : helperId) {
					
					for (HelperVO h_vo : h_dao.getHelperDetail(id)) {
						helper_name = h_vo.getName();
						flag_url = h_vo.getFlag_url();
						kakao_url = h_vo.getKakao_url();
					}
				}

				// 헬퍼 사진 파일경로 담기
				for (String id : helperId) {

					for (Helper_PicsVO hp_vo : h_dao.getPics(id)) {
						helper_pic = hp_vo.getMain_filename();

						System.out.println("helper_pic filename :" + helper_pic);
					}
				}

				// MM/dd/yyyy 형식으로 날짜를 가공하기
				String[] calendar1 = meetingDate.split(" ");
				String[] dateSplit = calendar1[0].split("-");
				String date = dateSplit[1] + "/" + dateSplit[2] + "/" + dateSplit[0];

				//만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingStart 변수에 저장한다 
				if (meetingStart.contains(".5")) {
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingStart에 변수에 저장한다
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":00";
				}
				
				//만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingEnd 변수에 저장한다 
				if (meetingEnd.contains(".5")) {
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":30";
				} else {
					//.5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingEnd에 변수에 저장한다
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":00";
				}

				// 예약된 날짜와 현재 날짜를 비교하기 위한 설정
				// yyyy/MM/dd 형식으로 날짜를 가공하기
				String[] calendar2 = meetingDate.split(" ");
				String[] compareSplit = calendar2[0].split("-");
				String compare = compareSplit[0] + compareSplit[1] + compareSplit[2];
				
				//예약 날짜와 현재 날짜를 Date 타입으로 파싱한다
				Date resDate = sdf.parse(compare);
				Date today = sdf.parse(now);
				
				//밀리초로 환산해 예약 날짜와 현재 날짜의 차를 구한다
				long diff = resDate.getTime() - today.getTime();
				
				//구한 차를 요일로 환산한다
				long diffDays = diff / (24 * 60 * 60 * 1000);
				
				//만약 결과가 0 또는 0 보다 크다면 아직 현재 진행중인 예약이다
				if (diffDays == 0 || diffDays > 0) {
					
					//현재 진행중인 예약 정보들을 저장한다
					currentHelperId.add(helper_id);
					currentResDate.add(date);
					currentStartTime.add(meetingStart);
					currentEndTime.add(meetingEnd);
					currentResPoints.add(points);
					currentService.add(service);
					currentResMeetingPlace.add(meetingPlace);
					currentResHelperName.add(helper_name);
					currentResFlag.add(flag_url);
					currentResPic.add(helper_pic);
					openChat_url.add(kakao_url);
					
					//총 몇개의 예약이 진행중인 지 알기 위해 if문에 들어올때마다 1씩 증가시킨다
					res_cnt += 1;

				} else {
					
					//고객이 한번도 헬퍼 평점을 매기지않았다면 if문에 들어간다
					if (c_dao.getHelperRateCnt(helper_id, client_no) == null) {
						
						//고객이 헬퍼 한명씩만 평점을 매길 수 있도록 카운트를 등록한다
						c_dao.insertHelperRateCnt(helper_id, client_no);
					}
					
					//이전 예약 정보들을 저장한다
					previousHelperId.add(helper_id);
					previousResDate.add(date);
					previousStartTime.add(meetingStart);
					previousEndTime.add(meetingEnd);
					previousResPoints.add(points);
					previousService.add(service);
					previousResMeetingPlace.add(meetingPlace);
					previousResHelperName.add(helper_name);
					previousResFlag.add(flag_url);
					previousResPic.add(helper_pic);
				}

			}

			//응답페이지로 전달하기
			request.setAttribute("clientId", client_id);
			request.setAttribute("loginAs", request.getParameter("loginAs"));

			request.setAttribute("currentHelperId", currentHelperId);
			request.setAttribute("currentResDate", currentResDate);
			request.setAttribute("currentStartTime", currentStartTime);
			request.setAttribute("currentEndTime", currentEndTime);
			request.setAttribute("currentResPoints", currentResPoints);
			request.setAttribute("currentService", currentService);
			request.setAttribute("currentResMeetingPlace", currentResMeetingPlace);
			request.setAttribute("currentResHelperName", currentResHelperName);
			request.setAttribute("currentResFlag", currentResFlag);
			request.setAttribute("currentResPic", currentResPic);
			request.setAttribute("currentResCnt", res_cnt);
			request.setAttribute("openChat_url", openChat_url);

			request.setAttribute("previousHelperId", previousHelperId);
			request.setAttribute("previousResDate", previousResDate);
			request.setAttribute("previousStartTime", previousStartTime);
			request.setAttribute("previousEndTime", previousEndTime);
			request.setAttribute("previousResPoints", previousResPoints);
			request.setAttribute("previousService", previousService);
			request.setAttribute("previousResMeetingPlace", previousResMeetingPlace);
			request.setAttribute("previousResHelperName", previousResHelperName);
			request.setAttribute("previousResFlag", previousResFlag);
			request.setAttribute("previousResPic", previousResPic);

			forward.setRedirect(false);
			forward.setPath("/client_reservation.jsp");

			return forward;
		}
	}

}
