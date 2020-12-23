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
<title>Helper Photos</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
<link
	href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"
	rel="Stylesheet" type="text/css" />
</head>

<style>
#photos {
			width: 100%;
			box-shadow: rgba(0, 0, 0, 0.16) 0px 16px 32px 0px;
			padding: 16px;
			text-align:center;
		}
		
		#main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
			width: 260px;
			height: 260px;
			border-radius: 4px;
		}
		
		/* .pic_box {
			display: flex;
			-webkit-box-pack: justify;
			justify-content: space-between
		} */
		
		.bigPictureWrapper {
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top: 0%;
			width: 100%;
			height: 100%;
			background-color: gray;
			z-index: 100;
			background: rgba(255, 255, 255, 0.5);
		}
		
		.bigPicture {
			position: relative;
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.bigPicture img {
			width: 600px;
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
		/*추가*/		
		@media screen and (max-width: 425px) {
			.logo{
				margin-top: -4px;		
			}
		}
		/*추가*/	
		@media screen and (max-width: 375px){
			#main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
			width: 200px;
			height: 200px;
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
		<!-- <a class="logo" href="index.html"></a> -->
		<a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
		<nav>
			<ul>
				<li><a href="#menu">Menu</a></li>
			</ul>
		</nav>
	</header>

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

	<a id="back-to-top" style="text-decoration:none"></a>
	<!-- Main -->
<c:set var="helperId" value="${requestScope.helperId}"/>
	<div class="inner">
		<div class="row gtr-200">
			<div class="col-6 col-12-medium"
				style="margin: 0 auto; display: table; width: 80%">
				<header class="major"
					style="text-align: center; margin-top: 5rem; margin-bottom: 3rem">
					<h1>MY PAGE</h1>
				</header>
				<ul class="actions fit">
					<li><a href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc" class="button primary fit">My
							Schedule</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/HelperAboutOk.he"
						class="button primary fit">My Profile</a></li>
					<li><a href="${pageContext.request.contextPath}/helper_change_pw.jsp?helperId=${helperId}" class="button primary fit">Security</a></li>
				</ul>
			</div>
		</div>
	</div>


	<section id="main" class="wrapper alt" style="padding-top: 2rem">
		<div class="inner">
			<div class="row gtr-200">
				<div class="col-6 col-12-medium"
					style="margin: 0 auto; display: table; width: 80%">
					<ul class="actions fit">
						<li><a href="${pageContext.request.contextPath}/helper/HelperAboutOk.he" class="button">About</a></li>
						<li><a href="${pageContext.request.contextPath}/helper/HelperPhotosOk.he" class="button">Photos</a></li>
						<li><a href="${pageContext.request.contextPath}/helper/HelperDescriptionOk.he" class="button">Description</a></li>
						<li><a href="${pageContext.request.contextPath}/helper/HelperBackgroundOk.he" class="button">Background</a></li>
					</ul>

					<div class="box">
						<div class="col-6 col-12-medium">
							  <h3>
								<strong>Photos</strong>
							</h3>
							<h4 style="margin-bottom: 0">
								<b>Tips on the pictures that can make great first impression
									to our clients</b>
							</h4>
							<p>Helpers who look friendly and professional get the most clients</p>
							<ul>
								<li>Upload a picture where you can appeal your special
									skills</li>
								<li>Upload a picture where you are helping a foreigner in
									your special area</li>
								<li>Upload a picture where you are looking friendly and
									having a good time</li>
							</ul>

							<div class='bigPictureWrapper'>
								<div class='bigPicture'></div>
							</div>
						
						<c:set var="main_pic" value="${requestScope.main_pic}"/>
						<c:set var="pic1" value="${requestScope.pic1}"/>
						<c:set var="pic2" value="${requestScope.pic2}"/>
						<c:set var="pic3" value="${requestScope.pic3}"/>
						<c:set var="pic4" value="${requestScope.pic4}"/>
						<c:set var="pic5" value="${requestScope.pic5}"/>
						
						
							<div class="inner" id="photos">
								<img src="${pageContext.request.contextPath}/${main_pic}" id="main_pic"> 
								<img src="${pageContext.request.contextPath}/${pic1}" id="pic1">
								<img src="${pageContext.request.contextPath}/${pic2}" id="pic2">
								<img src="${pageContext.request.contextPath}/${pic3}" id="pic3"> 
								<img src="${pageContext.request.contextPath}/${pic4}" id="pic4"> 
								<img src="${pageContext.request.contextPath}/${pic5}" id="pic5">

							</div>

							<form id="picform" method="post" enctype="multipart/form-data">
								
								<input type="file" id="file" name="file" accept="image/*" style="display: none"> 
								<input type="hidden" name="picId">
								<input type="hidden" name="picSrc">
								<input type="hidden" name="emptyPic">
							</form>
							<ul class="actions fit">
								<li><a href="javascript:setAsMain()" class="button primary fit">Set As Main Picture</a></li>
								<li><a id="change" class="button primary fit">Change
										Picture</a></li>
								<li><a href="javascript:deletePic()" class="button primary fit">Delete
										Picture</a></li>
							</ul>

							<h4 style="margin-bottom: 0">
								<b>Guidelines for main profile picture</b>
							</h4>
							<ul>
								<li>Smile and look at the camera</li>
								<li>Frame your head and shoulders</li>
								<li>Your photo is centered and upright</li>
								<li>Use neutral lighting and background</li>
								<li>Your face and eyes are fully visible (except for religious reasons)</li>
								<li>Avoid logos or contact information</li>
								<li>You are the only person in the photo</li>
							</ul>

							<h4 style="margin-bottom: 0">
								<b>The following pictures may be taken down arbitrarily</b>
							</h4>
							<ul>
								<li>A picture that cannot identify the helper's face</li>
								<li>A picture that contains private information such as
									names or phone numbers</li>
								<li>A picture that contains physical exposures and
									disturbing images</li>
							</ul>

						</div>
						<!-- col-6 col-12-medium -->
					</div>
					<!-- box -->

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
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/helper_profile_photos.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>
	<script>
		var temp = '<%=request.getServletContext().getRealPath("/")%>';
		console.log(temp);
	</script>
	<script>
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

	<!-- 클릭한 이미지 확대 기능 -->
	<!-- <script>
$(document).ready(function (e){
	
	$(document).on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});//end click event
	
	function showImage(fileCallPath){
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='"+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });//end bigWrapperClick event
	  
	});
</script> -->

</body>
</html>