<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<title>Search Helper</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
<link
   href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
   rel="Stylesheet" type="text/css" />
</head>
<style>
.actions ul, li {
   text-align: left;
   display: inline-block;
}

.contact-icons li {
   text-align: center;
}

.links li {
   display: block;
}

ul {
   margin: 0px;
}

#description {
   display: grid;
   grid-template-columns: auto 1fr;
   gap: 24px;
   -webkit-box-pack: start;
   justify-content: start;
   margin-bottom: 32px;
}

.profile_pic {
   width: 160px;
   height: 160px;
   border-radius: 4px;
}

.col-12 {
   text-align: right;
}

.primary {
   width: auto;
}

.helper_name, .helper_price, .helper_rating {
   margin: 0px;
}

.info {
   margin: 0px;
}

#kakao_img {
   float: right;
   margin-left: 30px;
}

#kakao_img_size {
   width: 50px;
   height: 50px;
}

td {
   color: #000000;
   font-size: 25px;
}

#No_Result {
   text-align: center;
   font-size: 100px;
   margin-top: 50px;
}

#version1 {
   display: table;
}

#version2 {
   display: none;
}

/*추가*/
@media screen and (max-width: 2560px) {
   #back-to-top {
      display: inline-block;
      background-color: #51CCA8;;
      width: 50px;
      height: 50px;
      text-align: center;
      border-radius: 4px;
      position: fixed;
      bottom: 30px;
      right: 30px;
      transition: background-color .3s, opacity .5s, visibility .5s;
      opacity: 0;
      visibility: hidden;
      z-index: 1000;
   }
   #back-to-top::after {
      content: "\f077";
      font-family: FontAwesome;
      font-weight: normal;
      font-style: normal;
      font-size: 2em;
      line-height: 50px;
      color: white;
   }
   #back-to-top:hover {
      cursor: pointer;
      background-color: #333;
   }
   #back-to-top:active {
      background-color: #555;
   }
   #back-to-top.show {
      opacity: 1;
      visibility: visible;
   }
   #helper_card {
   margin: 0 auto;
   border: solid 1px;
   border-color: rgba(144, 144, 144, 0.25);
   width: 65%;
   border-radius: 4px;
   margin-top: 2.5rem;
   padding: 1.5rem;
   display: grid;
   grid-template-columns: 199px 1070px 287px;
   gap: 24px;
   -webkit-box-pack: start;
   justify-content: start;
}
}
/*추가*/
@media screen and (max-width: 1920px) {
   .logo {
      margin-top: 7px;
   }
   #helper_card {
   margin: 0 auto;
   border: solid 1px;
   border-color: rgba(144, 144, 144, 0.25);
   width: 65%;
   border-radius: 4px;
   margin-top: 2.5rem;
   padding: 1.5rem;
   display: grid;
   grid-template-columns: 199px 664px 291px;
   gap: 24px;
   -webkit-box-pack: start;
   justify-content: start;
}
   
}
/*추가*/
@media screen and (max-width: 1440px) {
   #version1 {
      display: table;
   }
   #version2 {
      display: none;
   }
   #ui-datepicker-div {
      width: 23%;
   }
   .logo {
      margin-top: 4px;
   }
   #helper_card {
   margin: 0 auto;
   border: solid 1px;
   border-color: rgba(144, 144, 144, 0.25);
   width: 65%;
   border-radius: 4px;
   margin-top: 2.5rem;
   padding: 1.5rem;
   display: grid;
   grid-template-columns: 199px 365px 287px;
   gap: 24px;
   -webkit-box-pack: start;
   justify-content: start;
   }
}

