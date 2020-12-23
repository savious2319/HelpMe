package com.helpme.app.helper;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_LanguagesVO;
import com.helpme.app.helper.vo.Helper_SpecialtyVO;

public class HelperAboutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//리턴타입(전송방식, 응답경로)을 설정한다
		ActionForward forward = new ActionForward();

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		HelperDAO h_dao = new HelperDAO();

		//만약 고객 아이디가 널이면 forward방식으로 아래 경로로 이동한다
		if (helper_id == null) {
			forward.setRedirect(false);
			forward.setPath("/helper_profile_about.jsp");

			return forward;

		} else {
			
			//헬퍼가 구사하는 언어를 제외한 나머지 언어를 저장하기 위한 list
			ArrayList<String> addLanguages = new ArrayList<>();
			
			//헬퍼가 제공하는 서비스를 제외한 나머지 서비스를 저장하기 위한 list
			ArrayList<String> addServices = new ArrayList<>();
			
			//헬퍼가 구사하는 언어를 저장할 문자열 변수 초기화
			String helperServices = "";
			
			//헬퍼가 제공하는 서비스를 저장할 문자열 변수 초기화
			String helperLanguages = "";

			//헬퍼가 구사하는 모든 언어 담기
			List<Helper_LanguagesVO> hl_vo = h_dao.getLanguage(helper_id);
			
			//헬퍼가 제공하는 모든 서비스 담기
			List<Helper_SpecialtyVO> hs_vo = h_dao.getSpecialty(helper_id);

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
					helperServices += hs_vo.get(i).getSpecialized_field();
				} else if (hs_vo.size() == 1) {
					helperServices = hs_vo.get(i).getSpecialized_field();
				} else {
					helperServices += hs_vo.get(i).getSpecialized_field() + ",";
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

			//응답페이지로 전달하기
			request.setAttribute("helperId", helper_id);
			request.setAttribute("helperDetail", h_dao.getHelperDetail(helper_id));
			request.setAttribute("helperLanguage", h_dao.getLanguage(helper_id));
			request.setAttribute("helperSpecialty", h_dao.getSpecialty(helper_id));
			request.setAttribute("languagesList", addLanguages);
			request.setAttribute("servicesList", addServices);

			forward.setRedirect(false);
			forward.setPath("/helper_profile_about.jsp");

			return forward;
		}
	}
}
