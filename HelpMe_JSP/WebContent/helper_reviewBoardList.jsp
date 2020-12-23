<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<%-- 후기 게시판 리스트 -> 등록된 후기들의 리스트를 보여준다. --%>
<title>reviewBoardList</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
<style type="text/css">
body {
			margin: 0;
			padding: 0;
		}
		table tbody tr:nth-child(2n + 1){
			background-color:none;
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
			 .alt{
            width:90%;
         }
		}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload">
	<%-- 
	<c:if test="${session_id eq null}">
		<script>
			alert("Please use review board after login.");
			location.replace("${pageContext.request.contextPath}/client/ClientLogin.cl");
		</script>
	</c:if>
	--%>
	
	<c:set var="list" value="${requestScope.boardList}"/>
	<c:set var="nowPage" value="${requestScope.nowPage}"/>
	<c:set var="startPage" value="${requestScope.startPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}"/>
	<c:set var="totalCnt" value="${requestScope.totalCnt}"/>
	<c:set var="totalPage" value="${requestScope.totalPage}"/>
	<c:set var="loginAs" value="${requestScope.loginAs}"/>
	<!-- Header -->
	<header id="header">
		<%-- 로그인 되어 있느냐 아니냐로 가는 곳이 달라야 한다. --%>
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
	<!-- Menu -->
	
	<c:choose>
		<%-- 로그인된 상태인지 아닌지에 따라 메뉴바가 달라야한다. --%>
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
					<%-- <li><a href="">My Page</a></li>	--%>	
					<li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search Helper</a></li>
					<%-- href="${pageContext.request.contextPath}/BoardList.bo?page=1"를 해야 첫번째 페이지로 이동한다! --%>
					<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper Review Board</a></li>

				</ul>
			</nav>
		</c:otherwise>
	</c:choose>
	
	<a id="back-to-top" style="text-decoration:none"></a>
	<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">

			<header class="major">
				<h1>review Board</h1>
			</header>

			<!-- <span class="image main"><img src="images/pic04.jpg" alt="" /></span> -->


			<table width="900px" border="0" cellpadding="0" cellspacing="0">
				<tr align="right" valign="middle">
					<%-- 후기가 총 몇개인지 --%>
					<td>reviews : ${totalCnt}</td>
				</tr>
			</table>
			<table border="1" cellpadding="0" cellspacing="0" width="900px"
				class="alt" style="max-width: 100%">
				<thead>
					<tr align="center" valign="middle" class="tableTr1">
						<td width="8%" height="26">
							<%-- 후기 번호 --%>
							<div align="center">NO.</div>
						</td>
						<td>
							<%-- 후기의 카테고리 --%>
							<div align="center">Cat</div>
						</td>
						<td width="36%">
							<%-- 제목 --%>
							<div align="center">Title</div>
						</td>

						<%--  
						<td width="14%">
							<div align="center">Writer</div>
						</td>
						--%>


						<!-- 
								<td width="14%">
									<div align="center">Helper</div>								
								</td>
								 -->
						<td width="16%">
							<%-- 등록 날짜 --%>
							<div align="center">Date</div>
						</td>

						<%--  
						<td width="6%">
							<div align="center">Views</div>
						</td>
						--%>

						<%-- 
						<td width="6%">
							<div align="center">Like</div>
						</td>
						--%>
					</tr>
				</thead>

				<tbody>
				<!-- c:choose는 조건절 -->
				<!-- c:when, c:when, ..., c:otherwise -->
				<!-- 게시글이 있으면 c:when으로 넘어가 보여주고 -->
				<!-- 없으면 c:otherwise로 넘어가서 게시글이 없습니다 메세지 -->
				<c:choose>
				<c:when test="${list!=null and fn:length(list) > 0 }">
					<%-- 나중에 c:foreach문으로 반복시킨다 --%>
					<c:forEach var="b_bean" items="${list}">
					<tr align="center" valign="middle"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''" class="tableTr2">
						<td height="23" style="font-family: Tahoma; font-size: 10pt;">
							${b_bean.getBoard_num()}
						</td>
						
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="left">${b_bean.getBoard_category() }</div>
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="left">
								<a href="${pageContext.request.contextPath}/BoardView.bo?seq=${b_bean.getBoard_num()}&loginAs=${loginAs}">${b_bean.getBoard_title()}</a>
							</div>
						</td>
						<%-- 
						<td>
							<div align="center">${b_bean.getBoard_id()}</div>
						</td>
						--%>

						<td>
							<div align="center">${b_bean.getBoard_date()}</div>
						</td>
						<%-- 
						<td>
							<div align="center">${b_bean.getReadCount()}</div>
						</td>
						<td>
							<div align="center">${b_bean.getReadCount()}</div>
						</td>
						--%>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<!-- 만약 등록된 게시물이 없을 경우 아래와 같은 메세지가 나오도록 한다. -->
				<tr height="50px">
					<td colspan="5" align="center">No reviews</td>
				</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
				
			</table>

			<div style="text-align: center;"></div>

			<table border="0" cellpadding="0" cellspacing="0" width="900px">
				<%-- 후기는 10개가 한 페이지 --%>
				<%-- 그 이상이 될 때마다 2페이지, 3페이지가 생긴다. --%>
				<tr align="center" valign="middle">
					<td><c:choose>
							<c:when test="${nowPage > 1}">
								<a href="${pageContext.request.contextPath}/BoardList.bo?page=${nowPage - 1}">[before]</a>&nbsp;
								</c:when>
						</c:choose> 
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${i eq nowPage}">
									[${i}]&nbsp;
							</c:when>
								
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/BoardList.bo?page=${i}&loginAs=${loginAs}">${i}&nbsp;</a>
							</c:otherwise>
						</c:choose>
						</c:forEach> <c:choose>
							<c:when test="${nowPage != totalPage}">
								<a href="${pageContext.request.contextPath}/BoardList.bo?page=${nowPage + 1}&loginAs=${loginAs}">[next]</a>&nbsp;
								</c:when>
						</c:choose></td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="900px"
				style="background-color: white; border-top: none; border-bottom: none;">
				<tr align="right" valign="middle"
					style="background-color: white; border-top: none; border-bottom: none;">
					<td>
					<c:choose>
					<%-- 후기 쓰기 게시판 -> 로그인 한 사람만 쓸 수 있도록 --%>
					<%-- 헬퍼가 후기를 작성하려고 할 경우를 대비함 --%>
					<c:when test="${loginAs eq 'loginAsClient'}">
					<a href="${pageContext.request.contextPath}/helper_reviewWrite.jsp?loginAs=${loginAs}">[Post your review]</a>
					</c:when>
					<c:otherwise>
					<a href="javascript:block('${session_id}')">[Post your review]</a>
					</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</table>

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
			
			//로그인이 안 되어 있으면 로그인부터 하라고 메세지
			function block(session_id){
		            if(session_id == ""){
		            	alert("Please try again after logging in");
		               return false;
		            }
				
		        //또한 헬퍼는 후기 작성이 불가능함.
				alert("Sorry, helpers are not allowed to post reviews");
				return false;
			}
			
			/* function loginBlock(){
				alert("")
			} */
		</script>

</body>
</html>