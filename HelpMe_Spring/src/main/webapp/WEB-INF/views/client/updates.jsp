<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Client Updates</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/helpme/resources/assets/css/main.css?ver=1" />
		<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	</head>
<style>
	
	.col-12{
			text-align:right;
		}
		
		.primary{
			width:auto;
		}
		
		#delete_account{
			color: red;
			box-shadow: inset 0 0 0 3px red;
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
				
				.primary{
					width:50%;
				}
				
				.col-12{
					text-align:right;
				}
				
				#delete_account{
					width:80%;
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
	<%-- <c:if test="${session_id eq null}">
            <script> alert('Please try again after logging in');
                  window.open("/", "_self")
            </script>
   </c:if> --%>

		<!-- Header -->
			<header id="header">
				<a class="logo" href="/helpme/main_LogIn.jsp?loginAs=${param.loginAs}"><img src="/helpme/resources/images/logo11_2.png"/></a>
				<!-- <a class="logo" href="main_Default.jsp"><img src="images/logo_85x21.png"/></a> -->
				<nav>
					<ul>
						<li>
							<a href="#menu">Menu</a>
						</li>
					</ul>
				</nav>
			</header>
		<a id="back-to-top" style="text-decoration:none"></a>
		
		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
					<li><a href="/helpme/logout" class="button">Log Out</a></li>
					<!-- <li><a href="signup.jsp" class="button primary">Sign Up</a></li>
					<li><a href="login.jsp" class="button">Log In</a></li> -->
					<li><a href="/helpme/main_LogIn?loginAs=${param.loginAs}">Home</a></li>
					<li><a href="/helpme/client/reservation?loginAs=${param.loginAs}">My Page</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${param.loginAs}">Search Helper</a></li>
              		<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${param.loginAs}">Helper Review Board</a></li>
				</ul>
			</nav>

		<!-- Main -->
			
			<div class="inner">
			<div class="row gtr-200">
					<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:78%">
					<header class="major" style="text-align:center; margin-top: 5rem; margin-bottom: 3rem">
					<h1>MY PAGE</h1>
					</header>
					<ul class="actions fit">
						<li><a href="/helpme/client/reservation?loginAs=${param.loginAs}" class="button primary fit">My Reservation</a></li>
						<li><a href="/helpme/client/points?loginAs=${param.loginAs}" class="button primary fit">My Points</a></li>
						<li><a href="/helpme/client/updates?loginAs=${param.loginAs}&clientId=${param.clientId}" class="button primary fit">Updates</a></li>
					</ul>
					</div>
			</div>
			</div>
			
			<section id="main" class="wrapper alt" style="padding-top:2rem">
			<div class="inner">
			<div class="row gtr-200">
			<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">
			<div class="box">
				<form name="updateForm" method="post">
				<div class="col-6 col-12-medium" style="margin:left">
				<h4 style="margin-bottom:20px; font-style:italic"><strong>Change Password</strong></h4>	
				<h5 class="aboutheader"><b>New password</b></h5>
					<input type="password" name="pw" id="pw" style="margin-bottom:2rem; background-color:white"/>
					
				<h5 class="aboutheader"><b>Verify password</b></h5>
					<input type="password" name="vf_pw" id="vf_pw" style="margin-bottom:2rem; background-color:white"/>
					
				<h4 style="margin-bottom:20px; font-style:italic"><strong>Change Email</strong></h4>	
					<input type="email" name="email" id="email" placeholder="abcd@gmail.com" style="margin-bottom:2rem; background-color:white"/>
					
				<h4 style="margin-bottom:20px; font-style:italic"><strong>Change Mobile Phone Number</strong></h4>	
					<input type="text" name="phone" id="phone" placeholder="XXX-XXXX-XXXX" style="margin-bottom:2rem; background-color:white"/>
				</div><!-- col-6 col-12-medium -->
				<input type="hidden" name="loginAs" value="${param.loginAs}">
				</form>
				
				<div class="col-12"><%-- '${param.clientId}' --%>
						<a href="javascript:update('${param.clientId}')" class="button primary">Save</a>
					</div>
				<div class="col-12" style="margin-top:2rem">
						<a href="javascript:deleteAccount()" class="button" id="delete_account">Delete Account</a>
					</div>
				
				</div><!-- box -->
				</div>
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
			<script src="/helpme/resources/assets/js/client_updates.js"></script>
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