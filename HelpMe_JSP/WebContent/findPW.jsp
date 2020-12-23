<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Cascade by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<!-- 새로운 비밀번호를 만들어서 보내는 편이 좋지 않을까? -->
<html>
	<head>
		<title>HelpMeFindPW</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
	</head>
	
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<!-- img src로 이미지를 가져온다. -->
				<!-- 로고하고 메뉴창은 주석 처리 -->
				<%-- 
				<a class="logo" href="index.html"><img src="images/HelpMeLogo.png"></a>
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
				<%-- action을 FindPassword로 설정하여 formSubmit()되면 FindPassWordAction으로 가도록 --%>
				<form name="findPwform" action="${pageContext.request.contextPath}/client/FindPassword.cl">
				<div class="inner">
					<header class="major">
						<h1>Find Your Password</h1>
					</header>

					<!-- 제네릭에 있는 이미지 주석 처리 -->
					<!-- <span class="image main"><img src="images/pic04.jpg" alt="" /></span> -->
					
					<!-- 
					<input type="button" id="fPwToLogin" onclick="location.href='login.jsp'" style="width:300px; display:block; margin:0 auto;" onclick="sendIt()" value="Do you remember your ID?"><br>
					<input type="button" id="fPwToSignUp" onclick="location.href='signup.jsp'" style="width:300px; display:block; margin:0 auto;" onclick="sendIt()" value="Do you have no account?"><br>
					 -->
					
					<!-- style에 display:block; margin:0 auto;를 넣어 가운데 정렬 -->
					<p style="text-align:center;">					
						<%-- 아이디와 이메일을 입력하여 비밀번호 찾기 --%>
						Please enter your ID.
						<input type="text" name="fPwId" id="fPwId" style="width:350px; display:block; margin:0 auto;">
						Please enter your e-mail.
						<input type="text" name="fPwEmail" id="fPwEmail" style="width:350px; display:block; margin:0 auto;">
						<%--
						Please input your mobile phone number
						<input type="text" id="fPwMP" style="width:350px; display:block; margin:0 auto;">						
						 --%>
					</p>
					<input type="button" id="fPwSearch" style="display:block; margin:0 auto;" value="Search your password" onclick="findPwform.submit();">

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

	</body>
</html>