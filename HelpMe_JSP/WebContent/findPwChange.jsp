<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
   <head>
      <title>Client Updates</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
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

</style>
   <body class="is-preload">

   <body class="is-preload">
	<input type="hidden" id="randomStr" value="${randomStr}">
	<input type="hidden" name="userRandomStr" id="userRandomStr" value="${param.userRandomStr}">
      <!-- Header -->
         <header id="header">
            <a class="logo" href="${pageContext.request.contextPath}/main_Default.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
            <!-- <a class="logo" href="main_Default.jsp"><img src="images/logo_85x21.png"/></a> -->
            <nav>
               <ul>
                  <li>
                     <a href="#menu">Menu</a>
                  </li>
               </ul>
            </nav>
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
         
         <div class="inner">
         <div class="row gtr-200">
               <div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:78%">
               <header class="major" style="text-align:center; margin-top: 5rem; margin-bottom: 3rem">
               <h1>Change Password</h1>
               </header>
               </div>
         </div>
         </div>
         <section id="main" class="wrapper alt" style="padding-top:2rem">
         <div class="inner">
         <div class="row gtr-200">
         <div class="col-6 col-12-medium" style="margin:0 auto; display:table; width:80%">
			<div class="box">
			<%-- FindPasswordAction에서 설정한 randomStr을 가져온다. --%>
			<c:set var="verificationCode" value="${randomStr}"/>
			<c:set var="verificationCode_user" value="${param.userRandomStr}"/>
				<c:choose>
					<%-- verificationCode와 verificationCode_user가 일치해야 비밀번호 변경이 가능 --%>
					<c:when test="${verificationCode eq verificationCode_user}">		
					<%-- ChangePwAction으로 가도록 action 설정 --%>			
					<form name="changePwForm" method="post" action="${pageContext.request.contextPath}/client/ChangePw.cl">
						<div class="col-6 col-12-medium" style="margin: left">
							<h4 style="margin-bottom: 20px; font-style: italic">
								<strong>Change Password</strong>
							</h4>
							<h5 class="aboutheader">
								<b>ID</b>
							</h5>
							<%-- 아이디 입력 --%>
							<input type="text" name="changeId" id="changeId" style="margin-bottom: 2rem; background-color: white" />
							<h5 class="aboutheader">
								<b>New password</b>
							</h5>
							<%-- 새로운 비밀번호 입력 --%>
							<input type="password" name="changePw" id="changePw" style="margin-bottom: 2rem; background-color: white" />

							<h5 class="aboutheader">
								<b>Verify password</b>
							</h5>
							<%-- 비밀번호 확인 --%>
							<input type="password" name="changeVfPw" id="changeVfPw" style="margin-bottom: 2rem; background-color: white" />
						
							<input type="button" value="Change your password" style="display:block; margin:0 auto;" onclick="formSubmit()">
						</div>
					</form>
					</c:when>
					<c:otherwise>
						<%-- verificationCode와 verificationCode_user가 일치하지 않을 경우에 나오는 메세지 --%>
						<h5 class="aboutheader">This link has been expired</h5>
					</c:otherwise>
				</c:choose>
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
         <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
         <script src="${pageContext.request.contextPath}/client_updates.js"></script>
         <script>var contextPath = "${pageContext.request.contextPath}";</script>
         
         <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
         <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
         <script>
         	//인증 번호 확인을 위한 콘솔 로고 출력
         	console.log("인증번호 : " + $("#randomStr").val());
         	console.log("사용자 인증번호 : " + $("#userRandomStr").val());
         
                 $(document).ready(function () {
                     $("#datepicker").datepicker({
                      maxDate:30,
                         minDate:1
                     });
                 });
            
			//비밀번호 제작 규정에 맞는지 확인
          	function formSubmit(){
          		var form = document.changePwForm;
          		var changeId = document.getElementById("changeId").value;
          		var changePw = document.getElementById("changePw").value;
          		var changeVfPw = document.getElementById("changeVfPw").value;
          		//대문자, 소문자, 숫자, 특수문자가 들어간 8글자 이상의 비밀번호인가?
          		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
          		
          		if(changePw!=changeVfPw){
          			alert('You should fill in same letters in password and verify password.');
          			return false;		
          		}
          		else if(!reg.test(changePw)){				//비밀번호는 대문자, 소문자, 숫자, 특수문자를 모두 포함하여 8글자 이상
          			alert('Your length of password should be over than 8 letters. Also your password must include upper cases, lower cases, numbers, and special characters');
          			return false;
          		}
          		else if(/(\w)\1\1\1/.test(changePw)){		//같은 글자는 4번 이상 사용 못함.
          			alert("You can't use same letters over than 4 times to make passowrd.");
          			return false;
          		}
          		else if(changePw.search(changeId) > -1){			//아이디가 비밀번호에 들어가면 안 된다.
          			alert("Your password can not include id.");
          			return false;
          		}
          		else if(changePw.search(/\s/) != -1){			//비밀번호에 공백을 포함할 수 없다.
          			alert("Please don't use space in your password.");
          			return false;	
          		}
          		else{
          			alert('Your password has been changed.');
          			form.submit();
          		}
          	}
          	
    </script>

   </body>
</html>