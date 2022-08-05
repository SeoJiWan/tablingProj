<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>예약이 완료되었습니다.</h1>
	<br>
	<h3>예약 내역</h3>
	<table border="1">
		<tr>
			<th>예약자</th>
			<th>예약 식당</th>
			<th>예약 인원</th>
			<th>예약 날짜 및 시간</th>
		</tr>
		
		<tr>
			<td>${reservation.memberId }</td>
			<td>${reservation.storeName }</td>
			<td>${reservation.peopleNum }</td>
			<td>${reservation.reservationTime }</td>
		</tr>
	</table>
</body>
</html>