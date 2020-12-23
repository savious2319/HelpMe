package com.helpme.app.helper;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.ActionForward;


public class HelperFrontController extends HttpServlet {
	
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청한 URI
		String requestURI = req.getRequestURI();
		
		//반복되는 기본 경로(www.naver.com, board_mvc2 등)
		String contextPath = req.getContextPath();
		
		//요청한 URI에서 반복되는 기본 경로를 제외한 경로(사용자 요청 종류를 확인할 수 있다)
		String command = requestURI.substring(contextPath.length());
		
		//전송방식, 응답경로가 선언된 클래스
		ActionForward forward = null;
		
		//분기 처리(사용자의 요청에 맞는 응답을 위함)
		switch(command) {
		case "/search.he": //헬퍼 찾기
			try {
				//forward = new HelperSearchOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
				
		case "/helper/HelperLoginOk.he": //헬퍼 로그인
			try {
				forward = new HelperLoginOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperAboutOk.he": //헬퍼 마이 페이지 About
			try {
				forward = new HelperAboutOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperPhotosOk.he": //헬퍼 마이 페이지 Photos
			try {
				forward = new HelperPhotosOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperSetAsMainPhotoOk.he": //헬퍼 마이 페이지 Photos (Main Picture로 바꿀 떄)
			try {
				forward = new HelperSetAsMainPhotoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperChangePhotoOk.he": //헬퍼 마이 페이지 Photos(사진 바꿀 때)
			try {
				forward = new HelperChangePhotoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperDeletePhotoOk.he": //헬퍼 마이 페이지 Photos(사진 삭제할 때)
			try {
				forward = new HelperDeletePhotoOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperDescriptionOk.he": //헬퍼 마이 페이지 Description
			try {
				forward = new HelperDescriptionOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperBackgroundOk.he": //헬퍼 마이 페이지 Background
			try {
				forward = new HelperBackgroundOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperEducationAddOk.he": //헬퍼 학력 추가할 때
			try {
				forward = new HelperEducationAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperEducationDeleteOk.he": //헬퍼 학력 삭제할 때
			try {
				forward = new HelperEducationDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperWorkAddOk.he": //헬퍼 경력 추가할 때
			try {
				forward = new HelperWorkAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperWorkDeleteOk.he": //헬퍼 경력 삭제할떄
			try {
				forward = new HelperWorkDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperCertificateAddOk.he": //헬퍼 자격증 추가할 때
			try {
				forward = new HelperCertificateAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperCertificateDeleteOk.he": //헬퍼 자격증 삭제할 때
			try {
				forward = new HelperCertificateDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperSpecialtyAddOk.he": //헬퍼 서비스 이름 추가할 때
			try {
				forward = new HelperSpecialtyAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperSpecialtyDeleteOk.he": //헬퍼 서비스 이름 삭제할 때
			try {
				forward = new HelperSpecialtyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperLanguageAddOk.he": //헬퍼 언어 추가할 때
			try {
				forward = new HelperLanguageAddOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperLanguageDeleteOk.he": //헬퍼 언어 삭제할 때
			try {
				forward = new HelperLanguageDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperDescriptionModifyOk.he": //헬퍼 소개글 수정할 때
			try {
				forward = new HelperDescriptionModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperChangePasswordOk.he": //헬퍼 패스워드 수정할 때
			try {
				forward = new HelperChangePasswordOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/helper/HelperRateOk.he": //헬퍼 평점 매겨질 때
			try {
				forward = new HelperRateOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		//김시운 담당
		case "/helper/search.he": //조건검색헬퍼 찾기
			try {
				forward = new HelperSearchAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
				
		case "/helper/all.he": //모든헬퍼 찾기
			try {
				forward = new AllHelperAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/helper/detail.he": //헬퍼 상세정보
			try {
				forward = new HelperDetailAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		
		default: // 비정상적인 경로일 경우(잘못된 경로일 경우)
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/404.jsp");
		}
		
		//forward가 null이 아니라면, 응답을 이 곳에서 처리하겠다는 의미이다.
		if(forward != null) {
			if(forward.isRedirect()) {
				//전송방식이 redirect일 경우
				resp.sendRedirect(forward.getPath());
			}else {
				//전송방식이 forward일 경우
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}

