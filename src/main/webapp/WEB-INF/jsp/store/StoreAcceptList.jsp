<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 관리</title>
    <link href="${pageContext.request.contextPath}/css/store/StoreCss.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../../tiles/head.jsp"/>
<jsp:include page="/sidebar/sidebarList.jsp"/>
<body>
	<h2>승인 점포 목록</h2>
	<table id=tab>
		<thead>
			<tr>
				<th>점포명</th>
				<th>점포주소</th>
				<th>전화번호</th>
				<th>이용시간</th>
				<th>업태</th>
			</tr>
		</thead>

		<tbody>
		<c:set var="stores" value="${list }"></c:set>
		<c:forEach var="vo" items="${stores }">
			<tr>
				<td>${vo.storeName}</td>
				<td>${vo.storeAddress }</td>
				<td>${vo.telephone }</td>
				<td>${vo.availableTime }</td>
				<td>${vo.foodCategory }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="outer">
		<div class="pagination">
			<c:if test="${pageInfo.prev }">
				<a id="menu"
					href="StoreAcceptListPaging.do?pageNum=${pageInfo.startPage - 1 }&postNum=${pageInfo.cri.postNum}">Prev</a>
			</c:if>
			<c:forEach var="num" begin="${pageInfo.startPage }"
				end="${pageInfo.endPage }">
				<a
					href="StoreAcceptListPaging.do?pageNum=${num}&postNum=${pageInfo.cri.postNum}">${num }</a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a id="menu"
					href="StoreAcceptListPaging.do?pageNum=${pageInfo.endPage + 1 }&postNum=${pageInfo.cri.postNum}">Next</a>
			</c:if>
		</div>
	</div>
</body>
</html>