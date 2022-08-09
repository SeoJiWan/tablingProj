<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/interested_store/interested_storeList.css" />

</head>
<body>
	
	<div class="ul_zzim_list">
		<h1>찜 목록</h1>
		<ul>
		<c:forEach var="store" items="${list }">
			<li>
				<div>
					<img src="${pageContext.request.contextPath }/img/store_img/${store.storeImgUrl }" alt="" />
					<h3>${store.storeName }</h3>
				</div>
			</li>
		</c:forEach>
		</ul>		
	</div>
</body>
</html>