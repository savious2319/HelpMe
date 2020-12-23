package com.helpme.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.helpme.domain.ClientVO;
import com.helpme.domain.HelperVO;
import com.helpme.domain.Helper_CertificateVO;
import com.helpme.domain.Helper_LanguagesVO;
import com.helpme.domain.Helper_PicsVO;
import com.helpme.domain.Helper_SpecialtyVO;
import com.helpme.domain.ReservationVO;
import com.helpme.domain.ScheduleVO;
import com.helpme.service.ClientService;
import com.helpme.service.HelperService;
import com.helpme.service.RatingCntService;
import com.helpme.service.ReservationService;
import com.helpme.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/")
@AllArgsConstructor
@Log4j
public class HelpMeController {

	private ClientService client_service;
	private ReservationService res_service;
	private HelperService helper_service;
	private RatingCntService rating_service;
	private ScheduleService schedule_service;

	//메인 페이지
	@GetMapping("/home")
	public String mainPage() {
		log.info("Main page");

		return "main_Default";
	}

	//로그인, 회원가입, 주소검색 페이지
	@GetMapping({"/login", "/signup", "/jusoPopup"})
	public void loginPage() {
		log.info("Login page");
		log.info("Signup page");
		log.info("jusoPopup");
	}

	//로그아웃 
	@GetMapping("/logout")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.invalidate();

