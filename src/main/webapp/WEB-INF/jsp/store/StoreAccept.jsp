<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 관리</title>
   <link href="${pageContext.request.contextPath}/css/store/StoreCss.css?ver=2" rel="stylesheet" type="text/css">
</head>
<jsp:include page="../../tiles/head.jsp"/>
<jsp:include page="/sidebar/adminsidebar.jsp"/>
<a href="#"><img src="${pageContext.request.contextPath }/img/newLogo.png" alt="logo" class="logo_img" /></a>
<body>
	<h2 id=title>승인 요청 목록</h2>
	<table id=tab>
		<thead>
			<tr>
				<th>점포명</th>
				<th>점포주소</th>
				<th>전화번호</th>
				<th>이용시간</th>
				<th>업태</th>
				<th>수락여부</th>
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
					<td>
					<button value='수락' onclick='acceptCallBack(event)' class=agree>수락</button>
					<button value='차단' onclick='degreeCallBack(event)' class=button>차단</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="outer">
		<div class="pagination">
			<c:if test="${pageInfo.prev }">
				<a id="menu"
					href="admin_main.do?pageNum=${pageInfo.startPage - 1 }&postNum=${pageInfo.cri.postNum}">Prev</a>
			</c:if>
			<c:forEach var="num" begin="${pageInfo.startPage }"
				end="${pageInfo.endPage }">
				<a
					href="admin_main.do?pageNum=${num}&postNum=${pageInfo.cri.postNum}">${num }</a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a id="menu"
					href="admin_main.do?pageNum=${pageInfo.endPage + 1 }&postNum=${pageInfo.cri.postNum}">Next</a>
			</c:if>
		</div>
	</div>
	<script>
	function degreeCallBack(e) {
		console.log(e.target); //event의 call함수(이벤트를 받는 대상.)
		let delstname = e.target.parentElement.parentElement.firstElementChild.innerText;
		if(confirm('삭제하시겠습니까?')) {			
		let delAjx = new XMLHttpRequest();
		delAjx.open('post', 'degreeStoreAjax.do');
		delAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		delAjx.send('store_name=' + delstname);
		delAjx.onload = function() {		
		// {retCode : Success}
		let result = JSON.parse(delAjx.responseText);			
			if(result.retCode == 'Success') {
				alert('신청을 거절하였습니다.')
				location.reload(true);
				e.target.parentElement.parentElement.remove();
			}
			else{ 
				alert('처리중 에러 발생.');
			}
		}
		} else {
			
		}
		
	}
	
	function acceptCallBack(e) {
		console.log(e.target);
		let upname = e.target.parentElement.parentElement.firstElementChild.innerText;
		let upAjx = new XMLHttpRequest();
		upAjx.open('post', 'updateStoreAjax.do');
		upAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		upAjx.send('store_name=' + upname);
		upAjx.onload = function() {
			let result = JSON.parse(upAjx.responseText);
			if(result.retCode == 'Success') {
				alert('신청을 수락하였습니다.')
				e.target.parentElement.parentElement.remove();
				location.reload(true);
			}
			else{ 
				alert('처리중 에러 발생.');
			}
		}
	}
	</script>
</body>
</html>