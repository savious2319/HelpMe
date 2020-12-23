package com.helpme.app.client;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helpme.action.Action;
import com.helpme.action.ActionForward;
import com.helpme.app.client.dao.ClientDAO;
import com.helpme.app.helper.dao.HelperDAO;

public class ClientCheckIdOkAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      response.setCharacterEncoding("UTF-8");
      
      String id = request.getParameter("client_id");
      ClientDAO c_dao = new ClientDAO();
      HelperDAO h_dao = new HelperDAO();
      
      PrintWriter out = response.getWriter();
      //out으로 작성할 문자열 환경을 text, html로 잡아준다.
      response.setContentType("text/html;charset=utf-8");
      if(c_dao.checkId(id) || h_dao.checkId(id)) {
         //중복
         out.println("not-ok");
      }else {
         //중복 안 됨
         //System.out.println("들어옴");
         out.println("ok");
      }
      out.close();
      //비동기 통신으로 요청하기 때문에 응답 페이지는 필요하지 않다.
      return null;
   }

}
