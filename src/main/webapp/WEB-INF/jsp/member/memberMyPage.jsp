<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <jsp:include page="../../../sidebar.jsp"></jsp:include> -->
	
	<div id="container_mypage">
	
		<table>
			<tr>
				<td colspan=2 class="profile_img">프로필 이미지</td>
			</tr>
			<tr>
				<td colspan=2>내 프로필</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>${loginMember.memberId }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${loginMember.nickName }</td>
			</tr>
			<tr>
				<td>핸드폰</td>
				<td>${loginMember.phoneNum }</td>
			</tr>
		</table>
		
	</div>
</body>
</html>