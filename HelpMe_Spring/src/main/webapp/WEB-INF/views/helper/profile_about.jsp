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
		<title>Helper About</title>
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
		/*추가*/
		@media screen and (max-width: 480px){
			
			.col-12{
				text-align:center;
			}
	
			.primary{
					width:50%;
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
				<ul class="actions fit">
									<li><a href="/helpme/helper/about" class="button">About</a></li>
									<li><a href="/helpme/helper/photos" class="button">Photos</a></li>
									<li><a href="/helpme/helper/description" class="button">Description</a></li>
									<li><a href="/helpme/helper/background" class="button">Background</a></li>
				</ul>
				
				<div class="box">
				<div class="col-6 col-12-medium" style="text-align:left">
				<h3><strong>About</strong></h3>
				<c:if test="${helper != null and fn:length(helper) > 0}">
				<c:forEach var="helper" items="${helper}">
				<h5 class="aboutheader"><b>Name</b></h5>
					<input disabled type="text" name="name" id="name" value="${helper.getName()}" style="margin-bottom:2rem" />
					
				<h5 class="aboutheader"><b>Country of origin</b></h5>
					<input disabled type="text" name="country" id="country" value="${helper.getCountry()}" style="margin-bottom:2rem"  />
				</c:forEach>
				</c:if>
				
				
				<form method="post" action="#">
				<ul class="actions fit" style="margin-bottom:0px">
				<li>
				<h5 class="aboutheader"><b>Languages spoken</b></h5>
					</li>
					
					<li>						
				<h5 class="aboutheader"><b>Level</b></h5>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
						
					<c:if test="${language != null}">
						<c:choose>
							<c:when test="${fn:length(language) > 1}">
					<c:forEach var="language" items="${language}">
				<ul class="actions fit" id="${language.getLanguage()}" style="margin-bottom:0px">
				<li>
					<select name="category" id="${language.getLanguage()}" style="background-color:white">
							  <option value="${language.getLanguage()}">${language.getLanguage()}</option>
							</select>
					</li>
					
					<li>						
					<select name="category" id="helperlanguagelevel" style="background-color:white">
												<option value="${language.getLevel()}">${language.getLevel()}</option>
											</select>
						</li>
						
						<li>
					<a href="javascript:deleteLanguage('${language.getLanguage()}')" id="removelanguage" class="button primary small" style="display:block">Remove</a>
						</li>
						</ul>			
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:forEach var="language" items="${language}">
						<ul class="actions fit" style="margin-bottom:0px">
				<li>
					<select name="category" id="helperlanguage" style="background-color:white">
							  <option value="${language.getLanguage()}">${language.getLanguage()}</option>
							</select>
					</li>
					
					<li>						
					<select name="category" id="helperlanguagelevel" style="background-color:white">
												<option value="${language.getLevel()}">${language.getLevel()}</option>
											</select>
						</li>
						<li>
					<a href="" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						</c:if>						
						
						
						
				<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
					<select name="category" id="language" style="background-color:white">
							  <option id="lang_choice" value="">Choose language...</option>
					<c:if test="${languagesList != null and fn:length(languagesList) > 1}">
					<c:forEach var="languages" items="${languagesList}" varStatus="status">
							  <option value="${languagesList[status.index]}">${languagesList[status.index]}</option>
					</c:forEach>
					</c:if>
							</select>
					</li>
					
					<li>						
					<select name="category" id="language_level" style="background-color:white">
												<option id="level_choice" value="">Choose level...</option>
												<option value="Beginner">Beginner</option>
												<option value="Elementary">Elementary</option>
												<option value="Intermediate">Intermediate</option>
												<option value="Upper Intermediate">Upper Intermediate</option>
												<option value="Advanced">Advanced</option>
												<option value="Proficient">Proficient</option>
											</select>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
						
					
						
					<!-- <a href="#" style="color:#3bb3bd">Add another language</a> -->
					</form>	
					
				<form method="post" action="#">	
				<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
				<h5 class="aboutheader"><b>Specialties</b></h5>
					</li>
					
					<li>					
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
					
					<c:if test="${specialty != null}">
					<c:choose>
					<c:when test="${fn:length(specialty) > 1}">
					<c:forEach var="specialty" items="${specialty}">
					<ul class="actions fit" id="${specialty.getSpecializedField()}" style="margin-bottom:0px">
				<li>
					<select name="category" id="${specialty.getSpecializedField()}" class="helperservice" style="background-color:white">
									<option value="${specialty.getSpecializedField()}">${specialty.getSpecializedField()}</option>
						</select>
					</li>
					
						
						<li>					
					<a href="javascript:deleteSpecialty('${specialty.getSpecializedField()}')" id="removespecialty" class="button primary small" style="display:block">Remove</a>
						</li>
						</ul>						
					</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="specialty" items="${specialty}">
					<ul class="actions fit" style="margin-bottom:0px">
				<li>
					<select name="category" id="helperservice" style="background-color:white">
									<option value="${specialty.getSpecializedField()}">${specialty.getSpecializedField()}</option>
						</select>
					</li>
					
						
						<li>					
					<a href="#" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>						
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</c:if>							
					
					<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
					<select name="category" id="service" class="choice" style="background-color:white">
												<option value="">Select Service</option>
						<c:if test="${servicesList != null and fn:length(servicesList) > 0}">
					<c:forEach var="services" items="${servicesList}" varStatus="status">
												<option value="${servicesList[status.index]}">${servicesList[status.index]}</option>
								</c:forEach>
								</c:if>				
											</select>
					</li>
					
						
						<li>					
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>	
					<!-- <a href="#" style="color:#3bb3bd">Add specialty</a> -->
				</form>
				<div class="col-12">
						<a href="javascript:makeChanges()" class="button primary">Save</a>
					</div>
				
					
				</div> <!-- col-6 col-12-medium -->		
				</div> <!-- box -->
					
				
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
			<script src="/helpme/resources/assets/js/helper_profile_about.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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

	</body>
</html>