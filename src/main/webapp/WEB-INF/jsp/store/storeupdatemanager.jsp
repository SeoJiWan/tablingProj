<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 매니지먼트</title>
</head>
<body>
	<h2 id=title>가게 정보 수정</h2>
	<form id="updateform" action="updatestore.do" method="post"  onsubmit="return false">
		<table border="1">
		<c:set var="vo" value="${stores }"></c:set>
			<tr>
				<th>점포명</th>
				<td><input type="text" name="store_name" value="${vo.storeName }"></td>
			</tr>
			<tr>
				<th>점포주소</th>
				<td><input type="text" name="storeaddress" value="${vo.storeAddress }"></td>
			</tr>
			<tr>
				<th>가게번호</th>
				<td><input type="text" name="telephone" value="${vo.telephone }"></td>
			</tr>
			<tr>
				<th>이용시간(수정불가!)</th>
				<td><input type="text" name="availabletime" value="${vo.availableTime }" readonly></td>
			</tr>
			<tr>
				<th>업태</th>
				<td><input type="text" name="foodcategory" value="${vo.foodCategory }"></td>
			</tr>

		</table>
		<input type="submit" value="수정">
	</form>
	
	<script type="text/javascript">
	document.getElementById("updateform").onsubmit=function() {
		let Check = confirm('수정하시겠습니까?');
		if (!Check) {
			return false;
		} else {
			alert('수정완료');
		}
	}
	</script>
</body>
</html>