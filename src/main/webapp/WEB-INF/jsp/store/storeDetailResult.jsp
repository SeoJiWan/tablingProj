<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>스토어 디테일 연습</h1>
	<p>${store.storeName }</p>
	<c:forEach var="store_img" items="${store.storeImgUrl }">
		<p>${store_img }</p>
		<img src="${pageContext.request.contextPath }/img/store_img/${store_img }" alt="" />
	</c:forEach>

</body>
</html>