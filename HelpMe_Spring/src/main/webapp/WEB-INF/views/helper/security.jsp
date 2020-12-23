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
		<title>Helper Security</title>
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
		<!-- Header -->
			<header id="header">
				<!-- <a class="logo" href="index.html"></a> -->
				<a class="logo" href="/helpme/main_LogIn"><img src="/helpme/resources/images/logo11_2.png"/></a>
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
					<li><a href="/helpme/main_LogIn">Home</a></li>
					<li><a href="/helpme/helper/schedule">My Page</a></li>
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
						<li><a href="/helpme/helper/schedule" class="button primary fit">My Schedule</a></li>
						<li><a href="/helpme/helper/about" class="button primary fit">My Profile</a></li>
						<li><a href="/helpme/helper/security?helperId=${helperId}" class="button primary fit">Security</a></li>
					</ul>
					</div>
			</div>
			</div>
			
			<section id="main" class="wrapper alt" style="padding-top:2rem">
			<div class="inner">
			<div class="row gtr-200">
			<div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">
			<div class="box">
				<div class="col-6 col-12-medium" style="margin:left">
				<form name="pwForm" method="post">
				<h4 style="margin-bottom:20px; font-style:italic"><strong>Change Password</strong></h4>	
				<h5 class="aboutheader"><b>New password</b></h5>
					<input type="password" name="pw" id="pw" style="margin-bottom:2rem; background-color:white"/>
					
				<h5 class="aboutheader"><b>Verify password</b></h5>
					<input type="password" name="vf_pw" id="vf_pw" style="margin-bottom:2rem; background-color:white"/>
				
				</form>	
				</div><!-- col-6 col-12-medium -->
				
				<div class="col-12">
						<a href="javascript:updatePassword('${param.helperId}')" class="button primary">Save</a>
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
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
			
<script>
function updatePassword(helperId){
	
	
	var frm = document.pwForm;
	
	var pw = document.pwForm.pw.value;
	var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	if(frm.vf_pw.value == ""){
		alert("Please verify password");
		frm.vf_pw.focus();
		return false;
	}
	
	 if(!reg.test(pw)){
			alert('Your password should be more than 8 letters. Also, your password must include upper cases, lower cases, numbers, and special characters');
			return false;
		} 
		//같은 문자를 4번 이상 사용할 수 없다.
		else if(/(\w)\1\1\1/.test(pw)){
			alert("You can't use same letters more than 4 times for your passowrd.");
			return false;
		}
		//비밀번호에 아이디가 포함되어 있을 수 없다.
		else if(pw.search(helperId) > -1){
			alert("Your password cannot include id.");
			return false;
		}
		//비밀번호에 공백을 포함할 수 없다.
		else if(pw.search(/\s/) != -1){
			alert("Please don't use spaces in your password.");
			return false;	
		}


if(frm.pw.value != frm.vf_pw.value){
	alert("Please check your password");
	frm.vf_pw.focus();
	return false;
}

var password = frm.pw.value;

$.ajax({
	url : "/helpme/helper/updatePassword/" + password,
	type : 'PUT',
	dataType : 'text',
	success : function(data) {
		
		alert("Password has been successfully updated");
		location.replace("/helpme/helper/security?helperId=" + data.trim());
		

	},
	error : function() {
		console.log("오류");
	}
})			

}
</script>

	</body>
</html>