<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="${pageContext.request.contextPath}/css/store/updatestorecss.css?ver=1" rel="stylesheet" type="text/css">
</head>
<jsp:include page="/sidebar/reservationsidebar3.jsp"/>
<body>
 <div class="container">
	<div class="container_store_regist">
	<h2>점포등록</h2><br><br>
		<form action="storeRegister.do" method="post" id="updateform" name="form1" class="box" id="updateform">
			<span>점포명</span>
			<input type="text" name="store_name">
			<span>점포주소</span>
			<input type="text" name="store_address">
			<span>가게번호</span>
			<input type="text" name="telephone">
			<span>좌석 수</span>
			<input type="text"  name="sit_capacity">
			<span>영업 시간</span>
			<input type="text" name="available_time">
			<span>대표 메뉴</span>
			<input type="textarea" cols="50" rows="5" name="represent_menu" resize="none">
			<!-- 이미지 5장 불러오기 -->
			<span>가게 사진</span>
			<input type="file" name="store_img" multiple="multiple" accept=".jpg">
			<span>업태</span>
			<input type="text" name="food_category">
			<button type="submit" class="btn1">가게등록</button>
		</form>
	</div>
</div>

</body>
</html>