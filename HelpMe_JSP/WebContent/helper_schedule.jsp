<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Helper Schedule</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
		<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
		
	</head>
<style>
	
	#category, #name, #meetingplace, #meetingarea, #datepicker, #service, #startTime, 
	#endTime, #change_day, #change_startTime, #change_endTime, #add_day, #add_startTime, #add_endTime,
	#remove_day{
			background-color:white;
		}
		
		.col-6{
			width:80%;
		}
		
		.col-12{
			text-align:right;
		}
		
		
		input[type="submit"]{
			padding:0 2.5em;
		}
		
		.table-wrapper{
					width:100%;
				
				}
				
		#version1{display:flex;}
		#version2{display:none;}		

		/*추가*/		
		@media screen and (max-width: 2560px){	
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
			  transition: background-color .3s, 
			    opacity .5s, visibility .5s;
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
		}
		/*추가*/
		@media screen and (max-width: 1980px) {
			.logo{
				margin-top: 7px;		
			}
		}
		/*추가*/
		@media screen and (max-width: 1440px) {
			.logo{
				margin-top: 4px;		
			}
		}		
		/*추가*/		
		@media screen and (max-width: 980px) {
			.logo{
				margin-top: 7px;		
			}
		}
		/*추가*/		
		@media screen and (max-width: 768px){
			#version1{display:none;}
			#version2{display:block;}
			
			#version2 li{
				padding: 1.25rem 0 0 0;
			}
			
			/* .col-6{
			width:60%;
			} */
			
			.helper_schedule{
				margin: 2rem 0 0 0;
			}
			
			.logo{
				margin-top: 4px;		
			}
		}
		/*추가*/
		@media screen and (max-width: 736px) {
			.logo{
				margin-top: -8px
			}
		}	
				
		@media screen and (max-width: 640px){
				.table-wrapper{
					width:100%;
				}
				
				li{margin-bottom:0;}
		}
		
		@media screen and (max-width: 480px){
			
			.col-12{
				text-align:center;
			}
		}
		/*추가*/		
		@media screen and (max-width: 425px) {
			.logo{
				margin-top: -4px;		
			}
			
			.primary{
				width:50%;
			}
		}
		/*추가*/		
		@media screen and (max-width: 375px){
			.helper_schedule{
				width:101%;
			}
			.logo{
				margin-top: -8px;		
			}			
		}
		
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<body class="is-preload">
	<c:if test="${session_id eq null}">
            <script> alert('Please try again after logging in');
                  window.open("${pageContext.request.contextPath}/main_Default.jsp", "_self")
            </script>
   </c:if>
		<!-- Header -->
			<header id="header">
			<a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
