package com.helpme.app.helper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;
import com.helpme.app.helper.vo.Helper_CertificateVO;

public class HelperCertificateAddOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전달받은 파라미터가 한글일 경우 문자깨짐 방지
		request.setCharacterEncoding("UTF-8");

		//세션에 저장된 헬퍼 아이디를 저장한다
		String helper_id = (String) request.getSession().getAttribute("session_id");
		
		//새로 작성한 자격증과 취득일을 전달받는다
		String license = request.getParameter("license");
		String date_obtained = request.getParameter("date_obtained");
		
		String [] calendar = date_obtained.split(" ");
		
		//switch문을 통해서 자격증 취득 달을 문자열 숫자로 바꾸주는 작업
		String month = "";
		
		switch(calendar[1]) {
		case "Jan": month = "01"; break;
		case "Feb": month = "02"; break;
		case "Mar": month = "03"; break;
		case "Apr": month = "04"; break;
		case "May": month = "05"; break;
		case "Jun": month = "06"; break;
		case "Jul": month = "07"; break;
		case "Aug": month = "08"; break;
		case "Sep": month = "09"; break;
		case "Oct": month = "10"; break;
		case "Nov": month = "11"; break;
		case "Dec": month = "12"; break;
		}
		
		//취득일을 가공하는 작업
		String date = calendar[3]+"/"+month+"/"+calendar[2];
		
		HelperDAO h_dao = new HelperDAO();
		
		//생성자를 통해 헬퍼의 자격증과 취득일을 저장한다
		Helper_CertificateVO hc_vo = new Helper_CertificateVO(helper_id, license, date);
		
		//자격증과 취득일을 저장한다
		h_dao.insertCertificate(hc_vo);
		
		
		return null;
	}

}
