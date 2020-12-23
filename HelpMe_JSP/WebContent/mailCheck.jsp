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
		<title>MailCheck</title>
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
					<li><a href="index.html">Home</a></li>
					<li><a href="generic.html">Generic</a></li>
					<li><a href="elements.html">Elements</a></li>
					<li><a href="#" class="button primary">Sign Up</a></li>
					<li><a href="#" class="button">Log In</a></li>
				</ul>
			</nav>

		<!-- Main -->
			<section id="main" class="wrapper">
				
				<%-- findPW 다음 페이지. 메일을 확인해달라는 메세지 말고는 별다른 기능이 없다. --%>
				<div class="inner">
					<p style="text-align:center; font-size:x-large; font-weight:bold;">${mailMsg}</p>
										
					<input type="button" value="close" onclick="window.close();" style="display:block; margin:0 auto;">		
				</div>
				
			</section>

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