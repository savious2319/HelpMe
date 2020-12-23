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
		<title>Client Reservations</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/helpme/resources/assets/css/main.css" />
	</head>
<style>
	.actions ul, li{
			text-align:left;
			display:inline-block;
			
		}
		
		.contact-icons li{
			text-align:center;
		}
		
		.links li{
			display:block;
		}
		
		ul{
			margin:0px;
		}
		
		#description{
	      display:grid; 
	      grid-template-columns: auto 1fr; 
	      gap:24px;
	      -webkit-box-pack: start;
	       justify-content: start;
	       margin-bottom: 32px;
	   }   
   
	   .profile_pic{
	      width:160px; 
	      height:160px; 
	      border-radius:4px;
	   }
	   
	   .col-12{
	      text-align:right;
	   }
	   
	   .primary{
	      width:auto;
	   }
	   
	   #helper_card{
	   	margin:0 auto; 
	   	border:solid 1px; 
	   	border-color:rgba(144, 144, 144, 0.25); 
	   	width:50%;
	   	border-radius: 4px;
	    margin-top: 2.5rem;
	    padding: 1.5rem;
	    display:grid;
	    grid-template-columns: auto auto auto; 
	    gap:24px;
	    -webkit-box-pack: start;
	     justify-content: start;
	   }
	   	
	   	.helper_name, .helper_price, .helper_rating{
	   		margin:0px;
	   	}
	   	
	   	.info{
	   		margin:0px;
	   	}
	   	
	   	.flag{
	   		width:25px; 
	   		margin-top: 13px; 
	   		margin-left: 7px;
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

		@media screen and (max-width: 1024px){
			#helper_card{
				width:70%;
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
			#helper_card{
				grid-template-columns:auto;
			}
			
			.flag{
				width:100px;
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
		/*추가*/
		@media screen and (max-width: 425px){
			
			.flag{
				width:50px;
			}
			.logo{
				margin-top: -4px;		
			}
		}   	
		/*추가*/		
		@media screen and (max-width: 375px){
			
			.profile_pic{
				width:120px; 
		      	height:120px;
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
                  window.open("/helpme/home", "_self")
            </script>
   </c:if>

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
						<li><a href="/helpme/client/reservation?loginAs=${loginAs}" class="button primary fit">My RESERVATION</a></li>
						<li><a href="/helpme/client/points?loginAs=${loginAs}" class="button primary fit">MY POINTS</a></li>
						<li><a href="/helpme/client/updates?loginAs=${loginAs}&clientId=${clientId}" class="button primary fit">UPDATES</a></li>
					</ul>
					
			<c:choose>
				
				<c:when test="${currentResCnt > 1}">		
				<h4 ><strong>You have ${currentResCnt} Reservations</strong></h4>
				</c:when>
				
				<c:when test="${currentResCnt == 1}">
				<h4 ><strong>You have ${currentResCnt} Reservation</strong></h4>
				</c:when>
	
				<c:otherwise>
				<h4 ><strong>You have 0 Reservation</strong></h4>
				</c:otherwise>
				
				</c:choose>
				</div>
				</div>
				</div>		
		
						
						<!-- 헬퍼 카드 -->	
			<form method="post" action="#">
			<c:if test="${currentResDate != null and fn:length(currentResDate) > 0}">
		<c:forEach var="date" items="${currentResDate}" varStatus="status">
			
			<div class="col-6 col-12-medium" id="helper_card">
				<div class="col-6 col-12-medium">	
			
            		<img src="/helpme/resources/${currentResPic[status.index]}" class="profile_pic">
            	</div>
            	
            	<div class="col-6 col-12-medium">
            		<p class="info" style="float:left">Helper : <a href="${pageContext.request.contextPath}/helper/detail.he?helper_id=${currentHelperId[status.index]}&loginAs=${loginAs}" style="text-decoration:none">${currentResHelperName[status.index]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            		<img class="flag" src="${currentResFlag[status.index]}">
            		
            		<p class="info" id="date">Date : ${currentResDate[status.index]}&nbsp;&nbsp;${currentStartTime[status.index]} ~ ${currentEndTime[status.index]} 
            		<p class="info">Points: ${currentResPoints[status.index]}</p>
            		<a href="${openChat_url[status.index]}" style="text-decoration:none">Cancel Reservation</a>
            		
            	</div>
            		
            	<div class="col-6 col-12-medium">
					
            		<p class="info">Service : ${currentService[status.index]}</p>
            		<p class="info">Meeting place : ${currentResMeetingPlace[status.index]}</p>
            		
            	</div>	
            	
            	</div><!-- helper_card -->
            	</c:forEach>
            	</c:if>
			   </form>
		
		<hr>	
		<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">					
		<h4 ><strong>Previous Reservation(s)</strong></h4>
		</div>
		
		<c:set var="i" value="${0}" />
								
		<!-- 헬퍼 카드 -->	
			<form method="post" action="#">
			<c:if test="${previousResDate != null and fn:length(previousResDate) > 0}">
		<c:forEach var="date" items="${previousResDate}" varStatus="status">
			
			<div class="col-6 col-12-medium" id="helper_card">
				<div class="col-6 col-12-medium">		
            		<img src="/helpme/resources/${previousResPic[status.index]}" class="profile_pic">
            	</div>
            	
            	<div class="col-6 col-12-medium">
            		<p class="info" style="float:left">Helper : <a href="${pageContext.request.contextPath}/helper/detail.he?helper_id=${previousHelperId[status.index]}" style="text-decoration:none">${previousResHelperName[status.index]}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
            		<img class="flag" src="${previousResFlag[status.index]}">
            		
            		<p class="info">Date : ${previousResDate[status.index]}&nbsp;&nbsp;${previousStartTime[status.index]} ~ ${previousEndTime[status.index]} 
            		<p class="info">Points: ${previousResPoints[status.index]}</p>
            		<a href="#" style="text-decoration:none; display:none">Cancel Reservation</a>
            	</div>
            	<div class="col-6 col-12-medium">
					
            		<p class="info">Service : ${previousService[status.index]}</p>
            		<p class="info">Meeting place : ${previousResMeetingPlace[status.index]}</p>
            		<p class="info" style="font-style:italic">Rate this helper</p>
            		
            		<c:set var="i" value="${i+1}" />
            		
            		<ul class="actions fit">
            		<li>
            		<select name="category" id="${i}">
												<option value="">- Rate -</option>
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
            		</li>
            		<li>
            		<a href="javascript:sendRating('${previousHelperId[status.index]}', '${i}')" class="button primary">Submit</a>
            		</li>
            		</ul>
            	</div>	
            		
            	
            	</div><!-- helper_card -->
            	</c:forEach>
            	</c:if>
			   </form>						
								
				
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
			<script src="/helpme/resources/assets/js/client_ratingUpdates.js"></script>
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