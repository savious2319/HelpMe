<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<title>HelpMe_main</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/helpme/resources/assets/css/main.css?ver=1" />
	</head>
	<style>
		#step2_1 {display: block;}
		#step2_2 {display: none;}
		#step2_3 {display: none;}
		#step2_4 {display: none;}
		#step2_5 {display: none;}
		#step2_6 {display: none;}
		#step2_7 {display: none;}	
		
		#banner h1:after {
    		content: none;
		}
		
		#banner:after{
    		background-color:#1e2731;
		}
		
		#banner .inner {
    		max-width: none; 		 	
		}
				
		ul.actions.special {
   		 margin-top: 200px;
		}		
		
		ul.actions li {
   		 padding: 0 0 0 8.25rem;
		}	
		
		header.major h1:after, header.major h2:after {
   		 content: none;
		}	
		
		.image {
    	 position: unset; 
		}
					
		#btn1 {margin-right: 5%;margin-top: 5%;}
		#btn2 {margin-left: 5%;margin-top: 5%;}		

		/*추가*/
		@media screen and (max-width: 2560px) {
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
				#wrap{
				  margin:0 auto;  
				}
		/*추가*/		
		@media screen and (max-width: 1980px) {
				.logo{
					margin-top: 7px;		
				}
		}
		/*추가*/				
		@media screen and (max-width: 1440px) {
				#step2_1 {display: none;}
				#step2_2 {display: block;}
				#step2_3 {display: none;}
				#step2_4 {display: none;}
				#step2_5 {display: none;}
				#step2_6 {display: none;}
				#step2_7 {display: none;}
				
				#btn1 {margin-right: 5%;margin-top: 5%;}
				#btn2 {margin-left: 5%;margin-top: 5%;}
		
				.logo{
					margin-top: 4px;		
				}
		}
		@media screen and (max-width: 1024px) {
				#step2_1 {display: none;}
				#step2_2 {display: none;}
				#step2_3 {display: block;}
				#step2_4 {display: none;}
				#step2_5 {display: none;}
				#step2_6 {display: none;}
				#step2_7 {display: none;}
				
				#btn1 {margin-right: 5%;margin-top: 5%;}
				#btn2 {margin-left: 5%;margin-top: 5%;}
		}
		/*추가*/		
		@media screen and (max-width: 980px) {
		
		         ul.actions:not(.fixed) {
		            -moz-flex-direction: column;
		            -webkit-flex-direction: column;
		            -ms-flex-direction: column;
		            flex-direction: column;
		            margin-left: 0;
		            width: 100% !important;
		         }
		
		            ul.actions:not(.fixed) li {
		               -moz-flex-grow: 1;
		               -webkit-flex-grow: 1;
		               -ms-flex-grow: 1;
		               flex-grow: 1;
		               -moz-flex-shrink: 1;
		               -webkit-flex-shrink: 1;
		               -ms-flex-shrink: 1;
		               flex-shrink: 1;
		               padding: 1.25rem 0 0 0;
		               text-align: center;
		               width: 100%;
		            }
		
		               ul.actions:not(.fixed) li > * {
		                  width: 100%;
		               }
		
		               ul.actions:not(.fixed) li:first-child {
		                  padding-top: 0;
		               }
		
		               ul.actions:not(.fixed) li input[type="submit"],
		               ul.actions:not(.fixed) li input[type="reset"],
		               ul.actions:not(.fixed) li input[type="button"],
		               ul.actions:not(.fixed) li button,
		               ul.actions:not(.fixed) li .button {
		                  width: 100%;
		               }
		
		               ul.actions:not(.fixed) li input[type="submit"].icon:before,
		               ul.actions:not(.fixed) li input[type="reset"].icon:before,
		               ul.actions:not(.fixed) li input[type="button"].icon:before,
		               ul.actions:not(.fixed) li button.icon:before,
		               ul.actions:not(.fixed) li .button.icon:before {
		                  margin-left: -0.5rem;
		               }
					.logo{
						margin-top: 7px;		
					}
		      }
		/*추가*/		      
		@media screen and (max-width: 768px) {
				#step2_1 {display: none;}
				#step2_2 {display: none;}
				#step2_3 {display: none;}
				#step2_4 {display: block;}
				#step2_5 {display: none;}
				#step2_6 {display: none;}
				#step2_7 {display: none;}
				
				#btn1 {margin-right: 5%;margin-top: 5%;}
				#btn2 {margin-left: 5%;margin-top: 5%;padding: 0 0 0 5.25rem;}
				
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
				#step2_1 {display: none;}
				#step2_2 {display: none;}
				#step2_3 {display: none;}
				#step2_4 {display: none;}
				#step2_5 {display: block;}
				#step2_6 {display: none;}
				#step2_7 {display: none;}
				
				#btn1 {margin-right: 5%;margin-top: 5%;}
				#btn2 {margin-top: 5%;}
			
				.logo{
				margin-top: -4px;		
			}			
		}
		/*추가*/		
		@media screen and (max-width: 375px) {
				#step2_1 {display: none;}
				#step2_2 {display: none;}
				#step2_3 {display: none;}
				#step2_4 {display: none;}
				#step2_5 {display: none;}
				#step2_6 {display: block;}
				#step2_7 {display: none;}
			
				.logo{
				margin-top: -8px;		
			}			
		}
		@media screen and (max-width: 320px) {
				#step2_1 {display: none;}
				#step2_2 {display: none;}
				#step2_3 {display: none;}
				#step2_4 {display: none;}
				#step2_5 {display: none;}
				#step2_6 {display: none;}
				#step2_7 {display: block;}
		}