<!-- 				<a class="logo" href="main_Default.jsp"><img src="images/logo_85x21.png"/></a> -->
				<nav>
					<ul>
						<li>
							<a href="#menu">Menu</a>
						</li>
					</ul>
				</nav>
			</header>
		<a id="back-to-top" style="text-decoration:none"></a>
		<c:set var="helperId" value="${requestScope.helperId}"/>	
		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
					<li><a href="${pageContext.request.contextPath}/client/ClientLogOut.cl" class="button">Log Out</a></li>
					<!-- <li><a href="signup.jsp" class="button primary">Sign Up</a></li>
					<li><a href="login.jsp" class="button">Log In</a></li> -->
					<li><a href="${pageContext.request.contextPath}/main_LogIn.jsp">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc">My Page</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/all.he">Search Helper</a></li>
              		<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1">Helper Review Board</a></li>
				</ul>
			</nav>

		<!-- Main -->
			
			<div class="inner">
			<div class="row gtr-200">
					<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">
					<header class="major" style="text-align:center; margin-top: 5rem; margin-bottom: 3rem">
					<h1>MY PAGE</h1>
					</header>
					<ul class="actions fit">
						<li><a href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc" class="button primary fit">My Schedule</a></li>
						<li><a href="${pageContext.request.contextPath}/helper/HelperAboutOk.he" class="button primary fit">My Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/helper_change_pw.jsp?helperId=${helperId}" class="button primary fit">Security</a></li>
					</ul>
					</div>
			</div>
			</div>
			
			<section id="main" class="wrapper alt" style="padding-top:2rem">
			<div class="inner">
			
			<c:set var="day" value="${requestScope.helperAvailDay}"/>
			<c:set var="startTime" value="${requestScope.helperStartTime}"/>
			<c:set var="endTime" value="${requestScope.helperEndTime}"/>
			<c:set var="freeDays" value="${requestScope.helperFreeDays}"/>
			<c:set var="helperName" value="${requestScope.helperName}"/>
			
			<c:set var="resNo" value="${requestScope.resNo}"/>
			<c:set var="clientNo" value="${requestScope.clientNo}"/>
			<c:set var="clientName" value="${requestScope.clientName}"/>
			<c:set var="resDate" value="${requestScope.resDate}"/>
			<c:set var="resStart" value="${requestScope.resStart}"/>
			<c:set var="resEnd" value="${requestScope.resEnd}"/>
			<c:set var="meetingArea" value="${requestScope.meetingArea}"/>
			<c:set var="pointsSpent" value="${requestScope.pointsSpent}"/>
			<c:set var="resStatus" value="${requestScope.resStatus}"/>
			<c:set var="service" value="${requestScope.service}"/>
		
			
				<h4 ><strong>${helperName} Schedule</strong></h4>
						<div class="col-6 col-12-medium" style="margin:0 auto; width:60%">
								<div class="table-wrapper">
									<table class="helper_schedule">
										<thead>
											<tr>
												<th>Day</th>
												<th>Working Hour</th>
											</tr>
										</thead>
										<tbody id="schedule_body">
            								<c:if test="${day != null and fn:length(day) > 0}">
               								<c:forEach var="helper" items="${day}" varStatus="status">
               								<tr class="schedule">
               									<td class="day">
               									<c:choose>
												      <c:when test="${helper.getAvail_day() == 2}">
												      	Monday
												      </c:when>
												        
												      <c:when test="${helper.getAvail_day() == 3}">
												      	Tuesday
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 4}">
												      	Wednesday
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 5}">
												      	Thursday
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 6}">
												      	Friday
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 7}">
												      	Saturday
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 1}">
												      	Sunday
												      </c:when>
												</c:choose>
												   </td>
												   
	               								<td class="time">
	               									<!-- 9:00 ~ 18:00 -->
	               									${startTime[status.index]} ~ ${endTime[status.index]}
	               								</td>
               								</tr>
               							</c:forEach>
               							</c:if>
										</tbody>
									</table>
									</div>
									</div>
									
									
								
									<!-- 헬퍼 근무 시간 변경 -->
								<div class="col-6 col-12-medium" style="margin:0 auto">
									<form name="changeForm" action="${pageContext.request.contextPath}/schedule/HelperScheduleChangeOk.sc" method="post" >
									<table class="helper_schedule">
										<thead>
											<tr>
												<th>Change Schedule</th>
											</tr>
										</thead>
										</table>
											<ul class="actions fit" id="version1">
												<li>
												<select name="change_day" id="change_day">
		<!-- 근무 요일/시간 변경 시, 헬퍼가 현재 근무하고 있는 요일만 SELECT에 나오게 한다 -->
												<option value="">- Select Day -</option>
            								<c:if test="${day != null and fn:length(day) > 0}">
               								<c:forEach var="helper" items="${day}">
               									
               									<c:choose>
												      <c:when test="${helper.getAvail_day() == 2}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${helper.getAvail_day() == 3}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 4}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 5}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 6}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 7}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 1}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:if>
											</select>
											</li>
												
												<li>
												<select name="change_startTime" id="change_startTime">
												<option value="">- Select Start Time -</option>
												<option value="6">06:00</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
											</select>
											</li>
												<li>
												<select name="change_endTime" id="change_endTime">
												<option value="">- Select End Time -</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												<option value="24">24:00</option>
											</select>
												</li>
											<li>
											<a href="javascript:changeSchedule()" class="button primary">Change Working Hour</a>
											</li>
											</ul>
											</form>
												
										<form method="post" action="#">
										<ul class="actions fit" id="version2">
												<li>
												<select name="category" id="category">
												<option value="">- Select Day -</option>
												<c:if test="${day != null and fn:length(day) > 0}">
               								<c:forEach var="helper" items="${day}">
               									
               									<c:choose>
												      <c:when test="${helper.getAvail_day() == 2}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${helper.getAvail_day() == 3}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 4}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 5}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 6}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 7}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 1}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:if>
											</select>
											</li>
												
												<li>
												<select name="category" id="category">
												<option value="">- Select Start Time -</option>
												<option value="6">06:00</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
											</select>
											</li>
												<li>
												<select name="category" id="category">
												<option value="">- Select End Time -</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												<option value="24">24:00</option>
											</select>
												</li>
											<li>
											<a href="javascript:changeSchedule()" class="button primary">Change Working Hour</a>
											</li>
											</ul>
										</form>
										
										</div>
									
									
												
										
										
									<!-- 헬퍼 근무 시간 추가 -->
									<div class="col-6 col-12-medium" style="margin:0 auto">
									<form name="changeForm" action="${pageContext.request.contextPath}/member/MemberLoginOk.me" method="post" >
									<table class="helper_schedule">
									<thead>
											<tr>
												<th>Add Schedule</th>
											</tr>
										</thead>
									</table>
											<!-- 현재 헬퍼가 근무하고 있지 않은 요일만 SELECT에 나오게 한다 -->
									<ul class="actions fit" id="version1">
												<li>												
												<select name="add_day" id="add_day">
												<option value="">- Select Day -</option>
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
               								<c:forEach var="free" items="${freeDays}">
               									
               									<c:choose>
												      <c:when test="${free == '2'}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${free == '3'}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${free == '4'}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${free == '5'}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${free == '6'}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${free == '7'}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${free == '1'}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:when>
               								<c:otherwise>
               									<option value="">No available days</option>
               								</c:otherwise>
               							</c:choose>
												</select>
												</li>
												
												<li>
												<select name="add_startTime" id="add_startTime">
												<option value="">- Select Start Time -</option>
												
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
												<option value="6">06:00</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												</c:when>
												<c:otherwise>
               									<option value="">No  available time</option>
               								</c:otherwise>
												</c:choose>
											</select>
												</li>
												
												<li>
												<select name="add_endTime" id="add_endTime">
												<option value="">- Select End Time -</option>
												
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												<option value="24">24:00</option>
												</c:when>
												<c:otherwise>
               									<option value="">No  available time</option>
               								</c:otherwise>
												</c:choose>
												
											</select>
												</li>
											
											<li>	
											<a href="javascript:addSchedule()" class="button primary">Add Working Hour</a>
											</li>
											</ul>
										</form>
										
										<form method="post" action="#">	
										<ul class="actions fit" id="version2">
												<li>												
												<select name="category" id="category">
												<option value="">- Select Day -</option>
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
               								<c:forEach var="free" items="${freeDays}">
               									
               									<c:choose>
												      <c:when test="${free == '2'}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${free == '3'}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${free == '4'}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${free == '5'}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${free == '6'}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${free == '7'}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${free == '1'}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:when>
               								<c:otherwise>
               									<option value="">No available days</option>
               								</c:otherwise>
               							</c:choose>
												</select>
												</li>
												
												<li>
												<select name="category" id="category">
												<option value="">- Select Start Time -</option>
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
												<option value="6">06:00</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												</c:when>
												<c:otherwise>
               									<option value="">No  available time</option>
               								</c:otherwise>
												</c:choose>
											</select>
												</li>
												
												<li>
												<select name="category" id="category">
												<option value="">- Select End Time -</option>
												<c:choose>
												<c:when test="${freeDays != null and fn:length(freeDays) > 0}">
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												<option value="24">24:00</option>
												</c:when>
												<c:otherwise>
               									<option value="">No  available time</option>
               								</c:otherwise>
												</c:choose>
											</select>
												</li>
											
											<li>	
											<a href="javascript:addSchedule()" class="button primary">Add Working Hour</a>
											</li>
											</ul>
											
										</form>
										</div>
										
										<!-- 헬퍼 근무 요일 삭제 -->
										<div class="col-6 col-12-medium" style="margin:0 auto">
										<form method="post" action="#">
										<table class="helper_schedule">
										<thead>
											<tr>
												<th>Remove Schedule</th>
											</tr>
										</thead>
										</table>
											<!-- 현재 헬퍼가 근무하고 있는 요일만 SELECT에 나오게 한다 -->
												<ul class="actions fit" id="version1">
												<li>
												<select name="remove_day" id="remove_day">
												<option value="">- Select Day -</option>
												<!-- <option value="2">Monday</option> -->
												<c:if test="${day != null and fn:length(day) > 0}">
               								<c:forEach var="helper" items="${day}">
               									
               									<c:choose>
												      <c:when test="${helper.getAvail_day() == 2}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${helper.getAvail_day() == 3}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 4}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 5}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 6}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 7}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 1}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:if>
											</select>
											</li >
											
											<li>
											<a href="javascript:removeSchedule()" class="button primary">Remove Working Day</a>
											</li>
											</ul>
											</form>
											
											<form method="post" action="#">
											<ul class="actions fit" id="version2">
												<li>
												<select name="category" id="category">
												<option value="">- Select Day -</option>
												<c:if test="${day != null and fn:length(day) > 0}">
               								<c:forEach var="helper" items="${day}">
               									
               									<c:choose>
												      <c:when test="${helper.getAvail_day() == 2}">
												      	<option value="2">Monday</option>
												      </c:when>
												        
												      <c:when test="${helper.getAvail_day() == 3}">
												      	<option value="3">Tuesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 4}">
												      	<option value="4">Wednesday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 5}">
												      	<option value="5">Thursday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 6}">
												      	<option value="6">Friday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 7}">
												      	<option value="7">Saturday</option>
												      </c:when>
												      
												      <c:when test="${helper.getAvail_day() == 1}">
												      	<option value="1">Sunday</option>
												      </c:when>
												      
												   </c:choose>
											
               							</c:forEach>
               							</c:if>
											</select>
											</li >
											
											<li>
											<a href="javascript:removeSchedule()" class="button primary">Remove Working Day</a>
											</li>
											</ul>
											
									</form>
									</div>
									
									
								
								</div>
								<!-- </div -->
								</section>
								
								<hr>
								
					<!-- 예약 신청서 -->
					
					<section id="main" class="wrapper alt" style="padding-top:2rem">
						<div class="inner">
						<form name="reservationForm" action="${pageContext.request.contextPath}/reservation/MakeReservationOk.rs" method="post" >
					<h4 ><strong>Reservation Form</strong></h4>
			<div class="row gtr-200">
						<div class="col-6 col-12-medium">
						<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<h5>Name</h5>
											<input type="text" name="name" id="name" value=""  />
										</div>
										<div class="col-6 col-12-xsmall">
											<!-- <h5>Last Name</h5>
											<input type="text" name="lastname" id="lastname" value=""  /> -->
										</div>
										<div class="col-6 col-12-xsmall">
										<h5>- Service Type -</h5>
										<select name="service" id="service">
												<option value="">Select Service</option>
												<option value="Translation">Translation</option>
												<option value="Government Service">Government Service</option>
												<option value="Hospital">Hospital</option>
												<option value="Travel">Travel</option>
												<option value="Food">Food</option>
												<option value="Tax Accounting">Tax Accounting</option>
												<option value="Housing">Housing</option>
												<option value="Shopping">Shopping</option>
											</select>
										</div>
								<div class="col-6 col-12-xsmall">
										<h5>Meeting Area</h5>
										<select name="meetingarea" id="meetingarea">
												  <option value="">- Select Area -</option>
												  <option value="Gangnam-gu">Gangnam-gu</option>
								                  <option value="Dongdaemun-gu">Dongdaemun-gu</option>
								                  <option value="Yeongdeungpo-gu">Yeongdeungpo-gu</option>
								                  <option value="Jongno-gu">Jongno-gu</option>
											</select>
										</div>
										</div>
						</div>
						
						<div class="col-6 col-12-medium">
							<div class="row gtr-uniform">
										<div class="col-6 col-12-xsmall">
											<h5>Meeting Place</h5>
											<input type="text" name="meetingplace" id="meetingplace" value=""  />
										</div>
										<div class="col-6 col-12-xsmall">
											<h5>Reservation Date</h5>
											<input id="datepicker" name="datepicker" type="text" placeholder="- Select Date -">
										</div>
										<div class="col-6 col-12-xsmall">
										<h5>Start Time</h5>
										<select name="startTime" id="startTime">
												<option value="">- Select Start Time -</option>
												<option value="6">06:00</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
											</select>
										</div>
								
								
								
										<div class="col-6 col-12-xsmall">	
										<h5>End Time</h5>
										<select name="endTime" id="endTime">
												<option value="">- Select End Time -</option>
												<option value="6.5">06:30</option>
												<option value="7">07:00</option>
												<option value="7.5">07:30</option>
												<option value="8">08:00</option>
												<option value="8.5">08:30</option>
												<option value="9">09:00</option>
												<option value="9.5">09:30</option>
												<option value="10">10:00</option>
												<option value="10.5">10:30</option>
												<option value="11">11:00</option>
												<option value="11.5">11:30</option>
												<option value="12">12:00</option>
												<option value="13">13:00</option>
												<option value="13.5">13:30</option>
												<option value="14">14:00</option>
												<option value="14.5">14:30</option>
												<option value="15">15:00</option>
												<option value="15.5">15:30</option>
												<option value="16">16:00</option>
												<option value="16.5">16:30</option>
												<option value="17">17:00</option>
												<option value="17.5">17:30</option>
												<option value="18">18:00</option>
												<option value="19">19:00</option>
												<option value="19.5">19:30</option>
												<option value="20">20:00</option>
												<option value="20.5">20:30</option>
												<option value="21">21:00</option>
												<option value="21.5">21:30</option>
												<option value="22">22:00</option>
												<option value="22.5">22:30</option>
												<option value="23">23:00</option>
												<option value="23.5">23:30</option>
												<option value="24">24:00</option>
											</select>
											</div>
					</div>
					</div>
					</div>
					
					<div class="col-12" style="margin-top:2rem">
					<!-- <input type="button" value="Submit" onclick="makeReservation()" class="primary"/> -->
					<a href="javascript:makeReservation()" class="button primary">Submit</a>
					</div>
					
					</form>
					</div>
					</section>	
					
					
					
					<hr>
						
					<section id="main" class="wrapper" style="padding-top:2rem">	
					<div class="inner">
							<h4><strong>Clients Who Reserved ${helperName}</strong></h4>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>Res No</th>
												<th>Client No</th>
												<th>Name</th>
												<th>Reservation Date</th>
												<th>Service Type</th>
												<th>Meeting Area</th>
												<th>Points</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody id="reservation">
										<c:if test="${resDate != null and fn:length(resDate) > 0}">
               								<c:forEach var="date" items="${resDate}" varStatus="status">
											<tr id="${resNo[status.index]}">
												<td>${resNo[status.index]}</td>
												<td>${clientNo[status.index]}</td>
												<td>${clientName[status.index]}</td>
												<td>${resDate[status.index]}&nbsp;&nbsp;${resStart[status.index]} ~ ${resEnd[status.index]}</td>
												<td>${service[status.index]}</td>
												<td>${meetingArea[status.index]}</td>
												<td>${pointsSpent[status.index]}</td>
												<td>${resStatus[status.index]}</td>
												<c:choose>
												<c:when test="${resStatus[status.index] eq 'done' }">
												<td><a href="javascript:deleteReservation('${resNo[status.index]}')" class="button small" style="display:none">Delete</a></td>
											 	</c:when>
											 	<c:otherwise> 
												<td><a href="javascript:deleteReservation('${resNo[status.index]}')" class="button small">Delete</a></td>
											  	</c:otherwise>
											  	</c:choose>
											  </tr>
											  </c:forEach>
											  </c:if>	
										</tbody>
										
									</table>
								</div>
								</div>
								</section>
		
		<!-- Footer -->
			<footer id="footer">
				<ul class="contact-icons">
               <li class="icon solid fa-map-marker-alt"><a href="https://goo.gl/maps/GaDcdSwpSZn9hRqZ9">Star Building 13F, 12, Teheran-ro 26-gil, Gangnam-gu, Seoul, Republic of Korea 06236</a></li>
               <li class="icon solid fa-phone">(02) 345-9890</li>
               <li class="icon solid fa-envelope">helpme@gmail.com</li>
            </ul>
            <div class="copyright">
               &copy; HelpMe. All rights reserved.
            </div>
			</footer>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="${pageContext.request.contextPath}/helperScheduleChange.js"></script>
			<script src="${pageContext.request.contextPath}/clientReservation.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>
			
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
			<script>
        			$(document).ready(function () {
            			$("#datepicker").datepicker({
							 maxDate:30,
			            	 minDate:1
            			});
        			});
        			
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
	</body>
</html>










