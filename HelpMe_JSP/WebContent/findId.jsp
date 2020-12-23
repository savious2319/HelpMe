<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Cascade by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<%-- 아이디가 나올 때 딤처리 하기! --%>
<html>
	<head>
		<title>HelpMeFindID</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
		<style>
			login_body{
				opacity: .5;
			}
		</style>
	</head>
	
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<!-- img src로 이미지를 가져온다. -->
				<!-- 굳이 첫 페이지로 갈 필요가 있나? -->
				<%-- 
				<a class="logo" href="index.html"><img src="images/HelpMeLogo.png"></a>
				--%>
				
				<!-- 메뉴바도 필요 없을 것 같은데 -->
				<%-- 
				<nav>
					<ul>
						<li>
							<a href="#menu">Menu</a>
						</li>
					</ul>
				</nav>
				--%>
			</header>

		<!-- Menu -->
			<nav id="menu">
				<ul class="links">
					<li><a href="${pageContext.request.contextPath}/signup.jsp" class="button primary">Sign Up</a></li>
					<li><a href="${pageContext.request.contextPath}/login.jsp" class="button">Log In</a></li>
					<li><a href="${pageContext.request.contextPath}/main_Default.jsp">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/login.jsp">My Page</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/all.he">Search Helper</a></li>
					<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1">Helper Review Board</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<section id="main" class="wrapper">
			<%-- action을 FindId로 설정하여 formSubmit()되면 FindIdAction으로 가도록 --%>
			<form name="findIdform" action="${pageContext.request.contextPath}/client/FindId.cl">
				<div class="inner">

					<header class="major">
						<h1>Find Your ID</h1>
					</header>

					<!-- 제네릭에 있는 이미지 주석 처리 -->
					<!-- <span class="image main"><img src="images/pic04.jpg" alt="" /></span> -->
					
					<!-- 로그인, 회원가입 페이지로 갈 수 있는 버튼 -->
					<!-- 
					<input type="button" id="fIdToLogin" onclick="location.href='login.jsp'" style="width:300px; display:block; margin:0 auto;" value="Can you remember your ID?"><br>
					<input type="button" id="fIdToSignUp" onclick="location.href='signup.jsp'" style="width:300px; display:block; margin:0 auto;" value="Do you have no account?"><br>
					 -->
					
					<!-- 아이디를 찾기 위해 필요한 것 : 이름, 이메일 -->
					<p style="text-align:center;">					
						Please enter your name.
						<input type="text" name="fIdName" id="fIdName" style="width:350px; display:block; margin:0 auto;">
						Please enter your e-mail.
						<input type="text" name="fIdEmail" id="fIdEmail" style="width:350px; display:block; margin:0 auto;">
						<%-- 
						Please input your mobile phone number
						<input type="text" name="fIdMobilPhoneNum" id="fIdMobilPhoneNum" style="width:350px; display:block; margin:0 auto;">						
						--%>
					</p>
					<!-- 나중에 로그인 버튼을 통해 login_ok 페이지로 가도록 -->
					
					<input type="button" class="fIdSearch" id="fIdSearch" style="display:block; margin:0 auto;" value="Search your id" onclick="findIdform.submit();">
					
					<%-- 처음에는 findId 페이지에 메세지를 보내려고 했으나 나중에 다른 페이제에 만들기로 결정. --%>
					<%-- <input type="hidden" id="fIdHidden" value="${msg}">
					<p id="test" style="text-align:center;">${msg}</p> --%>
				</div>
			</form>
			</section>

		<!-- Footer -->
		<%-- 
			<footer id="footer">
				<ul class="contact-icons">
					<li class="icon solid fa-map-marker-alt"><a href="#">1234 Fictional Street #5432 Nashville, TN 00000-0000</a></li>
					<li class="icon solid fa-phone"><a href="#">(000) 000-0000</a></li>
					<li class="icon solid fa-envelope"><a href="#">info@untitled.tld</a></li>
				</ul>
				<div class="copyright">
					&copy; Untitled. All rights reserved.
				</div>
			</footer>
		--%>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script>
			/* function test(){
				document.getElementById("test").innerHTML = document.getElementById("fIdHidden").value;
			} */
			//	$(function(){
			//		$("#fIdSearch").click(function(){
			//			var msg = document.getElementById("fIdHidden").value;
			//			alert(msg);
			//		});
			//	})
				
			</script>
			
	</body>
</html>