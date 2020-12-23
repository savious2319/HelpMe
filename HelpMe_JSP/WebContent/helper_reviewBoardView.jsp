<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<%-- helper_reviewBoardList에서 특정 후기를 클릭할 경우 오는 페이지 --%>
		<title>reviewBoardView</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css?ver=1" />
	</head>
	<style>
		table tbody tr:nth-child(2n + 1) {
			background-color:white;
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
	<c:set var="loginAs" value="${requestScope.loginAs}"/>
	<c:set var="boardBean" value="${requestScope.boardBean}"/>
	<c:set var="filesBeanList" value="${requestScope.filesBeanList}"/>
	<c:set var="replyBeanList" value="${requestScope.replyBeanList}"/>
		<%-- 
		<c:if test="${session_id eq null}">
		<script>
			alert("Please use review board after login.");
			location.replace("${pageContext.request.contextPath}/client/ClientLogin.cl");
		</script>
		</c:if>
		--%>
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
						<li>
							<a href="#menu">Menu</a>
						</li>
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
					<%-- <li><a href="">My Page</a></li>	--%>	
					<li><a href="${pageContext.request.contextPath}/helper/all.he?loginAs=${loginAs}">Search Helper</a></li>
					<%-- href="${pageContext.request.contextPath}/BoardList.bo?page=1"를 해야 첫번째 페이지로 이동한다! --%>
					<li><a href="${pageContext.request.contextPath}/BoardList.bo?page=1&loginAs=${loginAs}">Helper Review Board</a></li>

				</ul>
				</nav>
				</c:otherwise>
				</c:choose>

		<!-- Main -->
	<section id="main" class="wrapper">
		<div class="inner">


			<!-- 게시판 수정 -->
			<%-- 후기의 정보를 보여준다. --%>
			<table width="500px" border="1" cellpadding="0" cellspacing="0">
				<%-- 
				<tr height="30px">
					<td align="center" width="150px">Title</td>
				</tr>
				--%>
				<tr height="30px" style="text-align:center;">
					<td align="center" style="max-width:100%;"><textarea readonly="readonly" disabled style="resize:none;  height:70px;">Title : ${boardBean.getBoard_title()}</textarea></td>					
					<%-- <td style="padding-left: 10px;">${boardBean.getBoard_title()}</td> --%>
				</tr>
				<%-- 
				<tr height="30px">
					<td align="center" width="150px">Cat</td>
				</tr>
				--%>
				<tr height="30px" style="text-align:center;">
					<td align="center" style="max-width:100%;"><textarea readonly="readonly" disabled style="resize:none;  height:70px;">Category : ${boardBean.getBoard_category()}</textarea></td>
					<%-- <td style="padding-left: 10px;">${boardBean.getBoard_title()}</td> --%>
				</tr>
				<%-- 
				<tr height="30px">
					<td align="center" width="150px">ID</td>
				</tr>
				--%>
				<tr height="30px" style="text-align:center;">
					<td align="center" style="max-width:100%;"><textarea readonly="readonly" name="session_id" disabled style="resize:none; height:70px;">ID : ${session_id}</textarea></td>
					<%-- <td style="padding-left: 10px;">${boardBean.getBoard_id()}</td> --%>
				</tr>
				<tr height="30px" style="text-align:center;">
					<td align="center" style="max-width:100%;"><textarea readonly="readonly" disabled style="resize:none;  height:70px;">Views : ${boardBean.getView_count()}</textarea></td>
					<%-- <td style="padding-left: 10px;">${boardBean.getBoard_id()}</td> --%>
				</tr>
				<tr height="30px" style="text-align:center;">
				</tr>
				<tr height="30px">
					<td align="center" style="max-width:100%;">Content</td>
				</tr>
				<tr height="200px">
					<td><textarea readonly="readonly" disabled style="resize:none;  height:300px;">${boardBean.getBoard_contents()}</textarea></td>
				
				</tr>
				<tr height="30px">
					<td align="center">File</td>
				</tr>
				<tr>
					<c:if test="${filesBeanList != null}">
						<td align="center">
							<c:forEach var="file" items="${filesBeanList}">
								<a href="${pageContext.request.contextPath}/FileDownload.bo?file_name=${file.getFile_name()}">${file.getFile_name()}</a>
							</c:forEach>
						</td>
					</c:if>
					</tr>	
			</table>
			<%-- 후기를 작성한 당사자에게만 Modify와 Delete가 보인다. --%>
			<table border="0" cellpadding="0" cellspacing="0">
				<tr align="right" valign="middle" style="background-color:white; border-top:none; border-bottom:none;">
					<td>
						<c:if test="${boardBean.getClient_id() eq session_id}">
							<a href="${pageContext.request.contextPath}/BoardModify.bo?seq=${boardBean.getBoard_num()}&loginAs=${loginAs}">[Modify]</a>&nbsp;&nbsp;
							<a href="javascript:deleteBoard()">[Delete]</a>&nbsp;&nbsp; 
						</c:if>
						<%-- list로 되돌아간다 --%>
						<a href="${pageContext.request.contextPath}/BoardList.bo?loginAs=${loginAs}">[List]</a>&nbsp;&nbsp;
					</td>
				</tr>
			
				<tr>
					<td>
					<%-- 좋아요 하트 -> 한번만 누를 수 있도록 --%>
					<%-- 두번 누르면 좋아요가 취소됨 --%>
					<c:choose>
					<c:when test="${loginAs eq 'loginAsClient'}">
						<img src="${pageContext.request.contextPath}/images/red-heart.png" onclick="like_count_update()" style="width: 50px; height:50px; float:right; cursor:pointer;">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/images/red-heart.png" onclick="block('${session_id}')" style="width: 50px; height:50px; float:right; cursor:pointer;">
					</c:otherwise>
					</c:choose>

					</td>
				</tr>
				<tr>
					<td align="right" style="max-width:100%;"><p>Like : <span class="like_count">${cnt}</span></p></td>
									
				</tr>
			</table>
			
			<form
				action="${pageContext.request.contextPath}/BoardDeleteOk.bo"
				method="post" name="boardform">
				<input type="hidden" name="seq" value="${boardBean.getBoard_num()}" />
				<input type="hidden" name="loginAs" value="${loginAs}" />
			</form>

			<!-- 댓글 -->
			<form action="${pageContext.request.contextPath}/BoardReplyOk.bo?seq=${boardBean.getBoard_num()}" method="post" name="boardReply" style="display:block; margin:0 auto;">
				<table>
					<tr>
						<td align="center" width="">
							<div align="center">Reply</div>
						</td>
						<td><textarea name="reply_contents"	style="; height: 85px; resize: none;"></textarea>
						<input type="hidden" name="loginAs" value="${loginAs}">
						<c:choose>
					<c:when test="${loginAs eq 'loginAsClient'}">
						<a href="javascript:comment()">[Finish]</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:block2('${session_id}')">[Finish]</a>
					</c:otherwise>
					</c:choose>
						</td>
						
						 
					</tr>

					<c:set var="i" value="${0}"/>
					<c:choose>
					<%-- 댓글이 한 개라도 있을 때 --%>
						<c:when test="${replyBeanList != null and fn:length(replyBeanList) > 0}">
							<c:forEach var="reply" items="${replyBeanList}">
							<%-- 매 반복마다 i를 1씩 증가시키고, i가 각 댓글의 구분점이 되도록 구현한다. --%>
 								<c:set var="i" value="${i+1}"/>
								<tr>
									<%-- 작성자 --%>
									<td align="center">${reply.getClient_id()}</td>
									<td valign="top" style="padding-left: 10px;">
									<%-- 댓글 내용 --%> 
									<%--
		 								각 댓글별로 수정을 할 때 구분점으로 i를 사용한다. 따라서 id와 name에 구분점인 i를 사용한다.
 										하지만 모든 댓글에 autosize를 적용시켜야 하므로 class이름은 replys로 통일한다.
 										id는 하단의 자바스크립트에서 readonly속성 삭제 및 복구 구현을 위해 사용된다.
 										name은 컨트롤러에서 파라미터로 접근하기 위해 사용된다.
		 							--%> 
 										<textarea id="${i}" name="board_contents${i}" class="replys" style="resize: none;" readonly>${reply.getReply_contents()}</textarea>
										<%-- 작성자만 수정과 삭제 가능 --%> 
										<c:if test="${session_id eq reply.getClient_id()}">
											<%-- 댓글별로 각 한 개씩 수정과 삭제버튼이 있기 때문에 구분하기 위하여 i를 사용한다. --%>
											<%-- 수정버튼 클릭 시 수정 완료버튼이 나타나고, 수정중인 댓글이 있을 때 다른 댓글은 수정할 수 없도록 한다. --%>
											<a id="ready${i}" style="display: inline" href="javascript:updateReply(${i})">[Modify]</a>
											<a id="ok${i}" style="display: none" href="javascript:submitReplyUpdateForm(${reply.getReply_num()}, ${boardBean.getBoard_num()}, ${i})">[Finish Modify]</a>
											<a href="${pageContext.request.contextPath}/BoardReplyDeleteOk.bo?reply_num=${reply.getReply_num()}&seq=${boardBean.getBoard_num()}&loginAs=${loginAs}">[Delete]</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
					<%--  
 						<c:otherwise>
 							<tr align="center">
 								<td align="center" width="150px" colspan="2">댓글이 없습니다.</td>
 							</tr>
 						</c:otherwise>
 						 --%>
					</c:choose>

				</table>
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
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrolly.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.scrollex.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			
			<%-- 아래의 스크립트가 없으면 오토 사이즈 적용이 안 된다. --%>
			<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
			<script>
			var check = false;
		
			//textarea에 작성된 내용의 길이만큼 높이가 자동으로 조절된다.
			autosize($("textarea.replys"));
			function deleteBoard(){
				boardform.submit();
			}
			//댓글 추가
			function comment(){
				var textarea = $("textarea[name='reply_contents']");
				var session_id = "${session_id}";
				if(textarea.val() == ""){
					//작성된 글이 없다면 경고 메세지 출력
					alert(session_id);
					alert("Please click Finish after input your reply.");
					return false;
				}else if(session_id==""){
					alert("You need to log in to write your reply.");
				}
				boardReply.submit();
			}
			
			//댓글 수정버튼 클릭 시
			function updateReply(num){
				//수정할 댓글 식별자인 num을 전달받는다.
				var textarea = $("textarea#"+num);	//textarea태그에서 id가 num인 객체 가져오기.
				var modify_ready_a = $("a#ready"+num); //수정버튼 가져오기
				var modify_ok_a = $("a#ok"+num); //수정완료 버튼 가져오기
				
				if(!check){
					//수정중인 댓글이 없을 경우
					textarea.removeAttr("readonly");	//수정할 수 있도록 readonly 속성 삭제
					modify_ready_a.css("display", "none"); //수정 버튼 숨기기
					modify_ok_a.css("display", "inline"); //수정 완료 버튼 보이게 하기
					
					//수정 중이므로 flag를 true로 변경 
					check = true;
				}else{
					//이미 수정중일 때 경고메세지 출력
					alert("You are already modifying your reply.");
				}
				
			}
			
			//수정 완료버튼 클릭 시
			function submitReplyUpdateForm(reply_num, seq, num){
				//댓글 번호, 게시글 번호, 댓글 식별자를 외부에서 전달받는다.
				
				//댓글 요소들이 모여있는 form태그의 action속성 값을 변경한 후 submit 해준다.
				$("form[name='boardReply']").attr("action", "${pageContext.request.contextPath}/BoardReplyModifyOk.bo?reply_num="+reply_num+"&seq="+seq+"&num="+num);
				boardReply.submit();
			}
						
//			$(function(){
				//추천 버튼 클릭 시 추천 혹은 제거
//				$("#like_count_update").click(function(){
//					$.ajax({
//						url:"/BoardLikeCountUpdateAction.bo",
//						type: "POST",
//						data:{
//							board_num : "${boardBean.getBoard_num()}",
//							client_id : "${session_id}"
//						},
//						success: function(){
//							like_count();
//						}
//					})
//				})
//			})
			
			//좋아요 눌렀을 때
			function like_count_update(){
				var session_id = "${session_id}";
				if(session_id==""){
					alert('You can like after log in');
				}
				$.ajax({
					url:"./BoardLikeCountUpdate.bo",
					type: "POST",
					data:{
						board_num : "${boardBean.getBoard_num()}",
						client_id : "${session_id}"
					},
					success: function(){
						like_count();
					}
				})
			}
			
			//로그인을하지 않았거나 헬퍼가 고객 전용 서비스를 이용하려고 했을 때 나오는 경고창
			function block(session_id){
	            if(session_id == ""){
	            	alert("Please try again after logging in");
	               return false;
	            }
				
				alert("Sorry, helpers are not allowed to click like heart");
				return false;
			}
			
			function block2(session_id){
	            if(session_id == ""){
	            	alert("Please try again after logging in");
	               return false;
	            }
	            
				alert("Sorry, helpers are not allowed to post replies");
				return false;
			}
			//게시글 like 수
			function like_count(){
				$.ajax({
					url:"./BoardLikeCount.bo",
					type: "POST",
					data:{
						board_num : "${boardBean.getBoard_num()}"
					},
					success: function(count){
						$(".like_count").html(count);
					}
				})
			};
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

	</body>
</html>