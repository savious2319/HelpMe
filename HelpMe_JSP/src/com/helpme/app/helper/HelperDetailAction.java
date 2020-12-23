package com.helpme.app.helper;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.helper.dao.HelperDAO;

public class HelperDetailAction implements Action{
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      ActionForward forward = new ActionForward();
      HelperDAO h_dao = new HelperDAO();
      
      String helper_id = request.getParameter("helper_id");
      String loginAs = request.getParameter("loginAs");
           
      request.setAttribute("loginAs", loginAs);	//로그인 유저 확인
      request.setAttribute("helperList", h_dao.getHelperDetail(helper_id));	//헬퍼 상세정보 가져오기
      request.setAttribute("helperLanguages_1", h_dao.getLanguagesDetail_1(helper_id));	//헬퍼상단 언어 가져오기
      request.setAttribute("helperLanguages", h_dao.getLanguagesDetail(helper_id));	//헬퍼 하단 언어 가져오기
      request.setAttribute("helperEducation", h_dao.getEducationDetail(helper_id));	//헬퍼 학력 가져오기
      request.setAttribute("helperWork", h_dao.getWorkDetail(helper_id));	//헬퍼 경력 가져오기
      request.setAttribute("helperCertificate", h_dao.getCertificate(helper_id));	//헬퍼 자격증 가져오기
      request.setAttribute("helperMainPicture", h_dao.getPicturesMainDetail(helper_id));	//헬퍼 메인사진 가져오기
      request.setAttribute("helperPictures", h_dao.getPicturesDetail(helper_id));	//헬퍼 사진리스트 가져오기
      
      forward.setRedirect(false);
      forward.setPath("/helper_detail.jsp");
      
      return forward;
   }
}