<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<!--
   Cascade by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
   <head>
      <title>HelpMeLogin</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="/helpme/resources/assets/css/main.css?ver=1" />
<style >
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
         #client_id, #client_password, #facebook_login, #google_login{
            width : 25%;
         }

      }
      /*추가*/
      @media screen and (max-width: 1440px) {
         .logo{
            margin-top: 4px;      
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 30%;
         }
      }      
      /*추가*/      
      @media screen and (max-width: 980px) {
         .logo{
            margin-top: 7px;      
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 35%;
         }
      }
      /*추가*/      
      @media screen and (max-width: 768px) {
         .logo{
            margin-top: 4px;      
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 42%;
         }         
      }      
      /*추가*/      
      @media screen and (max-width: 736px) {
         .logo{
            margin-top: -8px
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 42%;
         }         
      }
      /*추가*/         
      @media screen and (max-width: 425px) {
         .logo{
            margin-top: -4px;      
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 68%;
         }
      }   
      /*추가*/      
      @media screen and (max-width: 375px) {
         .logo{
            margin-top: -8px;      
         }
         #client_id, #client_password, #facebook_login, #google_login{
            width : 70%;
         }         
      }         
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   </head>
   
   <body class="is-preload" name="login_body">
      <c:if test="${not empty param.login}">
              <c:if test="${not param.login}">
                 <script>alert("Please Check your id, password or radio button.")</script>
              </c:if>
      </c:if>
      <!-- Header -->
         <header id="header">
            <!-- img src로 이미지를 가져온다. -->
            <a class="logo" href="/helpme/home"><img src="/helpme/resources/images/logo11_2.png"/></a>
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
            <li><a href="/helpme/signup" class="button primary">Sign Up</a></li>
               <li><a href="/helpme/login" class="button">Log In</a></li>
               <li><a href="/helpme/home">Home</a></li>
               <li><a href="${pageContext.request.contextPath}/login.jsp">My Page</a></li>
               <li><a href="${pageContext.request.contextPath}/helper/all.he">Search Helper</a></li>
               <li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1">Helper Review Board</a></li>
            </ul>
         </nav>
   
      <a id="back-to-top" style="text-decoration:none"></a>
      <!-- Main -->
         <section id="main" class="wrapper">
            <div class="inner">

               <header class="major">
                  <h1>Log in</h1>
               </header>
               <p style="text-align:center;">
               <!-- <a id="loginToSignUp" onclick="location.href='signup.jsp'">Sign Up</a> -->
               <a id="loginToSignUp" href="/helpme/signup">Sign Up</a>
               </p>

               <!-- 제네릭에 있는 이미지 주석 처리 -->
               <!-- <span class="image main"><img src="images/pic04.jpg" alt="" /></span> -->
               
               <!-- style에 display:block; margin:0 auto;를 넣어 가운데 정렬 -->
               <input type="image" id="facebook_login" src="/helpme/resources/images/facebook_login.png" style="display:block; margin:0 auto;">
               <input type="image" id="google_login" src="/helpme/resources/images/google_login.png" style="display:block; margin:0 auto;"><br>
               <!--  
               <input type="button" id="faceBook" style="width:300px; display:block; margin:0 auto;" value="Login with Facebook"><br>
               <input type="button" id="google" style="width:300px; display:block; margin:0 auto;" value="Login with Google"><br>
               -->
               <!-- <input type="button" id="loginToSignUp" onclick="location.href='signup.jsp'" style="width:300px; display:block; margin:0 auto;" value="Sign Up?"><br> -->
               <form name="loginForm" method="post">
                  <p style="text-align:center;">               
                     ID : 
                     <input type="text" id="client_id" name="client_id" style="display:block; margin:0 auto;">
                      PW : 
                     <input type="password" id="client_password" name="client_password" style="display:block; margin:0 auto;">
                     <a id="findId" href="#" onclick="findIdPop()">Find Your ID</a>
                     <br>
                     <a id="findPw" href="#" onclick="findPWPop()">Find Your Password</a>
                  </p>
                  <!-- 라디오 버튼으로 헬퍼로 로그인할지, 클라이언트로 로그인 할지 결정 -->                  
                  <div class="col-4 col-12-small" style="text-align:center;">
                     <input type="radio" id="loginAsClient" value="loginAsClient" name="loginAs" checked>
                     <label for="loginAsClient">Log in as client</label>
                  </div>
                  <div class="col-4 col-12-small" style="text-align:center;">
                     <input type="radio" id="loginAsHelper" value="loginAsHelper" name="loginAs">
                     <label for="loginAsHelper">Log in as helper</label>
                     <br>
                  </div>
                  <!-- 나중에 로그인 버튼을 통해 login_ok 페이지로 가도록 -->
                  <input type="button" id="login" onclick="idIdentify()" style="width:150px; display:block; margin:0 auto;" value="Login">
               </form>
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
         <script src="/helpme/resources/assets/js/login.js"></script>
         <script>var contextPath = "${pageContext.request.contextPath}";</script>

   </body>
   <script>
      function findIdPop(){
         window.open("findId.jsp","findId","width=600, height=500, left=100, top=50");
      }
      function findPWPop(){
         window.open("findPW.jsp","findPW","width=600, height=500, left=100, top=50");
      }
      
      $("form[name='loginForm']").keyup(function(event){
         if(event.keyCode==13){
            //alert("entered");
            console.log("entered");
            idIdentify();
         }
      });
      
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
</html>