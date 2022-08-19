<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>
	<h1>스토어 리스트 연습</h1>
	<c:forEach var="store" items="${stores }">
		<table>
			<tr>
				<td>${store.storeName }</td>
				<td>
				<c:forEach var="store_img" items="${store.storeImgUrl }">
					<img src="${pageContext.request.contextPath }/img/store_img/${store_img }" alt="" />
				</c:forEach>
				</td>
			</tr>
		</table>
	</c:forEach>

</body>
</html>