<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/main.css" rel="stylesheet">
</head>

<body>
	<div id="container_main">
		<h1>${logindId }</h1>
		<div id="search-container">
			<h2>메인 검색</h2>
		    	<form action="${pageContext.request.contextPath }/storeSearchPaging.do">
		          <input type="text" id="window" name="keyword" placeholder="지역, 식당 또는 음식" />
		          <input type="hidden" name="pageNum" value="1">
		          <input type="hidden" name="postNum" value="8">
		          <input id="search" type="submit" value="검색">
		         </form>
	     </div>
	     <div id="main-list">
	     	<ul class="ul_store_list">
		     	<c:forEach var="store" items="${list }">
		     		<li>
		     			<!-- 이미지 -->
		     			<c:forEach var="img" items="${store.storeImgUrl }">
							<a href="${pageContext.request.contextPath }/detailPage.do?storeName=${store.storeName}"><img src="${pageContext.request.contextPath }/img/store_img/${img }" width="400" height="300"></a>
						</c:forEach>
						<!-- 가게 정보 -->
						<br>${store.storeName }
		     		</li>
		     	</c:forEach>
	    	 </ul>
	     </div>
     </div>
</body>
</html>