@media screen and (max-width: 1024px) {
   #helper_card {
      grid-template-columns: auto;
   }
   #kakao_img {
      float: none;
      margin-left: unset;
   }
   #kakao_img_size {
      width: 50px;
      height: 50px;
   }
   #datepicker2 {
      margin-left: 33px;
      width: 76%;
   }
   #Area {
      width: 103%;
   }
   #version1 {
      display: table;
   }
   #version2 {
      display: none;
   }
   #ui-datepicker-div {
      width: 33%;
   }
   #kakao_img_size{
   margin-left: 30px;
   }
}
/*추가*/
@media screen and (max-width: 980px) {
   .logo {
      margin-top: 7px;
   }
}
/*추가*/
@media screen and (max-width: 768px) {
   #No_Result {
      text-align: center;
      font-size: 60px;
      margin-top: 50px;
   }
   #datepicker2 {
      margin-left: 33px;
   }
   #category {
      marginf-top: 30px;
   }
   #between {
      margin-top: 30px;
   }
   #Area {
      width: 103%;
   }
   #datepicker2 {
      width: 83%;
   }
   #ui-datepicker-div {
      width: 43%;
      top: 56px !important;
   }
   #list1 {
      width: 33%;
   }
   #list2 {
      width: 33%;
   }
   #list3 {
      width: 34%;
   }
   .logo {
      margin-top: 4px;
   }
}
/*추가*/
@media screen and (max-width: 736px) {
   .logo {
      margin-top: -8px
   }
}
/*추가*/
@media screen and (max-width: 425px) {
   #No_Result {
      text-align: center;
      font-size: 30px;
      margin-top: 50px;
   }
   #datepicker2 {
      width: 98%;
      margin-left: 0px;
   }
   #Area {
      width: 98%;
   }
   #ui-datepicker-div {
      width: 79%;
      top: 389px !important;
   }
   #between {
      margin-top: -15px !important;
   }
   #end_time {
      margin-top: -15px !important;
   }
   #list1 {
      width: 100%;
   }
   #list2 {
      width: 100%;
   }
   #list3 {
      width: 100%;
   }
   .logo {
      margin-top: -4px;
   }
   #kakao_img{
      margin-left: 63px;
   }
}
/*추가*/
@media screen and (max-width: 375px) {
   #Area {
      width: 100%;
   }
   #helper_card {
      grid-template-columns: auto;
   }
   #kakao_img {
      float: none;
      margin-left: unset;
   }
   #kakao_img_size {
      width: 80px;
      height: 80px;
   }
   #ui-datepicker-div {
      width: 90%;
   }
   #between {
      margin-top: -15px !important;
   }
   #end_time {
      margin-top: -15px !important;
   }
   .logo {
      margin-top: -8px;
   }
   #kakao_img_size{
   margin-left: 57px;
   }
}

@media screen and (max-width: 320px) {
   #Area {
      width: 100%;
   }
   #helper_card {
      grid-template-columns: auto;
   }
   #kakao_img {
      float: none;
      margin-left: unset;
   }
   #kakao_img_size {
      width: 80px;
      height: 80px;
   }
   #No_Result {
      text-align: center;
      font-size: 20px;
      margin-top: 50px;
   }
   #version1 {
      display: table;
   }
   #version2 {
      display: none;
   }
   .ui-datepicker {
      width: 102% !important;
      left: -3.9844px !important;
   }
   #between {
      margin-top: -15px !important;
   }
   #end_time {
      margin-top: -15px !important;
   }
}

