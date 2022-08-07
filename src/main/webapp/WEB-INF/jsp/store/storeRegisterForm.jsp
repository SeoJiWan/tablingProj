<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/store/storeRegisterForm.css" />
</head>
<body>
	<div class="container_store_regist">
		<form action="storeRegister.do" method="post">
			<table class="table_store_register">
				<thead>
					<tr>
						<th>가게 이름</th>
						<td><input type="text" name="store_name"></td>
					</tr>
					<tr>
						<th>가게 주소</th>
						<td><input type="text" name="store_address"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="telephone"></td>
					</tr>
					<tr>
						<th>이용가능 좌석 수</th>
						<td><input type="text" name="sit_capacity"></td>
					</tr>
					<tr>
						<th>영업 시간</th>
						<td><input type="text" name="available_time"></td>
					</tr>
					<tr>
						<th>대표 메뉴</th>
						<td><textarea cols="50" rows="5" name="represent_menu"></textarea></td>
					</tr>
					<tr>
						<th>가게 사진</th>
						<td><input type="file" name="store_img" multiple="multiple" accept=".jpg"></td>
					</tr>
					<tr>
						<th>업태</th>
						<td><input type="text" name="food_category"></td>
					</tr>
					<tr>
						<td><button type="submit">가게등록</button></td>
					</tr>
				</thead>
			</table>
		</form>
	</div>

</body>
</html>