<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 매니지먼트</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/css/store/updatestorecss.css?ver=1"
	rel="stylesheet" type="text/css">
</head>
<jsp:include page="/sidebar/reservationsidebar2.jsp" />
<body>
<a href="#"><img src="${pageContext.request.contextPath }/img/newLogo.png" alt="logo" class="logo_img" /></a>
	<div class="container">
		<form class="row g-4" id="updateform" name="form1" id="updateform" action="updatestore.do" method="post" onsubmit="return false">
			<c:set var="vo" value="${store }"></c:set>
			<h4>
				Store<span> 점포 수정</span>
			</h4>
			<div class="col-md-6">
				<label for="inputEmail4" class="form-label">점포명</label> <input
					type="text" name="store_name" value="${vo.storeName }"
					class="form-control" id="inputEmail4">
			</div>
			<div class="col-md-6">
				<label for="inputPassword4" class="form-label">점포번호</label> <input
					type="text" name="telephone" value="${vo.telephone }"
					class="form-control" id="inputPassword4">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">점포주소</label> <input
					type="text" name="storeaddress" value="${vo.storeAddress }"
					class="form-control" id="inputAddress" placeholder="1234 Main St">
			</div>
			<div class="col-md-6">
				<label for="inputCity" class="form-label">이용시간</label> <input
					type="text" name="availableTime" readonly
					value="${vo.availableTime }" class="form-control" id="inputCity">
			</div>
			<div class="col-md-4">
				<label for="inputState" class="form-label">점포 업종</label> 
				<select id="inputState" class="form-select" name="class">
					<option selected>선택하세요~</option>
					<option value="한식">한식</option>
					<option value="일식">일식</option>
					<option value="중식">중식</option>
					<option value="양식">양식</option>
					<option value="분식">분식</option>
					<option value="디저트">디저트</option>
					<option value="주점">주점</option>
				</select>
			</div>
			<div class="col-md-2">
				<label for="inputZip" class="form-label">-</label> 
				<input type="text" name="foodcategory" readonly value="${vo.foodCategory }" class="form-control" id="inputZip">
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-primary" id="btn1">점포 수정</button>
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		document.getElementById("updateform").onsubmit = function() {
			let Check = confirm('수정하시겠습니까?');
			if (!Check) {
				return false;
			} else {
				alert('수정완료');
			}
	</script>
	<script>
		$("select[name=class]").on("change", function() {
					var $addr = $(this).closest("#updateform").find("input[name=foodcategory]");
					if ($(this).val() == "etc") {
						$addr.val('');
						$addr.prop("readonly", false);

					} else {
						$addr.val($(this).val());
						$addr.prop("readonly", true);
					}
				});
	</script>
</body>
</html>