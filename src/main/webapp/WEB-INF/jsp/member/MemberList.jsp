<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="${pageContext.request.contextPath}/css/store/StoreCss.css" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../../tiles/head.jsp"/>
<jsp:include page="/sidebar/sidebarMemberList.jsp"/>
<body>
	<h2>회원 목록</h2>
	<table id="tab">
		<thead>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>전화번호</th>
				<th>회원분류</th>
				<th>회원차단</th>
		</thead>
		<tbody>
			<c:set var="members" value="${list }"></c:set>
			<c:forEach var="vo" items="${members }">
				<tr>
					<td>${vo.memberId}</td>
					<td>${vo.nickName }</td>
					<td>${vo.phoneNum }</td>
					<td>
					<div id="div">
					<c:choose> 
					<c:when test="${vo.role eq 1}"><a>점주</a></c:when>
    				<c:when test="${vo.role eq 2}"><a>일반회원</a></c:when>
    				</c:choose>
    				</div>
					</td>
					<td><button value='차단' onclick='deleteCallBack(event)' class=button>차단</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="outer">
		<div class="pagination">
			<c:if test="${pageInfo.prev }">
				<a id="menu"
					href="memberListPaging.do?pageNum=${pageInfo.startPage - 1 }&postNum=${pageInfo.cri.postNum}">Prev</a>
			</c:if>
			<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<a href="memberListPaging.do?pageNum=${num}&postNum=${pageInfo.cri.postNum}">${num }</a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a id="menu"
					href="memberListPaging.do?pageNum=${pageInfo.endPage + 1 }&postNum=${pageInfo.cri.postNum}">Next</a>
			</c:if>
		</div>
	</div>
	<script>
	function deleteCallBack(e) {
		console.log(e.target); //event의 call함수(이벤트를 받는 대상.)
		let delmbname = e.target.parentElement.parentElement.firstElementChild.innerText;
		if(confirm('회원을 차단하시겠습니까?')) {			
		let delAjx = new XMLHttpRequest();
		delAjx.open('post', 'memberadminDelete.do');
		delAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		delAjx.send('memberId=' + delmbname);
		delAjx.onload = function() {		
		let result = JSON.parse(delAjx.responseText);			
			if(result.retCode == 'Success') {
				alert('회원을 차단하였습니다.')
				e.target.parentElement.parentElement.remove();
				location.reload(true);
			}
			else{ 
				alert('처리중 에러 발생.');
			}
		}
		} else {
			
		}
		
	}
	</script>
</body>
</html>