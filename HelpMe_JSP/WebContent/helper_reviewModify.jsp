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
<!--
   Cascade by Pixelarity
   pixelarity.com | hello@pixelarity.com
   License: pixelarity.com/license
-->
<html>
   <head>
      <title>reviewBoardModify</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
   </head>
   
   <style>
#modifyForm {
   width: 900px;
   margin: auto;
   margin-top: 100px;
   margin-bottom: 100px;
}

table {
   margin: unset;
   width: 100%;
}

a {
   color: #000000;
   text-decoration: none;
}

h3 {
   margin: unset;
}

div {
   font-size: 20px;
   color: #000;
}

textarea{
   width:764px; 
   height:185px;
   padding:unset;
   resize: none;
}

h1:after{   
    background-color: currentColor;
    content: '';
    display: block;
    height: 3px;
    margin: 1.5rem auto;
    width: 4rem;
}

@media screen and (max-width: 1024px) {
   #modifyForm {
    width: 800px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 37px;
   }
   textarea{
   width: 676px;
   height:185px
   }
}

@media screen and (max-width: 768px) {
   #modifyForm {
    width: 700px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 37px;
   }
   textarea{
   width: 571px;
   height:185px
   }
}

@media screen and (max-width: 425px) {
   #modifyForm {
    width: 425px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 37px;
   }
   textarea{
   width: 300px;
   height:185px
   }
   #table-wrapper{
   width: 425px;
   }
   #board_file1, #board_file2, #board_file3{
   width: 70%;
   }
   #file1_delete1, #file1_delete2, #file1_delete3{
   width:22%;
   }
}

@media screen and (max-width: 375px) {
   #modifyForm {
    width: 375px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 37px;
   }
   textarea{
   width: 252px;
   height:185px
   }
   #table-wrapper{
   width: 375px;
   }
   #board_file1, #board_file2, #board_file3{
   width: 62%;
   }
   #file1_delete1, #file1_delete2, #file1_delete3{
   width:25%;
   }
}