</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<body class="is-preload">
	<c:if test="${session_id eq null}">
            <script> alert('Please try again after logging in');
                  window.open("$/helpme/home", "_self")
            </script>
   </c:if>
		<!-- Header -->
			<header id="header" class="alt">
				<a class="logo" href="/helpme/main_LogIn?loginAs=${param.loginAs}"><img src="/helpme/resources/images/logo11_2.png"/></a>
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
					<li><a href="$/helpme/main_LogIn?loginAs=${param.loginAs}">Home</a></li>
					<c:choose>
					<c:when test="${param.loginAs eq 'loginAsClient'}">
						<li><a href="/helpme/client/reservation?loginAs=${param.loginAs}">My Page</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/helpme/helper/schedule">My Page</a></li>
					</c:otherwise>
					</c:choose>
					<li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${param.loginAs}">Search Helper</a></li>
					<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${param.loginAs}">Helper Review Board</a></li>

				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="image" data-position="center right">
					<img src="/helpme/resources/images/HM_img_main2.png" alt="" />
				</div>
				<div class="inner">					
					<h1>Do you need help?</h1>
					<h1>Talk with one of our experts</h1>
					<ul class="actions special">
						<li class="btn1"><a href="#four" class="button large wide scrolly-middle">HOW TO USE</a></li>
						<li class="btn2"><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${param.loginAs}" class="button large wide scrolly-middle">SEARCH HELPERS</a></li>
						<li class="btn3"><a href="#five" class="button large wide scrolly-middle">SERVICES</a></li>
					</ul>
				</div>
			</section>

		<!-- Spotlight -->
			<article id="one" class="spotlight odd accent1">
				<div class="inner">
					<div class="image" data-position="top right">
						<img src="/helpme/resources/images/step1.png" alt="" />
					</div>
					<h2>There has never<br />
					been a service<br />
					like this before</h2>	
									
				</div>
			</article>

		<!-- Spotlight -->
			<article id="two" class="spotlight even accent2">
				<div class="inner">
					<div class="image" data-position="top left">
						<img src="/helpme/resources/images/step2.png" alt="" />
					</div>
					<h2>Everything<br />
					becomes<br />
					easy</h2>		
								
				</div>
			</article>
	<section class="wrapper style4">
		<div class="inner">			
			<div class="carousel">
				<article class="visible" style="">
					<div class="image" data-position="top center">
						<img id="step1_1" src="/helpme/resources/images/Kakao.png">
						<img id="step1_2" src="/helpme/resources/images/Kakao.png">
						<img id="step1_3" src="/helpme/resources/images/shopping.png">
						<img id="step1_4" src="/helpme/resources/images/kakaotalk.png">
						<img id="step1_5" src="/helpme/resources/images/Kakao.png">
						<img id="step1_6" src="/helpme/resources/images/food.png">
						<img id="step1_7" src="/helpme/resources/images/1.png">
					</div>
					<div class="content" id="four">
						<h3>How to use our website</h3><br>
						<p>1. Simply sign up first and login in</p>
						<p>2. Click on SEARCH HELPER</p>
						<p>3. Select one of the service categories</p>
						<p>4. Select the area where you would like to get help</p>
						<p>5. Select the date of your reservation 
						All reservations must be made 24 hours prior to the meeting<br/>
						and can be made up to one month in advance</p>
						<p>6. Select the start and the end time</p>
						<p>7. Click search button and choose your favorite helper</p>
						<p>8. Click on the Kakao open chat icon for reservation</p>
											
					</div>
				</article>
				<article style="display: none;" class="">
					<div class="image" data-position="center center">
						<img id="step2_1" src="/helpme/resources/images/Kakao.png">
						<img id="step2_2" src="/helpme/resources/images/Kakao.png">
						<img id="step2_3" src="/helpme/resources/images/Kakao.png">
						<img id="step2_4" src="/helpme/resources/images/Kakao.png">
						<img id="step2_5" src="/helpme/resources/images/Kakao.png">
						<img id="step2_6" src="/helpme/resources/images/Kakao.png">
						<img id="step2_7" src="/helpme/resources/images/Kakao.png">
					</div>
					<div class="content">
						<h3>How to use Kakao open chat for reservation</h3><br>
					<p>1. Please describe your request in detail</p>
					<p>2. Provide the reservation date and time</p>
					<p>3. Talk with your helper on how long the request might take</p>
					<p>4. Provide the name of the place you want to meet</p>
					<p>5. Your reservation is now complete</p>										
					</div>
				</article>
				<article style="display: none;" class="">
					<div class="image" data-position="center center">
						<img id="step2_1" src="/helpme/resources/images/step3.png">
						<img id="step2_2" src="/helpme/resources/images/step3.png">
						<img id="step2_3" src="/helpme/resources/images/step3.png">
						<img id="step2_4" src="/helpme/resources/images/step3.png">
						<img id="step2_5" src="/helpme/resources/images/step3.png">
						<img id="step2_6" src="/helpme/resources/images/step3.png">
						<img id="step2_7" src="/helpme/resources/images/step3.png">
					</div>
					<div class="content">
						<h3>Refund Policy</h3><br>
					<p>1. No points will be refunded when cancelling on the day of the reservation</p>
					<p>2. All refunds must be request 24 hours prior to the meeting day</p>
					<p>3. All points will be refunded only when cancelling the first time.</p>
					<p>4. 50% of the points will be refunded when cancelling the second time</p>
					<p>5. No points will be refunded when cancelling the third time</p>
					</div>
				</article>		
				<nav>
					<a class="previous" style="cursor: pointer;"><span
						class="label">Previous</span></a><a class="next"
						style="cursor: pointer;"><span class="label">Next</span></a>
				</nav>
			</div>
		</div>
	</section>

		
		<!-- Posts -->
			<section class="wrapper">
				<div id="wrap">
				<div class="inner">
					<header class="major">
						<h2>SERVICES</h2>
					</header>
					<div class="posts" style="padding:30px;">
						<article  id="five">
							<a class="image"><img src="/helpme/resources/images/translation.png"></a>
							<div class="content">
								<h3>Translation</h3>
								<p>We have team of experts who can translate from
								books, official documents to subtitles.
								Experience the wonderful works of our professionals.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/government service.png"></a>
							<div class="content">
								<h3>Government Service</h3>
								<p>We have helpers who can accompany you to Immigration Office to 
									handle visa works, alien registration, issuing certificates</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/tax accounting.png"></a>
							<div class="content">
								<h3>Tax Accounting</h3>
								<p>Tax laws are confusing everywhere and Korea is no exception!
									But don't worry. Our helpers will assist you with filing
									income tax and other complicated tax related documents.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/hospitial.png"></a>
							<div class="content">
								<h3>Hospitial</h3>
								<p>Our helpers will make your hosital visit more comfortable
									and relaxing. We will go see a doctor together and
									assist with all the required medical procedure.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/travel.png"></a>
							<div class="content">
								<h3>Travel</h3>
								<p>Our helpers love to take you out on a special tour in Seoul.
									Have you ever wondered where locals actually go enjoy?
									You can find out by choosing our travel service to experience
									one of the unforgettable memories in Korea.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/housing.png"></a>
							<div class="content">
								<h3>Housing</h3>
								<p>Finding your place is such a hassle and burdensome especially
									when you are living abroad. We will match you with one of our
									helpers who can assist you in finding the right nest in Seoul.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/shopping.png"></a>
							<div class="content">
								<h3>Shopping</h3>
								<p>Are you having trouble buying the products with
									quality and the right price? Our helpers can solve your problem
									by taking you to the right place to purchase the right items.</p>
							</div>
						</article>
						<article>
							<a class="image"><img src="/helpme/resources/images/food.png"></a>
							<div class="content">
								<h3>Food</h3>
								<p>Are you curious about the taste of Seoul?
									There are so many hidden eateries that are out there and
									we want to give you the special experience of enjoying the taste
									together.</p>
							</div>
						</article>
						
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
			<script>var contextPath = "${pageContext.request.contextPath}";</script>

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

</body>
</html>