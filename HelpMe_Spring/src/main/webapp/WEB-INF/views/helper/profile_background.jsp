<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
response.setHeader("cache-control","no-store");
response.setHeader("expires","0");
response.setHeader("pragma","no-cache");
%>
<!DOCTYPE html>
<html>
<head>
		<title>Helper Background</title>
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
		
		@media screen and (max-width: 480px){
			
			.col-12{
				text-align:center;
			}
			
			.primary{
			width:50%;
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
				<a href="/helpme/main_Login.jsp"><img src="/helpme/resources/images/logo11_2.png" alt="" /></a>
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
					<li><a href="/helpme/logout" class="button">Log Out</a></li>
					<!-- <li><a href="signup.jsp" class="button primary">Sign Up</a></li>
					<li><a href="login.jsp" class="button">Log In</a></li> -->
					<li><a href="/helpme/main_LogIn">Home</a></li>
					<li><a href="/helpme/helper/schedule">My Page</a></li>
					<li><a href="${pageContext.request.contextPath}/helper/all.he">Search Helper</a></li>
              		<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1">Helper Review Board</a></li>
				</ul>
			</nav>
	
		<a id="back-to-top" style="text-decoration:none"></a>
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
				<div class="col-6 col-12-medium">
				<h3 style="margin-bottom:20px"><strong>Education</strong></h3>	
				
						<!-- <h5 class="aboutheader"><b>Institution</b></h5>
					<input disabled type="text" name="education" id="education" value="Yonsei University" style="margin-bottom:2rem" />
						<h5 class="aboutheader"><b>Graduated Year</b></h5>
					<input disabled type="text" name="grad_year" id="grad_year" value="2011" style="margin-bottom:2rem" /> -->
					
					<form method="post" action="#">
					<ul class="actions fit" style="margin-bottom:0px">
				<li>
				<h5 class="aboutheader"><b>Institution</b></h5>
					</li>
					
					<li>						
				<h5 class="aboutheader"><b>Graduated Year</b></h5>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
					<c:choose>
					<c:when test="${education != null and fn:length(education) > 1}">
					<c:forEach var="education" items="${education}">	
					<ul class="actions fit education" id="${education.getEducation()}"style="margin-bottom:0px">
				<li>
					<input type="text" name="inst_name" id="inst_name" value="${education.getEducation()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="gradyear" id="gradyear" value="${education.getGraduateYear()}" readonly style="background-color:white" />
						</li>
						<c:set var="education" value="${education.getEducation()}"/>
						<li>
					<a href="javascript:deleteEducation(`${education}`)" id="removeEducation" class="button primary small" style="display:block">Remove</a>
						</li>
						</ul>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:forEach var="education" items="${education}">	
							<ul class="actions fit" id="${education.getEducation()}"style="margin-bottom:0px">
				<li>
					<input type="text" name="inst_name" id="inst_name" value="${education.getEducation()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="gradyear" id="gradyear" value="${education.getGraduateYear()}" readonly style="background-color:white" />
						</li>
						
						<li>
					<a href="javascript:deleteEducation('${education.getEducation()}')" id="removeEducation" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
				<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
					<input type="text" name="inst_name" id="new_inst_name" style="background-color:white" />		  
					</li>
					
					<li>
						<select name="yearpicker" id="yearpicker" style="background-color:white"></select>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>				
				<!-- <a href="#" style="color:#3bb3bd">Add another institution</a> -->
				</form>
				
				
				
				<h3 style="margin-bottom:20px"><strong>Work Experience</strong></h3>
				<!-- <h5 class="aboutheader"><b>Position</b></h5>
					<input disabled type="text" name="position" id="position" value="Restaurant Manager" style="margin-bottom:2rem" />
						<h5 class="aboutheader"><b>Period</b></h5>
					<input disabled type="text" name="period" id="period" value="2011 ~ 2014" style="margin-bottom:2rem" /> -->
				<div class="col-6 col-12-medium">
				<form method="post" action="#">	
					<ul class="actions fit" style="margin-bottom:0px">
				<li>
				<h5 class="aboutheader"><b>Position</b></h5>
					</li>
					
					<li>						
				<h5 class="aboutheader"><b>Start Year</b></h5>
						</li>
						
						
						<li>
				<h5 class="aboutheader"><b>End Year</b></h5>
						</li>
												
						<li>
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
						
				<c:choose>
				<c:when test="${work != null and fn:length(work) > 1}">
					<c:forEach var="work" items="${work}">
					<ul class="actions fit work" id="${work.getWorkExperience()}" style="margin-bottom:0px">
				<li>
					<input type="text" name="position" id="position" value="${work.getWorkExperience()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="startyear" id="startyear" value="${work.getWorkStartyear()}" readonly style="background-color:white" />
						</li>
						
						
					<li>
						<input type="text" name="endyear" id="endyear" value="${work.getWorkEndyear()}" readonly style="background-color:white" />
						</li>
						<c:set var="work" value="${work.getWorkExperience()}"/>
						<li>
					<a href="javascript:deleteWork(`${work}`)" id="removeWork" class="button primary small" style="display:block">Remove</a>
						</li>
						</ul>
						</c:forEach>
						</c:when>
						<c:otherwise>
						<c:forEach var="work" items="${work}">
						<ul class="actions fit" id="${work.getWorkExperience()}" style="margin-bottom:0px">
				<li>
					<input type="text" name="position" id="position" value="${work.getWorkExperience()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="startyear" id="startyear" value="${work.getWorkStartyear()}" readonly style="background-color:white" />
						</li>
						
						
					<li>
						<input type="text" name="endyear" id="endyear" value="${work.getWorkEndyear()}" readonly style="background-color:white" />
						</li>
						<li>
					<a href="javascript:deleteWork(`${work}`)" id="removeWork" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
					<input type="text" name="position" id="new_position" style="background-color:white" />		  
					</li>
					
					<li>
						<select name="yearpicker" id="period1" style="background-color:white"></select>
						</li>
						
						
					<li>
						<select name="yearpicker" id="period2" style="background-color:white"></select>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>	
								
				<!-- <a href="#" style="color:#3bb3bd">Add another position</a> -->
				</form>
				
				
				<h3 style="margin-bottom:20px"><strong>Certificate</strong></h3>
				<!-- <h5 class="aboutheader"><b>License Name</b></h5>
					<input disabled type="text" name="license_name" id="license_name" value="Tour Certification" style="margin-bottom:2rem" />
						<h5 class="aboutheader"><b>Date Obtained</b></h5>
					<input disabled type="text" name="date_obtained" id="date_obtained" value="10/27/2015" style="margin-bottom:2rem" /> -->
					
					<form method="post" action="#">
					<ul class="actions fit" style="margin-bottom:0px">
				<li>
				<h5 class="aboutheader"><b>License Name</b></h5>
					</li>
					
					<li>						
				<h5 class="aboutheader"><b>Date Obtained</b></h5>
						</li>
						
						<li>
					<a href="#" class="button primary small" style="margin-top:1.5rem; display:none">Remove</a>
						</li>
						</ul>
					
					
					<c:choose>
					<c:when test="${certificates != null and fn:length(certificates) > 1}">
					<c:forEach var="certificate" items="${certificates}">
									<ul class="actions fit certificate" id="${certificate.getCertificate()}" style="margin-bottom:0px">
				<li>
					<input type="text" name="license_name" id="license_name" value="${certificate.getCertificate()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="date_obtained" id="date_obtained" value="${certificate.getDateObtained()}" readonly style="background-color:white" />					
						</li>
					<c:set var="certificateName" value="${certificate.getCertificate()}"/>
						
						<li>
					<a href="javascript:deleteCertificate(`${certificateName}`)" id="removeCertificate" class="button primary small" style="display:block">Remove</a>
						</li>
						</ul>
						
					</c:forEach>
					</c:when>
					<c:otherwise>
					<c:forEach var="certificate" items="${certificates}">
					<ul class="actions fit" id="${certificate.getCertificate()}" style="margin-bottom:0px">
				<li>
					<input type="text" name="license_name" id="license_name" value="${certificate.getCertificate()}" readonly style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" name="date_obtained" id="date_obtained" value="${certificate.getDateObtained()}" readonly style="background-color:white" />					
						</li>
						
						<li>
					<a href="javascript:deleteCertificate('${certificate.getCertificate()}')" id="removeCertificate" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					<ul class="actions fit" style="margin-bottom:0px; margin-top:2rem">
				<li>
					<input type="text" name="license_name" id="new_license_name" style="background-color:white" />		  
					</li>
					
					<li>
						<input type="text" id="datepicker" placeholder="- Select Date -" style="background-color:white">
						</li>
						
						<li>
					<a href="#" class="button primary small" style="display:none">Remove</a>
						</li>
						</ul>			
				<!-- <a href="#" style="color:#3bb3bd">Add another certificate</a> -->
				</form>
				
				</div>
				
				<div class="col-12">
						<a href="javascript:makeChange()" class="button primary">Save</a>
					</div>
				
				</div><!-- box -->
				
				</div>				
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
			<script src="/helpme/resources/assets/js/helper_profile_background.js"></script>
			
			<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
			<script>
			$( function() {
			    $( "#datepicker" ).datepicker();
			  } );	
    		</script>
    		
    		<script>
    		for (i = new Date().getFullYear(); i > 2000; i--)
    		{
    		    $('#yearpicker').append($('<option />').val(i).html(i));
    		    $('#period1').append($('<option />').val(i).html(i));
    		    $('#period2').append($('<option />').val(i).html(i));
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