@media screen and (max-width: 320px) {
   #modifyForm {
    width: 320px;
    margin: auto;
    margin-top: 100px;
    margin-bottom: 37px;
   }
   textarea{
   width: 197px;
   height:185px
   }
   #table-wrapper{
   width: 320px;
   }
   #board_file1, #board_file2, #board_file3{
   width: 42%;
   }
   #file1_delete1, #file1_delete2, #file1_delete3{
   width:33%;
   }
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
         #boardform {
          width: 700px;
          margin: auto;
          margin-top: 100px;
          margin-bottom: 37px;
         }
         textarea{
         width: 571px;
         height:185px
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
      @media screen and (max-width: 425px) {
         #boardform {
          width: 425px;
          margin: auto;
          margin-top: 100px;
          margin-bottom: 37px;
         }
         textarea{
         width: 300px;
         height:185px
         }
         #table-wrapper{
         width: 425px;
         }
         #board_file1, #board_file2, #board_file3{
         width: 70%;
         }
         #file1_delete1, #file1_delete2, #file1_delete3{
         width:22%;
         }
         .logo{
            margin-top: -4px;      
         }
      }
      /*추가*/      
      @media screen and (max-width: 375px) {
         #boardform {
          width: 375px;
          margin: auto;
          margin-top: 100px;
          margin-bottom: 37px;
         }
         textarea{
         width: 252px;
         height:185px
         }
         #table-wrapper{
         width: 375px;
         }
         #board_file1, #board_file2, #board_file3{
         width: 62%;
         }
         #file1_delete1, #file1_delete2, #file1_delete3{
         width:25%;
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
   <c:set var="boardBean" value="${requestScope.boardBean}"/>
   <%-- <c:if test="${session_id eq null}">
      <script>
         alert("Please use review board after login.");
         location.replace("${pageContext.request.contextPath}/client/ClientLogin.cl");
      </script>
   </c:if> --%>
   <!-- Header -->
   <header id="header">
   <c:choose>
         <c:when test="${param.loginAs eq 'loginAsClient'}">
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp?loginAs=${param.loginAs}"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:when>
         <c:otherwise>
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:otherwise>
         </c:choose>
      <nav>
         <ul>
            <li><a href="#menu">Menu</a></li>
         </ul>
      </nav>
   </header>
      
      <a id="back-to-top" style="text-decoration:none"></a>
      <!-- Menu -->
         <nav id="menu">
            <ul class="links">
               <%-- onclick으로 "logoutForm.submit()"을 줘서 ClientLogOutAction으로 간다. --%>
               <li><a href="${pageContext.request.contextPath}/client/ClientLogOut.cl" class="button">Log Out</a></li>
               <!--<li><a href="signup.jsp" class="button primary">Sign Up</a></li>
               <li><a href="login.jsp" class="button">Log In</a></li> -->
               <li><a href="main_LogIn.jsp">Home</a></li>
               <c:choose>
               <c:when test="${param.loginAs eq 'loginAsClient'}">
                  <li><a href="${pageContext.request.contextPath}/client/ClientReservationOk.cl">My Page</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc">My Page</a></li>
               </c:otherwise>
               </c:choose>
               <%-- <li><a href="">My Page</a></li>   --%>   
               <li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${param.loginAs}">Search Helper</a></li>
               <%-- href="${pageContext.request.contextPath}/BoardList.bo?page=1"를 해야 첫번째 페이지로 이동한다! --%>
               <li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${param.loginAs}">Helper Review Board</a></li>

            </ul>
         </nav>             

      <!-- Main -->
   <form action="${pageContext.request.contextPath}/BoardModifyOk.bo" method="post" id="modifyForm" name="modifyForm" enctype="multipart/form-data">
      <input type="hidden" name="seq" value="${boardBean.getBoard_num()}">
      <input type="hidden" class="category" name="category" value="${boardBean.getBoard_category()}">
      <%-- <h1 style="text-align:center;">Search Helper</h1> --%>
      <div class="table-wrapper" id="table-wrapper">
         <table class="alt">            
            <tbody>
               <tr align="center" valign="middle">
               <td><div>Category</div></td>
               <td>
                  <select name="board_category" id="board_category" style="background-color:white" >
                           <option value="">- Select Category -</option>
                           <option value="Translation">Translation</option>
                           <option value="Government Service">Government Service</option>
                           <option value="Housing">Housing</option>
                           <option value="Hospital">Hospital</option>
                           <option value="Travel">Travel</option>
                           <option value="Tax Accounting">Tax Accounting</option>
                           <option value="Shopping">Shopping</option>
                           <option value="Food">Food</option>
                        </select>
               </td>
               <tr align="center" valign="middle">
                  <td><div>Title</div></td>
                  <td><input name="board_title" id="board_title" type="text" value="${boardBean.getBoard_title()}"></td>
               </tr>
               <tr align="center" valign="middle">
                  <td><div>Writer</div></td>
                  <td><input name="board_id" type="text" value="${session_id}" readonly /></td>         
               </tr>
               <tr height="214px">
                  <td align="center"><div align="center">Content</div></td>
                  <td><textarea name="board_contents">${boardBean.getBoard_contents()}</textarea></td>
               </tr>
               <tr>
                  <td align="center"><div align="center">File1</div></td>
                  <td>
                  <input name="board_file1" id="board_file1" type="file"/>
                  <input id="file1_delete1" type="button" onclick="cancleFile('board_file1')" value="Delete">
                  </td>
               </tr>
               <tr>
                  <td align="center"><div align="center">File2</div></td>
                  <td>
                  <input name="board_file2" id="board_file2" type="file"/>
                  <input id="file1_delete2" type="button" onclick="cancleFile('board_file2')" value="Delete">
                  </td>
               </tr>
               <tr>
                  <td align="center"><div align="center">File3</div></td>
                  <td>
                  <input name="board_file3" id="board_file3" type="file"/>
                  <input id="file1_delete3" type="button" onclick="cancleFile('board_file3')" value="Delete">
                  </td>                  
               </tr>
            </tbody>            
         </table>
      </div>
         <input name="loginAs" value="${param.loginAs}" type="hidden"/>
         <div align="right">
            <a href="javascript:addboard()">[Finish Modify]</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="${pageContext.request.contextPath}/BoardList.bo?loginAs=${param.loginAs}">[List]</a>&nbsp;&nbsp;
         </div>
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
      <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
      <script src="//code.jquery.com/jquery-migrate-1.2.1.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
      <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
      <script>
      var data = $(".category").val();
      
      $("option[value='"+data+"']").prop('selected', true);
      
      
      function addboard(){
         var title = document.getElementById("board_title").value;
         var category = document.getElementById("board_category").value;
         
         //제목이나 카테고리가 공란일 경우 후기 수정이 되지 않도록 설정
         if(title==""||category==""){
             alert('Please fill in title and category.')
             return false;
          }
         modifyForm.submit();
      }
      
      </script>
      <script>
      function cancleFile(fileTagName){
         if($.browser.msie){   //ie일 때 초기화
            $("input[name='"+ fileTagName +"']").replaceWith($("input[name='"+ fileTagName +"']").clone(true));
         }else{ //그 외 브라우저일 때 초기화
            $("input[name='"+ fileTagName +"']").val("");
         }
      }
      
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