		return "main_Default";
	}

	//로그인 후 페이지
	@GetMapping("/main_LogIn")
	public void main_LogIn(@ModelAttribute("loginAs") String loginAs) {
		log.info("main_LogIn page");
	}

	//고객 프로필 수정 페이지
	@GetMapping("/client/updates")
	public void updates(@ModelAttribute("loginAs") String loginAs) {
		log.info("Client Updates page");

	}

	//고객 포인트 페이지
	@GetMapping("/client/points")
	public String points(HttpServletRequest request, @ModelAttribute("loginAs") String loginAs, Model model) {

		String client_id = (String) request.getSession().getAttribute("session_id");

		if (client_id == null) {

			return "/client/points";
		} else {

			// 포인트, 서비스, 날짜, 시작, 끝 시간
			int client_points = 0;
			int client_no = 0;

			for (ClientVO c_vo : client_service.getDetailById(client_id)) {
				client_points = c_vo.getAvailablePoints();
				client_no = c_vo.getClientNo();
				log.info("client_points : " + client_points);
				log.info("client_no : " + client_no);
			}

			String meetingStart = "";
			String meetingEnd = "";

			ArrayList<String> resDate = new ArrayList<>();
			ArrayList<String> start = new ArrayList<>();
			ArrayList<String> end = new ArrayList<>();
			ArrayList<String> points_spent = new ArrayList<>();
			ArrayList<String> service = new ArrayList<>();

			for (ReservationVO r_vo : res_service.getReservationByClientNo(client_no)) {
				// 2020-11-10 00:00:00
				String[] calendar = r_vo.getMeetingDate().split(" ");

				String[] dateSplit = calendar[0].split("-");

				String date = dateSplit[1] + "/" + dateSplit[2] + "/" + dateSplit[0];

				log.info("date : " + date);

				// 예약날짜 추가
				resDate.add(date);

				meetingStart = r_vo.getStartTime() + "";
				meetingEnd = r_vo.getEndTime() + "";

				if (meetingStart.contains(".5")) {
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":30";
				} else {
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":00";
				}

				// 시작 시간 추가
				start.add(meetingStart);

				if (meetingEnd.contains(".5")) {
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":30";
				} else {
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":00";
				}

				// 끝 시간 추가
				end.add(meetingEnd);

				// 사용한 포인트 추가
				points_spent.add(r_vo.getPointsSpent() + "");

				// 사용한 서비스 추가
				service.add(r_vo.getService());
			}

			// 고객 현재 포인트에서 사용한 서비스 포인트 차감
			for (int i = 0; i < points_spent.size(); i++) {
				client_points -= Integer.parseInt(points_spent.get(i));
			}

			log.info("resInfo size : " + res_service.getReservationByClientNo(client_no).size());

			model.addAttribute("clientId", client_id);
			model.addAttribute("loginAs", request.getParameter("loginAs"));
			model.addAttribute("client_points", client_points);
			model.addAttribute("resInfo", res_service.getReservationByClientNo(client_no));
			model.addAttribute("resDate", resDate);
			model.addAttribute("start_time", start);
			model.addAttribute("end_time", end);

			return "client/points";
		}
	}

	//고객 예약 현황 페이지
	@GetMapping("/client/reservation")
	public String reservation(HttpServletRequest request, @ModelAttribute("loginAs") String loginAs, Model model)
			throws Exception {
		log.info("Client Reservation Page");

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

		String client_id = (String) request.getSession().getAttribute("session_id");

		if (client_id == null) {
			return "/client/reservation";
		} else {

			for (ClientVO client : client_service.getDetailById(client_id)) {
				client_no = client.getClientNo();
			}

			// yyyyMMdd로 날짜 형식을 지정한다
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

			// 오늘날짜를 sdf 형식으로 바꿔 now 변수에 저장한다
			String now = sdf.format(new Date());

			HashMap<String, Object> data = new HashMap<>();

			// 현재 날짜 또는 현재 날짜 이후에 예약된 정보들을 저장하기 위한 list
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

			// 현재 날짜 이전에 예약된 정보들을 저장하기 위한 list
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

			// 예약한 헬퍼 아이디를 저장하기 위한 list
			ArrayList<String> helperId = new ArrayList<>();

			// HelperDAO h_dao = new HelperDAO();

			// 고객 번호로 예약 정보 가져오기
			for (ReservationVO r_vo : res_service.getReservationByClientNo(client_no)) {
				meetingDate = r_vo.getMeetingDate();
				helper_id = r_vo.getHelperId();
				meetingStart = r_vo.getStartTime() + "";
				meetingEnd = r_vo.getEndTime() + "";
				meetingPlace = r_vo.getMeetingPlace();
				points = r_vo.getPointsSpent();
				service = r_vo.getService();

				// 예약된 모든 헬퍼 아이디 추가
				helperId.add(helper_id);

				data.put("helper_id", helper_id);
				data.put("client_no", client_no);

				// 헬퍼 이름 & 나라 국기 url 정보 담기
				for (String id : helperId) {

					for (HelperVO h_vo : helper_service.getDetail(id)) {
						helper_name = h_vo.getName();
						flag_url = h_vo.getFlagUrl();
						kakao_url = h_vo.getKakaoUrl();
					}
				}

				// 헬퍼 사진 파일경로 담기
				for (String id : helperId) {

					for (Helper_PicsVO hp_vo : helper_service.getPics(id)) {
						helper_pic = hp_vo.getMainFilename();
					}
				}

				// MM/dd/yyyy 형식으로 날짜를 가공하기
				String[] calendar1 = meetingDate.split(" ");
				String[] dateSplit = calendar1[0].split("-");
				String date = dateSplit[1] + "/" + dateSplit[2] + "/" + dateSplit[0];

				// 만약 가져온 시작 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingStart
				// 변수에 저장한다
				if (meetingStart.contains(".5")) {
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":30";
				} else {
					// .5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingStart에 변수에 저장한다
					meetingStart = meetingStart.substring(0, meetingStart.indexOf(".")) + ":00";
				}

				// 만약 가져온 끝 시간에 .5가 포함된다면 예를 들어 9.5라면 .5를 제거하고 9뒤에 :30를 붙여 9:30을 meetingEnd 변수에
				// 저장한다
				if (meetingEnd.contains(".5")) {
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":30";
				} else {
					// .5가 포함되지않았다면 뒤에 :00를 붙여 (예를 들어 9:00) meetingEnd에 변수에 저장한다
					meetingEnd = meetingEnd.substring(0, meetingEnd.indexOf(".")) + ":00";
				}

				// 예약된 날짜와 현재 날짜를 비교하기 위한 설정
				// yyyy/MM/dd 형식으로 날짜를 가공하기
				String[] calendar2 = meetingDate.split(" ");
				String[] compareSplit = calendar2[0].split("-");
				String compare = compareSplit[0] + compareSplit[1] + compareSplit[2];

				// 예약 날짜와 현재 날짜를 Date 타입으로 파싱한다
				Date resDate = sdf.parse(compare);
				Date today = sdf.parse(now);

				// 밀리초로 환산해 예약 날짜와 현재 날짜의 차를 구한다
				long diff = resDate.getTime() - today.getTime();

				// 구한 차를 요일로 환산한다
				long diffDays = diff / (24 * 60 * 60 * 1000);

				// 만약 결과가 0 또는 0 보다 크다면 아직 현재 진행중인 예약이다
				if (diffDays == 0 || diffDays > 0) {

					// 현재 진행중인 예약 정보들을 저장한다
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

					// 총 몇개의 예약이 진행중인 지 알기 위해 if문에 들어올때마다 1씩 증가시킨다
					res_cnt += 1;

				} else {
					// 고객이 한번도 헬퍼 평점을 매기지않았다면 if문에 들어간다
					if (rating_service.getCnt(data) == null) {

						// 고객이 헬퍼 한명씩만 평점을 매길 수 있도록 카운트를 등록한다
						rating_service.insertCnt(data);
					}

					// 이전 예약 정보들을 저장한다
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

			// 응답페이지로 전달하기
			model.addAttribute("clientId", client_id);

			model.addAttribute("currentHelperId", currentHelperId);
			model.addAttribute("currentResDate", currentResDate);
			model.addAttribute("currentStartTime", currentStartTime);
			model.addAttribute("currentEndTime", currentEndTime);
			model.addAttribute("currentResPoints", currentResPoints);
			model.addAttribute("currentService", currentService);
			model.addAttribute("currentResMeetingPlace", currentResMeetingPlace);
			model.addAttribute("currentResHelperName", currentResHelperName);
			model.addAttribute("currentResFlag", currentResFlag);
			model.addAttribute("currentResPic", currentResPic);
			model.addAttribute("currentResCnt", res_cnt);
			model.addAttribute("openChat_url", openChat_url);

			model.addAttribute("previousHelperId", previousHelperId);
			model.addAttribute("previousResDate", previousResDate);
			model.addAttribute("previousStartTime", previousStartTime);
			model.addAttribute("previousEndTime", previousEndTime);
			model.addAttribute("previousResPoints", previousResPoints);
			model.addAttribute("previousService", previousService);
			model.addAttribute("previousResMeetingPlace", previousResMeetingPlace);
			model.addAttribute("previousResHelperName", previousResHelperName);
			model.addAttribute("previousResFlag", previousResFlag);
			model.addAttribute("previousResPic", previousResPic);

			return "/client/reservation";
		}
	}

	//헬퍼 스케줄 페이지
	@GetMapping("/helper/schedule")
	public String schedule(HttpServletRequest request, Model model) throws Exception {

		String helper_id = (String) request.getSession().getAttribute("session_id");

		if (helper_id == null) {

			return "/helper/schedule";
		} else {

			// 일하지않는 요일 free_days에 저장
			ArrayList<String> free_days = new ArrayList<>();
			String days = "1234567";
			String workingDays = "";

			for (ScheduleVO s_vo : schedule_service.getSchedule(helper_id)) {
				workingDays += s_vo.getAvailDay() + "";
			}

			for (int i = 0; i < days.length(); i++) {
				if (!workingDays.contains(days.charAt(i) + "")) {
					free_days.add(days.charAt(i) + "");
				}
			}

			// 근무시작 시간, 끝 시간 문자열로 저장
			// 9.0 -> 9:00
			// 9.5 -> 9:30
			ArrayList<String> start = new ArrayList<>();
			ArrayList<String> end = new ArrayList<>();

			for (ScheduleVO s_vo : schedule_service.getSchedule(helper_id)) {
				String start_time = s_vo.getStartTime() + "";

				if (start_time.contains(".5")) {
					start_time = start_time.substring(0, start_time.indexOf(".")) + ":30";
				} else {
					start_time = start_time.substring(0, start_time.indexOf(".")) + ":00";
				}

				start.add(start_time);

			}

			for (ScheduleVO s_vo : schedule_service.getSchedule(helper_id)) {
				String end_time = s_vo.getEndTime() + "";

				if (end_time.contains(".5")) {
					end_time = end_time.substring(0, end_time.indexOf(".")) + ":30";
				} else {
					end_time = end_time.substring(0, end_time.indexOf(".")) + ":00";
				}

				end.add(end_time);
			}

			List<ReservationVO> reservation = res_service.getReservationByHelperId(helper_id);

			int client_no = 0, pointsSpent = 0, res_no = 0;
			String resDate = "", resStart = "", resEnd = "", client_name = "", meetingArea = "", resStatus = "",
					service = "";

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String now = sdf.format(new Date());

			ArrayList<Integer> resNoList = new ArrayList<>();
			ArrayList<Integer> clientNoList = new ArrayList<>();
			ArrayList<String> resStartList = new ArrayList<>();
			ArrayList<String> resEndList = new ArrayList<>();
			ArrayList<String> resDateList = new ArrayList<>();
			ArrayList<String> clientNameList = new ArrayList<>();
			ArrayList<String> meetingAreaList = new ArrayList<>();
			ArrayList<String> serviceList = new ArrayList<>();
			ArrayList<Integer> pointsSpentList = new ArrayList<>();
			ArrayList<String> resStatusList = new ArrayList<>();

			if (!reservation.isEmpty()) {

				log.info("reservation.isEmpty() : " + reservation.isEmpty());
				for (ReservationVO r_vo : res_service.getReservationByHelperId(helper_id)) {
					client_no = r_vo.getClientNo();
					res_no = r_vo.getResNo();
					resStart = r_vo.getStartTime() + "";
					resEnd = r_vo.getEndTime() + "";
					resDate = r_vo.getMeetingDate();
					meetingArea = r_vo.getMeetingArea();
					resStatus = r_vo.getResStatus();
					pointsSpent = r_vo.getPointsSpent();
					service = r_vo.getService();

					for (ClientVO c_vo : client_service.getDetailByNum(client_no)) {
						client_name = c_vo.getName();
					}

					if (resStart.contains(".5")) {
						resStart = resStart.substring(0, resStart.indexOf(".")) + ":30";
					} else {
						resStart = resStart.substring(0, resStart.indexOf(".")) + ":00";
					}

					if (resEnd.contains(".5")) {
						resEnd = resEnd.substring(0, resEnd.indexOf(".")) + ":30";
					} else {
						resEnd = resEnd.substring(0, resEnd.indexOf(".")) + ":00";
					}

					String[] data = resDate.split(" ");
					String[] dateSplit = data[0].split("-");

					String date = dateSplit[1] + "/" + dateSplit[2] + "/" + dateSplit[0];

					log.info("res_no : " + res_no);
					log.info("client_no : " + client_no);
					log.info("client_name : " + client_name);
					log.info("resDate : " + date);
					log.info("resStart : " + resStart);
					log.info("resEnd : " + resEnd);
					log.info("meetingAre : " + meetingArea);
					log.info("pointsSpent : " + pointsSpent);
					log.info("resStatus : " + resStatus);
					log.info("service : " + service);

					// 오늘 날짜와 비교해서 지난 예약이면 RES_STATUS를 done 이라고 고침
					Date res_date = sdf.parse(data[0]);
					Date today = sdf.parse(now);

					long diff = res_date.getTime() - today.getTime();

					long diffDays = diff / (24 * 60 * 60 * 1000);

					if (diffDays < 0) {
						resStatus = "done";
					}

					resNoList.add(res_no);
					clientNoList.add(client_no);
					resStartList.add(resStart);
					resEndList.add(resEnd);
					resDateList.add(date);
					clientNameList.add(client_name);
					meetingAreaList.add(meetingArea);
					pointsSpentList.add(pointsSpent);
					resStatusList.add(resStatus);
					serviceList.add(service);

				}

			}
			model.addAttribute("helperId", helper_id);

			model.addAttribute("resNo", resNoList);
			model.addAttribute("clientNo", clientNoList);
			model.addAttribute("clientName", clientNameList);
			model.addAttribute("resDate", resDateList);
			model.addAttribute("resStart", resStartList);
			model.addAttribute("resEnd", resEndList);
			model.addAttribute("meetingArea", meetingAreaList);
			model.addAttribute("pointsSpent", pointsSpentList);
			model.addAttribute("resStatus", resStatusList);
			model.addAttribute("service", serviceList);

			model.addAttribute("day", schedule_service.getSchedule(helper_id));
			model.addAttribute("startTime", start);
			model.addAttribute("endTime", end);
			model.addAttribute("freeDays", free_days);
			model.addAttribute("helperName", helper_service.getName(helper_id));

			return "/helper/schedule";
		}
	}

	//헬퍼 언어, 서비스 페이지
	@GetMapping("helper/about")
	public String profileAbout(HttpServletRequest request, Model model) {
		log.info("Helper About");

		String helper_id = (String) request.getSession().getAttribute("session_id");

		if (helper_id == null) {
			return "/helper/profile_about";

		} else {

			// 헬퍼가 구사하는 언어를 제외한 나머지 언어를 저장하기 위한 list
			ArrayList<String> addLanguages = new ArrayList<>();

			// 헬퍼가 제공하는 서비스를 제외한 나머지 서비스를 저장하기 위한 list
			ArrayList<String> addServices = new ArrayList<>();

			// 헬퍼가 구사하는 언어를 저장할 문자열 변수 초기화
			String helperServices = "";

			// 헬퍼가 제공하는 서비스를 저장할 문자열 변수 초기화
			String helperLanguages = "";

			// 헬퍼가 구사하는 모든 언어 담기
			List<Helper_LanguagesVO> hl_vo = helper_service.getLanguages(helper_id);

			// 헬퍼가 제공하는 모든 서비스 담기
			List<Helper_SpecialtyVO> hs_vo = helper_service.getSpecialty(helper_id);

			// 헬퍼가 구사하는 언어 문자열로 연결
			for (int i = 0; i < hl_vo.size(); i++) {
				if ((i + 1) == hl_vo.size()) {
					helperLanguages += hl_vo.get(i).getLanguage();
				} else if (hl_vo.size() == 1) {
					helperLanguages = hl_vo.get(i).getLanguage();
				} else {
					helperLanguages += hl_vo.get(i).getLanguage() + ",";
				}
			}

			// 헬퍼가 제공하는 서비스 문자열로 연결
			for (int i = 0; i < hs_vo.size(); i++) {
				if ((i + 1) == hs_vo.size()) {
					helperServices += hs_vo.get(i).getSpecializedField();
				} else if (hs_vo.size() == 1) {
					helperServices = hs_vo.get(i).getSpecializedField();
				} else {
					helperServices += hs_vo.get(i).getSpecializedField() + ",";
				}
			}

			String[] languages = { "Afrikaans", "Albanian", "Arabic", "Armenian", "Basque", "Bengali", "Bulgarian",
					"Catalan", "Cambodian", "Chinese", "Croatian", "Czech", "Danish", "Dutch", "English", "Estonian",
					"Fiji", "Finnish", "French", "Georgian", "German", "Greek", "Gujarati", "Hebrew", "Hindi",
					"Hungarian", "Icelandic", "Indonesian", "Irish", "Italian", "Japanese", "Javanese", "Korean",
					"Latin", "Latvian", "Lithuanian", "Macedonian", "Malay", "Malayalam", "Maltese", "Maori", "Marathi",
					"Mongolian", "Nepali", "Norwegian", "Persian", "Polish", "Portuguese", "Punjabi", "Quechua",
					"Romanian", "Russian", "Samoan", "Serbian", "Slovak", "Slovenian", "Spanish", "Swahili", "Swedish",
					"Tamil", "Tatar", "Telugu", "Thai", "Tibetan", "Tonga", "Turkish", "Ukrainian", "Urdu", "Uzbek",
					"Vietnamese", "Welsh", "Xhosa" };

			// 헬퍼가 구사하는 언어를 제외한 다른 언어들을 addLanguages에 저장하기
			for (int i = 0; i < languages.length; i++) {
				if ((helperLanguages).contains(languages[i])) {
					continue;
				} else {
					addLanguages.add(languages[i]);
				}
			}

			String[] services = { "Translation", "Government Service", "Hospital", "Travel", "Food", "Tax Accounting",
					"Housing", "Shopping" };

			// 헬퍼가 제공하는 서비스 외의 서비스를 addServices에 저장하기
			for (int i = 0; i < services.length; i++) {
				if ((helperServices).contains(services[i])) {
					continue;
				} else {
					addServices.add(services[i]);
				}
			}

			log.info("helper languages : " + helperLanguages);
			log.info("helper services : " + helperServices);

			for (String string : addLanguages) {
				log.info(string);
			}

			for (String string : addServices) {
				log.info(string);
			}

			// 응답페이지로 전달하기
			model.addAttribute("helperId", helper_id);
			model.addAttribute("helper", helper_service.getDetail(helper_id));
			model.addAttribute("language", helper_service.getLanguages(helper_id));
			model.addAttribute("specialty", helper_service.getSpecialty(helper_id));
			model.addAttribute("languagesList", addLanguages);
			model.addAttribute("servicesList", addServices);

			return "/helper/profile_about";
		}
	}

	//헬퍼 사진 페이지
	@GetMapping("helper/photos")
	public String photos(HttpServletRequest request, Model model) {
		String helper_id = (String) request.getSession().getAttribute("session_id");

		if (helper_id == null) {

			return "/helper/profile_photos";
		} else {

			String main_pic = "", pic1 = "", pic2 = "", pic3 = "", pic4 = "", pic5 = "";

			for (Helper_PicsVO hp_vo : helper_service.getPics(helper_id)) {
				main_pic = hp_vo.getMainFilename();
				pic1 = hp_vo.getPic1Filename();
				pic2 = hp_vo.getPic2Filename();
				pic3 = hp_vo.getPic3Filename();
				pic4 = hp_vo.getPic4Filename();
				pic5 = hp_vo.getPic5Filename();
			}

			log.info("main_pic : " + main_pic);
			log.info("pic1 : " + pic1);
			log.info("pic2 : " + pic2);
			log.info("pic3 : " + pic3);
			log.info("pic4 : " + pic4);
			log.info("pic5 : " + pic5);

			model.addAttribute("helperId", helper_id);
			model.addAttribute("main_pic", main_pic);
			model.addAttribute("pic1", pic1);
			model.addAttribute("pic2", pic2);
			model.addAttribute("pic3", pic3);
			model.addAttribute("pic4", pic4);
			model.addAttribute("pic5", pic5);

			return "/helper/profile_photos";
		}
	}

	//헬퍼 소개 페이지
	@GetMapping("helper/description")
	public String description(HttpServletRequest request, Model model) {

		String helper_id = (String) request.getSession().getAttribute("session_id");

		// 만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {

			return "/helper/profile_description";
		} else {

			// 헬퍼이름, 소개글 제목, 소개글, 헬퍼 사진 파일경로를 저장할 변수 초기화
			String name = "";
			String title = "";
			String content = "";
			String fileName = "";

			for (HelperVO h_vo : helper_service.getDetail(helper_id)) {
				title = h_vo.getIntroTitle();
				content = h_vo.getDescription();
				name = h_vo.getName();
			}

			for (Helper_PicsVO hp_vo : helper_service.getPics(helper_id)) {
				fileName = hp_vo.getMainFilename();
			}

			// DB에서 조회한 content의 <br>을 모두 \n으로 수정 후 textarea에 대입
			content = content.replace("<br>", "\n");

			// 응답페이지에 전송하기
			model.addAttribute("helperId", helper_id);
			model.addAttribute("name", name);
			model.addAttribute("intro", title);
			model.addAttribute("description", content);
			model.addAttribute("pic", fileName);

			return "/helper/profile_description";
		}
	}

	//헬퍼 이력 페이지
	@GetMapping("helper/background")
	public String background(HttpServletRequest request, Model model) {

		String helper_id = (String) request.getSession().getAttribute("session_id");

		// 만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {

			return "/helper/profile_background";
		} else {
			
			List<Helper_CertificateVO> dateObtained = helper_service.getCertificate(helper_id);
			
			// 헬퍼의 자격증 취득 날짜 형식을 가공하기 위한 작업
			for (Helper_CertificateVO hc_vo : dateObtained) {
				if (hc_vo != null) {
					log.info("DateObtained : " + hc_vo.getDateObtained());
					String[] date = hc_vo.getDateObtained().split(" ");
					log.info("DateObtained Split: " + date[0]);
					hc_vo.setDateObtained(date[0]);
					log.info("DateObtained after split : " + hc_vo.getDateObtained());
					hc_vo.setDateObtained(date[0]);
				}
			}
		
			for (Helper_CertificateVO hc_vo : dateObtained) {
				log.info(hc_vo);
			}
			
			// 헬퍼의 이력 정보를 응답페이지로 전달하기
			model.addAttribute("certificates", dateObtained);
			model.addAttribute("helperId", helper_id);
			model.addAttribute("education", helper_service.getEducation(helper_id));
			model.addAttribute("work", helper_service.getWork(helper_id));

			return "/helper/profile_background";
		}
	}

	//헬퍼 비밀변호 변경 페이지
	@GetMapping("helper/security")
	public void security(@RequestParam("helperId") String helperId, Model model) {
		log.info("Helper security");
		model.addAttribute("helperId", helperId);
	}

}
