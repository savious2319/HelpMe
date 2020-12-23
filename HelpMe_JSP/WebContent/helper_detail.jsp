<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
   type="text/css" />
<title>Helper Profile</title>
</head>
<style>
   #profile_wrap{
               display: flex;
             margin: 0 auto;
         }
         
         .profile_pic{
            width:300px; 
            height:300px; 
            border-radius:4px;
         }
         
         .profile_head{
            margin-bottom: 24px;
         }
         
         .profile_cell{
            flex: 1 1 auto;
            padding: 0 16px;
         }
            
          header.major h1:after, header.major h2:after {         
               content: none;         
         }
         
         h1 {
          font-style: inherit;  
         }
         
         #background{
         text-align:center;
         display:flex;
         }
         
          .links li{
            display:block;
         }
         
         ul {
             list-style: disc;
             margin: 0 0 0 0;
             padding-left: 1rem;
         }
         
         ul li{
            padding-left:0px;
            /* margin-bottom:1rem; */
         }
         
         hr{
            margin:15px;
         }
         
         #description{       
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
         
         .box {
          border-radius: 4px;
           border: none;
          margin-bottom: 2.5rem;
          padding: 1.5rem;
         }
         
         .wrapper {
            padding: unset;
          position: relative;
          overflow-x: hidden;
         }
            
            .helper_name, .helper_price, .helper_rating{
               margin:0px;
            }
            
            .info{
               margin:0px;
            }
            
           /* #photos {
         width: 100%;
         box-shadow: rgba(0, 0, 0, 0.16) 0px 16px 32px 0px;
         padding: 30px;
          text-align: center;
         } */
      
         #helper_pics{
         padding: 3rem; 
         text-align:left;
         box-shadow: rgba(0, 0, 0, 0.16) 0px 16px 32px 0px;
         }
         
      #main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
         width: 260px;
         height: 260px;
         border-radius: 4px;
         margin: 15px;
      }
      
      .pic_box {
         display: flex;
         -webkit-box-pack: justify;
         justify-content: space-between
      }
      
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
      
       #about_the_helper{
          box-shadow: rgba(0, 0, 0, 0.16) 0px 16px 32px 0px;
       }
       
       p{
          margin: unset;
       }
      
      /* #main {
          padding-top: 80px;
      } */
      
      #kakao_img{
         float: right;
          margin-left: 30px;
      }
      
      #unable{
         width: 50px;
          height: 50px;
      }
      /*추가*/      
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
               
               #helper_card{
               margin:0 auto; 
               border:none; 
               border-color:rgba(144, 144, 144, 0.25); 
               width:100%;
               border-radius: 4px;
                margin-top: 2.5rem;
             padding: 1.5rem;
             display:grid;
                grid-template-columns: 172px 807px 318px; 
                gap:24px;
             -webkit-box-pack: start;
              justify-content: start;
               }
               #pictures{
            width:260px;
            height:260px;
            }
            #content{
            width: 80%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         /*추가*/
         @media screen and (max-width: 1920px) {
            nav{
            margin-top: 16px;
            }
            .logo{
               margin-top: 7px;      
            }
            #kakao_img_size{
            width: 50px;
             height: 50px;
            }
            #unable{
            width: 50px;
             height: 50px;
            }
            #helper_card{
               margin:0 auto; 
               border:none; 
               border-color:rgba(144, 144, 144, 0.25); 
               width:100%;
               border-radius: 4px;
                margin-top: 2.5rem;
             padding: 1.5rem;
             display:grid;
                grid-template-columns: 172px 807px 314px; 
                gap:24px;
             -webkit-box-pack: start;
              justify-content: start;
               }
               #pictures{
            width:260px;
            height:260px;
            }
            #content{
            width: 80%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }  
         /*추가*/    
         @media screen and (max-width: 1440px){
            #helper_pics{
               text-align:center;
            }
            .logo{
               margin-top: 4px;      
            }
            #helper_card{
               margin:0 auto; 
               border:none; 
               border-color:rgba(144, 144, 144, 0.25); 
               width:100%;
               border-radius: 4px;
                margin-top: 2.5rem;
             padding: 1.5rem;
             display:grid;
                grid-template-columns: 162px 744px 250px; 
                gap:24px;
             -webkit-box-pack: start;
              justify-content: start;
               }
               #pictures{
            width:260px;
            height:260px;
            }
            #content{
            width: 80%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }
         @media screen and (max-width: 1024px){
            #helper_card{
               grid-template-columns:162px 479px 250px;
            }
            
            #kakao_img{
               float: none;
                margin-left: 187px;
            }
            
            #kakao_img_size{
               width: 50px;
                height: 50px;
            }
            #pictures{
            width:260px;
            height:260px;
            }
            #content{
            width: 80%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }
         /*추가*/
         @media screen and (max-width: 980px) {
            .logo{
               margin-top: 7px;      
            }
            #pictures{
            width:260px;
            height:260px;
            }
            #about_the_helper{
          padding: 2rem;
          }
         }
         /*추가*/
         @media screen and (max-width: 768px){
         #helper_card{
               grid-template-columns:auto;
            }
               #background li{
                  text-align:left;
               }
               .logo{
                  margin-top: -8px;      
               }   
               #pictures{
            width:260px;
            height:260px;
            }
            #kakao_img{
               float: none;
                margin-left: 205px;
            }
            #content{
            width: 100%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }
         
         /*추가*/
         @media screen and (max-width: 425px){
               #main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
                  width: 200px;
                  height: 200px;
                  border-radius: 4px;
                  margin: 15px;
               }
               .logo{
                  margin-top: -4px;      
               }
            #pictures{
            width:260px;
            height:260px;
            }
            #content{
            width: 100%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }
         /*추가*/
         @media screen and (max-width: 375px){
            #helper_card{
               grid-template-columns:auto;
            }
            
            #kakao_img{
               float: none;
                margin-left: 200px;
            }
            
            #kakao_img_size{
               width: 50px;
                height: 50px;
            }
            
            #main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
                  width: 180px;
                  height: 180px;
                  border-radius: 4px;
                  margin: 15px;
            }
            .logo{
               margin-top: -8px;      
            }
            #pictures{
            width:200px;
            height:200px;
            }
            #content{
            width: 100%;
          }
          #about_the_helper{
          padding: 2rem;
          }
         }
         
         
         @media screen and (max-width: 320px){
            #helper_card{
               grid-template-columns:auto;
            }
            
            #kakao_img{
               float: none;
                margin-left: 200px;
            }
            
            #kakao_img_size{
               width: 80px;
                height: 80px;
            }
            
            #main_pic, #pic1, #pic2, #pic3, #pic4, #pic5 {
                  width: 140px;
                  height: 140px;
                  border-radius: 4px;
                  margin: 15px;
               }
            #pictures{
            width:200px;
            height:200px;
            }
            #helper_pics{
         padding: 1rem;
         text-align:left;
         box-shadow: rgba(0, 0, 0, 0.16) 0px 16px 32px 0px;
         }
         #content{
            width: 100%;
          }
          #about_the_helper{
          padding: 2rem;
          }
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<body class="is-preload">

   <c:set var="loginAs" value="${requestScope.loginAs}"/>
   <c:set var="h_list" value="${requestScope.helperList}"/>
   <c:set var="h_lan1" value="${requestScope.helperLanguages_1}"/>
   <c:set var="h_lan" value="${requestScope.helperLanguages}"/>
   <c:set var="h_edu" value="${requestScope.helperEducation}"/>
   <c:set var="h_work" value="${requestScope.helperWork}"/>
   <c:set var="h_cer" value="${requestScope.helperCertificate}"/>
   <c:set var="h_picMain" value="${requestScope.helperMainPicture}"/>
   <c:set var="h_picList" value="${requestScope.helperPictures}"/>


   <!-- Header -->
   <header id="header">
       <c:choose>
      <c:when test="${session_id eq null}">
         <a class="logo" href="${pageContext.request.contextPath}/main_Default.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
      </c:when>
      <c:otherwise>
         <c:choose>
         <c:when test="${loginAs eq 'loginAsClient'}">
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp?loginAs=${loginAs}"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:when>
         <c:otherwise>
         <a class="logo" href="${pageContext.request.contextPath}/main_LogIn.jsp"><img src="${pageContext.request.contextPath}/images/logo11_2.png"/></a>
         </c:otherwise>
         </c:choose>
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
      <c:choose>
      <c:when test="${session_id eq null}">
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
      </c:when>
      <c:otherwise>
         <nav id="menu">
            <ul class="links">
               <%-- onclick으로 "logoutForm.submit()"을 줘서 ClientLogOutAction으로 간다. --%>
               <li><a href="${pageContext.request.contextPath}/client/ClientLogOut.cl" class="button">Log Out</a></li>
               <!--<li><a href="signup.jsp" class="button primary">Sign Up</a></li>
               <li><a href="login.jsp" class="button">Log In</a></li> -->
               <li><a href="${pageContext.request.contextPath}/main_LogIn.jsp?loginAs=${loginAs}">Home</a></li>
               <c:choose>
               <c:when test="${loginAs eq 'loginAsClient'}">
                  <li><a href="${pageContext.request.contextPath}/client/ClientReservationOk.cl">My Page</a></li>
               </c:when>
               <c:otherwise>
                  <li><a href="${pageContext.request.contextPath}/schedule/HelperScheduleOk.sc">My Page</a></li>
               </c:otherwise>
               </c:choose>
               <li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search Helper</a></li>
               <li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper Review Board</a></li>

            </ul>
         </nav>
      </c:otherwise>
   </c:choose>
         
   <!-- Main -->
            <c:forEach var="h_list" items="${h_list}" varStatus="status">
         <section id="main" class="wrapper">
            <div class="inner">
               <header class="major">                  
               </header>
               <div class="col-6 col-12-medium" id="helper_card">
            <div class="col-6 col-12-medium">      
                  <img src="${pageContext.request.contextPath}/${h_picMain}" class="profile_pic">
               </div>              
               <div class="col-6 col-12-medium">
                  <a href="" style="text-decoration:none; float:left"><h4 class="helper_name"><b>${h_list.getHelper_id()}</b></h4></a>
                  <img src="${h_list.getFlag_url()}" style="width:20px; margin-top: 13px; margin-left: 7px;">                 
                  <p class="info">${h_list.getHelp_location()}</p>                  
                  <p class="info">
                  ${h_lan1}
                  </p>             
                  <p class="info">
                  ${h_list.getIntro_title()}
                  </p>                                 
               </div>                             
               <div class="col-6 col-12-medium">               
               <div style="float:left; margin-right:2rem">                
                     <h4 class="helper_rating">${h_list.getAvg_rating()}</h4>
                     <c:if test="${h_list.getRating_cnt() > 1}"><h5>${h_list.getRating_cnt()} reviews</h5></c:if>
                        <c:if test="${h_list.getRating_cnt() <= 1}"><h5>${h_list.getRating_cnt()} review</h5></c:if>
                  </div>                  
                  <div style="float:left">
                     <h4 class="helper_price">${h_list.getFare()}</h4>
                     <h5>per 30 mins</h5>
               </div>                  
                  <div id="kakao_img">
                     <c:if test="${session_id != null}">
                     <c:choose>
               <c:when test="${loginAs eq 'loginAsClient'}">
                        <a id="kakao_url" href="${h_list.getKakao_url()}"><img id="kakao_img_size" src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
               </c:when>
               <c:otherwise>
                        <a id="kakao_url"><img id="kakao_img_size" src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
               </c:otherwise>
               </c:choose>   
                     </c:if>
                     <c:if test="${session_id == null}">   
                        <a href="javascript:pleaseLogin()"><img id="unable" src="${pageContext.request.contextPath}/images/open_chat_icon.png"></a>
                     </c:if>      
                  </div>                  
               </div>             
               </div>
            </div>
         </section>                        
      
      <section id="main" class="wrapper alt" style="padding-top: 2rem">
      <div class="inner">
         <div class="row gtr-200">
            <div class="col-6 col-12-medium" id="content"style="margin: 0 auto; display: table;">               

               <div class="box">
                  <div class="col-6 col-12-medium" id="about_the_helper" >
                                 
                  <h4 class="aboutheader" style="font-weight:bold; margin-bottom:1.5rem; color: #51CCA8;">About the helper</h4>
                  ${h_list.getDescription()}                  
                  </div>
                  <!-- col-6 col-12-medium -->
               </div>
               <!-- box -->

            </div>
            </div>
         </div>
   </section>
   </c:forEach>
   
   
   <section id="main" class="wrapper alt" style="padding-top: 2rem">
      <div class="inner">
         <div class="row gtr-200">
            <div class="col-6 col-12-medium"  id="content"style="margin: 0 auto; display: block;">               

               <div class="box">
                  <div class="col-6 col-12-medium" id="about_the_helper">
                  
                  <h4 style="padding-left:1rem; margin-bottom:1rem; font-weight:bold; color: #51CCA8;">Languages</h4>
                  <c:forEach var="h_lan" items="${h_lan}" varStatus="status">
                  <ul id="background">
                  <li id="background">${h_lan}</li>
                  </ul>
                  </c:forEach>
                  
                  <hr>
                  <h4 style="padding-left:1rem; margin-bottom:1rem; font-weight:bold; color: #51CCA8;">Education</h4>
                  <c:forEach var="h_edu" items="${h_edu}" varStatus="status">
                  <ul id="background">
                  <li id="background">${h_edu}</li>
                  </ul>
                  </c:forEach>
                  
                  <hr>
                  <h4 style="padding-left:1rem; margin-bottom:1rem; font-weight:bold; color: #51CCA8;">Work Experience</h4>
                  <c:forEach var="h_work" items="${h_work}" varStatus="status">
                  <ul id="background">
                  <li id="background">${h_work}</li>
                  </ul>
                  </c:forEach>
                  
                  <hr>
                  <h4 style="padding-left:1rem; margin-bottom:1rem; font-weight:bold; color: #51CCA8;">Certificate</h4>
                  <c:forEach var="h_cer" items="${h_cer}" varStatus="status">
                  <ul id="background">
                  <li id="background">${h_cer}</li>
                  </ul>
                  </c:forEach>
                  </div>
                  <!-- col-6 col-12-medium -->
               </div>
               <!-- box -->

            </div>
            </div>
         </div>
   </section>
      
      
      
                  
         <section id="main" class="wrapper alt" style="padding-top: 2rem">
      <div class="inner">
         <div class="row gtr-200">
            <div class="col-6 col-12-medium" id="content"style="margin: 0 auto; display: table;">               

               <div class="box">
                  <div class="col-6 col-12-medium"  id="helper_pics" style="text-align:center;">
                     <h4 style="font-weight:500; text-align:left; font-weight:bold; color: #51CCA8;">
                        Photos
                     </h4>

                     <div class='bigPictureWrapper'>
                        <div class='bigPicture'></div>
                     </div>

                     <!-- <div class="inner" id="photos"> -->
                     <c:forEach var="h_picList" items="${h_picList}" varStatus="status">
                        <img id="pictures" src="${pageContext.request.contextPath}/${h_picList}">
                     </c:forEach> 
                     <!-- </div> -->

                     <form name="signform" method="POST" ENCTYPE="multipart/form-data"
                        action="">
                        <input type="file" id="file" name="file" style="display: none;"
                           onchange="changeValue(this)"> <input type="hidden"
                           name="target_url">
                     </form>                     
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
   <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
   <script>var contextPath = "${pageContext.request.contextPath}";</script>
   
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
   <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   <script src="${pageContext.request.contextPath}/search.js"></script>
   <script>
      /* function pleaseLogin(){
         alert("Please try again after logging in");
      } */
      $('#unable').click(function(){
         alert("Please try again after logging in");
      });
   </script>
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
   <script>
   $(document).ready(function (e){
   
   $(document).on("click","img",function(){
      var path = $(this).attr('src')
      console.log(path);
      if(path == contextPath+"/images/open_chat_icon.png"){
         $('kakao_url').get(0).click();
         return false;
      }
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
   </script>
</body>
</html>