</style>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="is-preload">

   <c:set var="loginAs" value="${requestScope.loginAs}" />
   <c:set var="h_list" value="${requestScope.helperList}" />
   <c:set var="h_lan" value="${requestScope.helperLanguages}" />
   <c:set var="h_pic" value="${requestScope.helperPicture}" />
   <c:set var="nowPage" value="${requestScope.nowPage}" />
   <c:set var="startPage" value="${requestScope.startPage}" />
   <c:set var="endPage" value="${requestScope.endPage}" />
   <c:set var="totalPage" value="${requestScope.totalPage}" />
   <c:set var="get_Area" value="${requestScope.select_Area}" />
   <c:set var="get_InputDate" value="${requestScope.select_inputdate}" />
   <c:set var="get_Time" value="${requestScope.select_time}" />
   <c:set var="get_Service" value="${requestScope.select_service}" />

   <!-- Header -->
   <header id="header">
      <c:choose>
         <c:when test="${session_id eq null}">
            <a class="logo" href="${pageContext.request.contextPath}/main_Default.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png" /></a>
         </c:when>
         <c:otherwise>
         <c:choose>
         <c:when test="${loginAs eq 'loginAsClient'}">
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp?loginAs=${loginAs}"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:when>
         <c:otherwise>
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:otherwise>
         </c:choose>
         </c:otherwise>
      </c:choose>
      <nav>
         <ul>
            <li><a href="#menu">Menu</a></li>
         </ul>
      </nav>
   </header>

   <a id="back-to-top" style="text-decoration: none"></a>
   <!-- Menu -->

   <c:choose>
      <c:when test="${session_id eq null}">
         <nav id="menu">
            <ul class="links">
               <li><a href="${pageContext.request.contextPath}/signup.jsp"
                  class="button primary">Sign Up</a></li>
               <li><a href="${pageContext.request.contextPath}/login.jsp"
                  class="button">Log In</a></li>
               <li><a
                  href="${pageContext.request.contextPath}/main_Default.jsp">Home</a></li>
               <li><a href="${pageContext.request.contextPath}/login.jsp">My
                     Page</a></li>
               <li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search
                     Helper</a></li>
               <li><a
                  href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper
                     Review Board</a></li>
            </ul>
         </nav>
      </c:when>
      <c:otherwise>
         <nav id="menu">
            <ul class="links">
               <%-- onclick으로 "logoutForm.submit()"을 줘서 ClientLogOutAction으로 간다. --%>
               <li><a href="${pageContext.request.contextPath}/client/ClientLogOut.cl" class="button">Log Out</a></li>
               <!--<li><a href="signup.jsp" class="button primary">Sign Up</a></li>
               <li><a href="login.jsp" class="button">Log In</a></li> -->
               <li><a
                  href="${pageContext.request.contextPath}/main_LogIn.jsp?loginAs=${loginAs}">Home</a></li>
               <c:choose>
                  <c:when test="${loginAs eq 'loginAsClient'}">
                     <li><a
                        href="${pageContext.request.contextPath}/client/ClientReservationOk.cl">My
                           Page</a></li>
                  </c:when>
                  <c:otherwise>
                     <li><a
                        href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc">My
                           Page</a></li>
                  </c:otherwise>
               </c:choose>
               <%-- <li><a href="">My Page</a></li>   --%>
               <li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search
                     Helper</a></li>
               <%-- href="${pageContext.request.contextPath}/BoardList.bo?page=1"를 해야 첫번째 페이지로 이동한다! --%>
               <li><a
                  href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper
                     Review Board</a></li>

            </ul>
         </nav>
      </c:otherwise>
   </c:choose>


   <!-- Main -->
   <form name="helper_search"
      action="${pageContext.request.contextPath}/helper/search.he"
      method="post">
      <div class="inner">
         <div class="row gtr-200">
            <div class="col-4 col-12-medium"
               style="margin: 0 auto; display: table; width: 80%">
               <header class="major"
                  style="text-align: center; margin-top: 5rem; margin-bottom: 3rem">
                  <h1>Search Helper</h1>
               </header>
               <div class="box" style="margin-bottom: 0px">

                  <ul class="actions"
                     style="margin-left: auto; margin-right: auto; display: table">

                     <li><input type="radio" id="translation" name="service"
                        class="service" value="Translation"
                        <c:if test="${requestScope.select_service eq 'Translation'}">checked</c:if>>
                        <label for="translation">Translation</label></li>

                     <li><input type="radio" id="government" name="service"
                        class="service" value="Government Service"
                        <c:if test="${requestScope.select_service eq 'Government Service'}">checked</c:if>>
                        <label for="government">Government Service</label></li>

                     <li><input type="radio" id="housing" name="service"
                        class="service" value="Housing"
                        <c:if test="${requestScope.select_service eq 'Housing'}">checked</c:if>>
                        <label for="housing">Housing</label></li>

                     <li><input type="radio" id="hospital" name="service"
                        class="service" value="Hospital"
                        <c:if test="${requestScope.select_service eq 'Hospital'}">checked</c:if>>
                        <label for="hospital">Hospital</label></li>
                  </ul>

                  <ul class="actions"
                     style="margin-left: auto; margin-right: auto; display: table">
                     <li><input type="radio" id="travel" name="service"
                        class="service" value="Travel"
                        <c:if test="${requestScope.select_service eq 'Travel'}">checked</c:if>>
                        <label for="travel">Travel</label></li>

                     <li><input type="radio" id="tax" name="service"
                        class="service" value="Tax"
                        <c:if test="${requestScope.select_service eq 'Tax'}">checked</c:if>>
                        <label for="tax">Tax Accounting</label></li>

                     <li><input type="radio" id="shopping" name="service"
                        class="service" value="Shopping"
                        <c:if test="${requestScope.select_service eq 'Shopping'}">checked</c:if>>
                        <label for="shopping">Shopping</label></li>

                     <li><input type="radio" id="food" name="service"
                        class="service" value="Food"
                        <c:if test="${requestScope.select_service eq 'Food'}">checked</c:if>>
                        <label for="food">Food</label></li>

                     <li><input type="radio" id="all" name="service"
                        class="service" value="all"
                        <c:if test="${requestScope.select_service eq 'all'}">checked</c:if>>
                        <label for="all">all</label></li>

                  </ul>

                  <ul class="actions" id="version1" style="margin: 0 auto;">
                     <li id="list1"><select name="Area" id="category"
                        class="Area" style="background-color: white">
                           <option value="">- Select Area -</option>
                           <option value="Gangnam-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangnam-gu'}">selected</c:if>>Gangnam-gu</option>
                           <option value="Gangdong-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangdong-gu'}">selected</c:if>>Gangdong-gu</option>
                           <option value="Gangbuk-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangbuk-gu'}">selected</c:if>>Gangbuk-gu</option>
                           <option value="Gangseo-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangseo-gu'}">selected</c:if>>Gangseo-gu</option>
                           <option value="Gwanak-gu"
                              <c:if test="${requestScope.select_Area eq 'Gwanak-gu'}">selected</c:if>>Gwanak-gu</option>
                           <option value="Gwangjin-gu"
                              <c:if test="${requestScope.select_Area eq 'Gwangjin-gu'}">selected</c:if>>Gwangjin-gu</option>
                           <option value="Guro-gu"
                              <c:if test="${requestScope.select_Area eq 'Guro-gu'}">selected</c:if>>Guro-gu</option>
                           <option value="Geumcheon-gu"
                              <c:if test="${requestScope.select_Area eq 'Geumcheon-gu'}">selected</c:if>>Geumcheon-gu</option>
                           <option value="Nowon-gu"
                              <c:if test="${requestScope.select_Area eq 'Nowon-gu'}">selected</c:if>>Nowon-gu</option>
                           <option value="Dobong-gu"
                              <c:if test="${requestScope.select_Area eq 'Dobong-gu'}">selected</c:if>>Dobong-gu</option>
                           <option value="Dongdaemun-gu"
                              <c:if test="${requestScope.select_Area eq 'Dongdaemun-gu'}">selected</c:if>>Dongdaemun-gu</option>
                           <option value="Dongjak-gu"
                              <c:if test="${requestScope.select_Area eq 'Dongjak-gu'}">selected</c:if>>Dongjak-gu</option>
                           <option value="Mapo-gu"
                              <c:if test="${requestScope.select_Area eq 'Mapo-gu'}">selected</c:if>>Mapo-gu</option>
                           <option value="Seodaemun-gu"
                              <c:if test="${requestScope.select_Area eq 'Seodaemun-gu'}">selected</c:if>>Seodaemun-gu</option>
                           <option value="Seocho-gu"
                              <c:if test="${requestScope.select_Area eq 'Seocho-gu'}">selected</c:if>>Seocho-gu</option>
                           <option value="Seongdong-gu"
                              <c:if test="${requestScope.select_Area eq 'Seongdong-gu'}">selected</c:if>>Seongdong-gu</option>
                           <option value="Seongbuk-gu"
                              <c:if test="${requestScope.select_Area eq 'Seongbuk-gu'}">selected</c:if>>Seongbuk-gu</option>
                           <option value="Songpa-gu"
                              <c:if test="${requestScope.select_Area eq 'Songpa-gu'}">selected</c:if>>Songpa-gu</option>
                           <option value="Yangcheon-gu"
                              <c:if test="${requestScope.select_Area eq 'Yangcheon-gu'}">selected</c:if>>Yangcheon-gu</option>
                           <option value="Yeongdeungpo-gu"
                              <c:if test="${requestScope.select_Area eq 'Yeongdeungpo-gu'}">selected</c:if>>Yeongdeungpo-gu</option>
                           <option value="Yongsan-gu"
                              <c:if test="${requestScope.select_Area eq 'Yongsan-gu'}">selected</c:if>>Yongsan-gu</option>
                           <option value="Eunpyeong-gu"
                              <c:if test="${requestScope.select_Area eq 'Eunpyeong-gu'}">selected</c:if>>Eunpyeong-gu</option>
                           <option value="Jongno-gu"
                              <c:if test="${requestScope.select_Area eq 'Jongno-gu'}">selected</c:if>>Jongno-gu</option>
                           <option value="Jung-gu"
                              <c:if test="${requestScope.select_Area eq 'Jung-gu'}">selected</c:if>>>Jung-gu</option>
                           <option value="Jungnang-gu"
                              <c:if test="${requestScope.select_Area eq 'Jungnang-gu'}">selected</c:if>>Jungnang-gu</option>
                     </select></li>


                     <li id="list2"><input name="datepicker" id="datepicker"
                        class="datepicker" type="text"
                        value="${requestScope.select_inputdate}"
                        <%-- <c:if test="${requestScope.select_inputdate ne ''}">$("#datepicker").datepicker( "setDate" , "requestScope.select_inputdate");</c:if> 
                 --%>style="background-color: white" />
                     </li>

                     <li id="list3"><select name="time1" id="category"
                        class="time1" style="background-color: white">
                           <option value="">- Select Time -</option>
                           <option value="morning"
                              <c:if test="${requestScope.select_time eq 'morning'}">selected</c:if>>morning</option>
                           <option value="afternoon"
                              <c:if test="${requestScope.select_time eq 'afternoon'}">selected</c:if>>afternoon</option>
                           <option value="dinner"
                              <c:if test="${requestScope.select_time eq 'dinner'}">selected</c:if>>evening</option>
                     </select>
                  </ul>

                  <ul class="actions" id="version2" style="margin: 0 auto;">
                     <li><select name="Area2" id="category" class="Area"
                        style="background-color: white">
                           <option value="">- Select Area -</option>
                           <option value="Gangnam-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangnam-gu'}">selected</c:if>>Gangnam-gu</option>
                           <option value="Gangdong-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangdong-gu'}">selected</c:if>>Gangdong-gu</option>
                           <option value="Gangbuk-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangbuk-gu'}">selected</c:if>>Gangbuk-gu</option>
                           <option value="Gangseo-gu"
                              <c:if test="${requestScope.select_Area eq 'Gangseo-gu'}">selected</c:if>>Gangseo-gu</option>
                           <option value="Gwanak-gu"
                              <c:if test="${requestScope.select_Area eq 'Gwanak-gu'}">selected</c:if>>Gwanak-gu</option>
                           <option value="Gwangjin-gu"
                              <c:if test="${requestScope.select_Area eq 'Gwangjin-gu'}">selected</c:if>>Gwangjin-gu</option>
                           <option value="Guro-gu"
                              <c:if test="${requestScope.select_Area eq 'Guro-gu'}">selected</c:if>>Guro-gu</option>
                           <option value="Geumcheon-gu"
                              <c:if test="${requestScope.select_Area eq 'Geumcheon-gu'}">selected</c:if>>Geumcheon-gu</option>
                           <option value="Nowon-gu"
                              <c:if test="${requestScope.select_Area eq 'Nowon-gu'}">selected</c:if>>Nowon-gu</option>
                           <option value="Dobong-gu"
                              <c:if test="${requestScope.select_Area eq 'Dobong-gu'}">selected</c:if>>Dobong-gu</option>
                           <option value="Dongdaemun-gu"
                              <c:if test="${requestScope.select_Area eq 'Dongdaemun-gu'}">selected</c:if>>Dongdaemun-gu</option>
                           <option value="Dongjak-gu"
                              <c:if test="${requestScope.select_Area eq 'Dongjak-gu'}">selected</c:if>>Dongjak-gu</option>
                           <option value="Mapo-gu"
                              <c:if test="${requestScope.select_Area eq 'Mapo-gu'}">selected</c:if>>Mapo-gu</option>
                           <option value="Seodaemun-gu"
                              <c:if test="${requestScope.select_Area eq 'Seodaemun-gu'}">selected</c:if>>Seodaemun-gu</option>
                           <option value="Seocho-gu"
                              <c:if test="${requestScope.select_Area eq 'Seocho-gu'}">selected</c:if>>Seocho-gu</option>
                           <option value="Seongdong-gu"
                              <c:if test="${requestScope.select_Area eq 'Seongdong-gu'}">selected</c:if>>Seongdong-gu</option>
                           <option value="Seongbuk-gu"
                              <c:if test="${requestScope.select_Area eq 'Seongbuk-gu'}">selected</c:if>>Seongbuk-gu</option>
                           <option value="Songpa-gu"
                              <c:if test="${requestScope.select_Area eq 'Songpa-gu'}">selected</c:if>>Songpa-gu</option>
                           <option value="Yangcheon-gu"
                              <c:if test="${requestScope.select_Area eq 'Yangcheon-gu'}">selected</c:if>>Yangcheon-gu</option>
                           <option value="Yeongdeungpo-gu"
                              <c:if test="${requestScope.select_Area eq 'Yeongdeungpo-gu'}">selected</c:if>>Yeongdeungpo-gu</option>
                           <option value="Yongsan-gu"
                              <c:if test="${requestScope.select_Area eq 'Yongsan-gu'}">selected</c:if>>Yongsan-gu</option>
                           <option value="Eunpyeong-gu"
                              <c:if test="${requestScope.select_Area eq 'Eunpyeong-gu'}">selected</c:if>>Eunpyeong-gu</option>
                           <option value="Jongno-gu"
                              <c:if test="${requestScope.select_Area eq 'Jongno-gu'}">selected</c:if>>Jongno-gu</option>
                           <option value="Jung-gu"
                              <c:if test="${requestScope.select_Area eq 'Jung-gu'}">selected</c:if>>Jung-gu</option>
                           <option value="Jungnang-gu"
                              <c:if test="${requestScope.select_Area eq 'Jungnang-gu'}">selected</c:if>>Jungnang-gu</option>
                     </select></li>


                     <li><input name="datepicker2" id="datepicker2" type="text"
                        value="-Select Date-" style="background-color: white"></li>
                     <li><select name="time2" id="category"
                        style="background-color: white">
                           <option value="">- Select Time -</option>
                           <option value="morning"
                              <c:if test="${requestScope.select_time eq 'morning'}">selected</c:if>>morning</option>
                           <option value="afternoon"
                              <c:if test="${requestScope.select_Area eq 'afternoon'}">selected</c:if>>afternoon</option>
                           <option value="dinner"
                              <c:if test="${requestScope.select_Area eq 'dinner'}">selected</c:if>>dinner</option>
                     </select></li>
                  </ul>

                  <ul class="actions fit"
                     style="margin: 0 auto; display: table; margin-top: 1rem; width: 30%">
                     <li><a href="javascript:formSubmit()" class="button fit">SEARCH</a>
                     </li>

                  </ul>

               </div>
               <!-- box -->
            </div>
            <!-- col-6 col-12-medium -->
         </div>
         <!-- row gtr-200 -->
      </div>
      <!-- inner -->
                     <input type="hidden" name="loginAs" value="${loginAs}">
   </form>



   <c:choose>
      <c:when
         test="${h_list != null and fn:length(h_list) > 0 and h_lan != null and h_pic != null}">
         <!-- 헬퍼 카드 -->
         <c:forEach var="h_list" items="${h_list}" varStatus="status">
            <div class="col-6 col-12-medium" id="helper_card">
               <div class="col-6 col-12-medium" id="one">
                  <img
                     src="${pageContext.request.contextPath}/${h_pic[status.index]}"
                     class="profile_pic">
               </div>
               <div class="col-6 col-12-medium" id="two">
                  <a
                     href="${pageContext.request.contextPath}/helper/detail.he?helper_id=${h_list.getHelper_id()}&loginAs=${loginAs}"
                     style="text-decoration: none; float: left"><h4
                        class="helper_name">
                        <b>${h_list.getName()}</b>
                     </h4></a> <img src="${h_list.getFlag_url()}"
                     style="width: 20px; margin-top: 13px; margin-left: 7px;">
                  <p class="info">${h_list.getHelp_location()}</p>
                  <p class="info">${h_lan[status.index]}</p>
                  <p class="info">${h_list.getIntro_title()}</p>
               </div>
               <div class="col-6 col-12-medium" id="three">
                  <div style="float: left; margin-right: 2rem">
                     <h4 class="helper_rating">${h_list.getAvg_rating()}</h4>
                     <c:if test="${h_list.getRating_cnt() > 1}">
                        <h5>${h_list.getRating_cnt()}reviews</h5>
                     </c:if>
                     <c:if test="${h_list.getRating_cnt() <= 1}">
                        <h5>${h_list.getRating_cnt()}review</h5>
                     </c:if>
                  </div>
                  <div style="float: left">
                     <h4 class="helper_price">${h_list.getFare()}</h4>
                     <h5>per 30 mins</h5>
                  </div>
                  <div id="kakao_img">
                     <c:if test="${session_id != null}">
                     <c:choose>
                  <c:when test="${loginAs eq 'loginAsClient'}">
                        <a href="${h_list.getKakao_url()}"><img id="kakao_img_size" src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
                  </c:when>
                  <c:otherwise>
                        <a><img id="kakao_img_size" src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
                  </c:otherwise>
                  </c:choose>
                     </c:if>
                     <c:if test="${session_id == null}">
                        <a href="javascript:pleaseLogin()"><img id="kakao_img_size"
                           src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
                     </c:if>
                  </div>
               </div>
            </div>
            <!-- helper_card -->
         </c:forEach>
      </c:when>
      <c:otherwise>
         <div id="No_Result">No Results Found</div>
      </c:otherwise>
   </c:choose>

   <table style="border: 0; width: 40%; margin: 0 auto">
      <tr
         style="background-color: white; border: 0px; text-align: center; vertical-align: middle">
         <td><c:forEach var="i" begin="${startPage}" end="${endPage}">
               <c:choose>
                  <%-- <c:when test="${h_list != null}"></c:when> --%>
                  <c:when test="${i eq nowPage}">
                        [${i}]&nbsp;
                     </c:when>
                  <c:when test="${get_Service eq 'all'}">
                     <a
                        href="${pageContext.request.contextPath}/helper/all.he?page=${i}&loginAs=${loginAs}">
                        ${i}&nbsp; </a>
                  </c:when>
                  <c:when test="${nowPage != totalPage}">
                     <a
                        href="${pageContext.request.contextPath}/helper/search.he?page=${i}&service=${get_Service}&Area=${get_Area}&datepicker=${get_InputDate}&time1=${get_Time}&loginAs=${loginAs}">
                        ${i}&nbsp; </a>
                  </c:when>
                  <c:otherwise>
                     <a
                        href="${pageContext.request.contextPath}/helper/search.he?page=${i}&service=${get_Service}&Area=${get_Area}&datepicker=${get_InputDate}&time1=${get_Time}&loginAs=${loginAs}">
                        ${i}&nbsp; </a>
                  </c:otherwise>
               </c:choose>
            </c:forEach></td>
      </tr>
   </table>

   <!-- Footer -->
   <footer id="footer">
      <ul class="contact-icons">
         <li class="icon solid fa-map-marker-alt"><a
            href="https://goo.gl/maps/GaDcdSwpSZn9hRqZ9">Star Building 13F,
               12, Teheran-ro 26-gil, Gangnam-gu, Seoul, Republic of Korea 06236</a></li>
         <li class="icon solid fa-phone">(02) 345-9890</li>
         <li class="icon solid fa-envelope">helpme@gmail.com</li>
      </ul>
      <div class="copyright">&copy; HelpMe. All rights reserved.</div>
   </footer>

   <!-- Scripts -->
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
   <script>var contextPath = "${pageContext.request.contextPath}";</script>

   <script type="text/javascript"
      src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
   <script type="text/javascript"
      src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   <script>
                 $(document).ready(function () {
                     $("#datepicker").datepicker({
                      maxDate:30,
                      minDate:1,
                      dateFormat: 'yy/mm/dd'
                     });   
                     var frm = document.helper_search;
                     if(frm.service.value == 'all'){
                        console.log("체크");
                       $("select[class='Area']").attr("disabled",true);
                     $("input[id='datepicker']").attr("disabled",true);
                     $("select[class='time1']").attr("disabled",true);                        
                     }
                 });                
            </script>
   <script>
                 $(document).ready(function () {
                     $("#datepicker2").datepicker({
                      maxDate:30,
                      minDate:1,
                      dateFormat: 'yy/mm/dd'
                     });
                 });
         </script>
   <script src="${pageContext.request.contextPath}/search.js"></script>
   <script>
      //서비스 카테고리: all 클릭시 disabled
      var frm = document.helper_search;
      $('input[type=radio][name=service]').change(function(){
          if(frm.service.value != 'all'){
             $("select[class='Area']").attr("disabled",false);
             $("input[id='datepicker']").attr("disabled",false);
             $("select[class='time1']").attr("disabled",false);
          }else if(frm.service.value == 'all'){
             $('.Area').attr('disabled', 'true');
             $('#datepicker').attr('disabled', 'true');
             $('.time1').attr('disabled', 'true');
          }
      });
      </script>
   <script>         
         /*추가*/      
         $(function(){
            $('#back-to-top').on('click',function(e){
               e.preventDefault();
               $('html,body').animate({scrollTop:0},600);
            });
                 
            $(window).scroll(function() {
               if ($(document).scrollTop() > 100) {
               $('#back-to-top').addClass('show');
               } else {
               $('#back-to-top').removeClass('show');
               }
            });
         });
      </script>
   <script>
         function pleaseLogin(){
            alert("Please try again after logging in");
         }
         
      </script>
</body>
</html>