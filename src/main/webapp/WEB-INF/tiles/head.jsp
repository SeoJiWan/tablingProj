<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath}/css/head.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/883c2a5320.js" crossorigin="anonymous"></script>
<header class="head_container">

<div class="main_headbar">
	<div class="item1">
		<!-- 비회원으로 서비스 이용시 로고 클릭 메인화면 연결 -->
		<c:if test="${empty loginMember }">
		<%-- 	        <a href="main.do"><img src="${pageContext.request.contextPath }/img/logo2.PNG" alt="logo" /></a> --%>
		<a href="main.do"><img src="${pageContext.request.contextPath }/img/julseo.png" alt="logo" class="logo_img" /></a>
		</c:if>
		<!-- 관리자로 서비스 이용시 로고 클릭 관리자메인화면 연결 -->
		<c:if test="${loginMember.role == 0 }">
		<a href="admin_main.do?pageNum=1&postNum=10"><img src="${pageContext.request.contextPath }/img/julseo.PNG" alt="logo" class="logo_img"/></a>
		</c:if>
		<!-- 가게 사장님으로 서비스 이용시 로고 클릭 가게사징님메인화면 연결 -->
		<c:if test="${loginMember.role == 1 }">
		<a href="owner_main.do"><img src="${pageContext.request.contextPath }/img/julseo.png" alt="logo" class="logo_img"/></a>
		</c:if>
		<!-- 손님으로 서비스 이용시 로고 클릭 손님메인화면 연결 -->
		<c:if test="${loginMember.role == 2 }">
		<a href="main.do"><img src="${pageContext.request.contextPath }/img/julseo.png" alt="logo" class="logo_img"/></a>
		</c:if>
	</div>
	  
	<div class="item2"></div>
	
	<div class="item3"></div>
    <div class="item4"></div>
    <div class="item5"></div>
    
    <div class="item6">
    	<c:if test="${empty loginMember.memberId }">
		<a href="memberLoginForm.do"><img src="${pageContext.request.contextPath }/img/login.jpg" alt="logoin" class="header_img" /></a>
		</c:if>
		
		<c:if test="${not empty loginMember.memberId }">
<%-- 			<c:if test="${loginMember.role eq 0 }"> --%>
<%-- 			<a>${loginMember.memberId } 관리자님 입장!</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${loginMember.role eq 1 }"> --%>
<%-- 			<a>${loginMember.memberId } 사장님 입장!</a> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${loginMember.role eq 2 }"> --%>
<%-- 			<a>${loginMember.memberId } 손님 입장!</a> --%>
<%-- 			</c:if> --%>
			<a href="memberLogout.do"><img src="${pageContext.request.contextPath }/img/logout.jpg" alt="logoout" class="header_img" /></a>
		
		</c:if>
    
		<a href="postListPaging.do?pageNum=1&postNum=10"><img src="${pageContext.request.contextPath }/img/board.JPG" " width="15" height="15" alt="logoout" class="header_img" /></a>
		
		<c:if test="${not empty loginMember }">
			<a href="memberInfoMyPage.do"><img src="${pageContext.request.contextPath }/img/user.JPG" alt="logoout" class="header_img" /></a>
		</c:if>
		<c:if test="${empty loginMember }">
			<a href="#" onclick="loginRequired()"><img src="${pageContext.request.contextPath }/img/user.JPG" alt="logoout" class="header_img" /></a>
		</c:if>
	</div>
</div>
</header>

