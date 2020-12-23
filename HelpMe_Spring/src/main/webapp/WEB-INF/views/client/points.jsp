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
		<title>Client Points</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/helpme/resources/assets/css/main.css" />
	</head>
<style>
	.col-12{
			text-align:right;
		}
		
		
		.primary{
			width:auto;
		}
		
		#form_group{
			display: inline-block;
	    width: 100%;
	    margin-top: 24px;
	    text-align: -webkit-center;
		}
		
		.table-wrapper{
					width:100%;		
		}
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
		@media screen and (max-width: 768px) {
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
		
		@media screen and (max-width: 480px){
			
			.col-12{
				text-align:center;
			}
			
			.primary{
					width:100%;
				}
		}
		/*추가*/
		@media screen and (max-width: 425px) {
			.logo{
				margin-top: -4px;		
			}
		}	
		/*추가*/
		@media screen and (max-width: 375px) {
			.logo{
				margin-top: -8px;		
			}
		}
	
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
	<body class="is-preload">
<c:if test="${session_id eq null}">
            <script> alert('Please try again after logging in');
                  window.open("/helpme/home", "_self")
            </script>
   </c:if>
<%-- <c:set var="loginAs" value="${requestScope.loginAs}"/>
<c:set var="clientId" value="${requestScope.clientId}"/> --%>
		<!-- Header -->
			<header id="header">
				<a class="logo" href="/helpme/main_LogIn.jsp?loginAs=${loginAs}"><img src="/helpme/resources/images/logo11_2.png"/></a>
				<!-- <a class="logo" href="main_Default.jsp"><img src="images/logo_85x21.png"/></a> -->
				<nav>
					<ul>
						<li>
							<a href="#menu">Menu</a>
						</li>
					</ul>
				</nav>
			</header>
		
		<!-- 추가 -->			
			<a id="back-to-top" style="text-decoration:none"></a>
		
		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/helpme/logout" class="button">Log Out</a></li>
					<!-- <li><a href="signup.jsp" class="button primary">Sign Up</a></li>
					<li><a href="login.jsp" class="button">Log In</a></li> -->
					<li><a href="/helpme/main_LogIn.jsp?loginAs=${loginAs}">Home</a></li>
					<li><a href="/helpme/client/reservation?loginAs=${loginAs}">My Page</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search Helper</a></li>
              		<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper Review Board</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<div class="inner">
			<div class="row gtr-200">
					<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">
					<!-- <header style="text-align:center; margin-top: 5rem; margin-bottom: 3rem"> -->
					<header class="major" style="text-align:center; margin-top: 5rem; margin-bottom: 2rem">
					<h1>MY PAGE</h1>
					</header>
					<ul class="actions fit" style="margin-bottom:4rem">
						<li><a href="/helpme/client/reservation?loginAs=${loginAs}" class="button primary fit">My Reservation</a></li>
						<li><a href="/helpme/client/points?loginAs=${loginAs}" class="button primary fit">My Points</a></li>
						<li><a href="/helpme/client/updates?loginAs=${loginAs}&clientId=${clientId}" class="button primary fit">Updates</a></li>
					</ul>
			</div>
			</div>
			</div>
			
			<%-- <c:set var="clientPoints" value="${requestScope.client_points}"/>
			<c:set var="resInfo" value="${requestScope.resInfo}"/>
			<c:set var="resDate" value="${requestScope.resDate}"/>
			<c:set var="start_time" value="${requestScope.start}"/>
			<c:set var="end_time" value="${requestScope.end}"/> --%>
			
			
			<section id="main" class="wrapper alt" style="padding-top:2rem">
				<div class="inner">
				<div class="row gtr-200">
				<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:75%">
				
				
				<div class="box">
				
				<div style="display:block; text-align:center">
				  <div id="form_group"> 
					<div>
					 <div>	
					<h5 class="aboutheader"><b>Current Points </b></h5>
					</div>
					
					<div style="width:60%">	
					<input disabled type="text" name="curr_points" id="curr_points" value="${client_points}" style="margin-bottom:2rem; background-color:white"/>
					</div>
				  </div>
				  </div>	
				
				
				 <div id="form_group">
				 	<div>
				 	<div style="width:60%"> 
					<select name="category" id="category" style="background-color:white">
												<option value="">- Select Points -</option>
												<option value="1">1,000</option>
												<option value="1">5,000</option>
												<option value="1">10,000</option>
												<option value="1">50,000</option>
												<option value="1">100,000</option>
												<option value="1">200,000</option>
												<option value="1">500,000</option>
											</select>
					</div>
					<div style="margin-top:1rem">						
				<a class="button primary">Charge Points</a>
					</div>
				</div>	
				</div>
				
				</div> <!-- col-6 col-12-medium -->		
				</div> <!-- box -->
				
				
									
				</div>				
				
				<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:75%">
				
					 <div>	
					<h5 style="margin-bottom:3rem"><b>Points History</b></h5>
					</div>
					
					<!-- <div class="table-wrapper"> -->
									<table>
										<thead>
											<tr>
												<th>Points Spent</th>
												<th>Service Type</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
										<c:choose>
										<c:when test="${resInfo != null and fn:length(resInfo) > 0}">
         									<c:forEach var="res" items="${resInfo}" varStatus="status">
											<tr>
												<td>${res.getPointsSpent()}</td>
												<td>${res.getService()}</td>
												<td>${resDate[status.index]}&nbsp;&nbsp;${start_time[status.index]} ~ ${end_time[status.index]}</td>
											</tr>
										</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3" style="text-align:center">No History</td>
											</tr>
										</c:otherwise>
										</c:choose>	
										</tbody>
										
									</table>
				
				</div><!-- col-6 col-12-medium -->
				
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
			<script src="/helpme/resources/assets/js/jquery.min.js"></script>
			<script src="/helpme/resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="/helpme/resources/assets/js/jquery.scrollex.min.js"></script>
			<script src="/helpme/resources/assets/js/browser.min.js"></script>
			<script src="/helpme/resources/assets/js/breakpoints.min.js"></script>
			<script src="/helpme/resources/assets/js/util.js"></script>
			<script src="/helpme/resources/assets/js/main.js"></script>
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

	</body>
</html>		