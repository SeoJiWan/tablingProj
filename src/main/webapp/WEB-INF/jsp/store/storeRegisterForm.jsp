<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
  <link href="${pageContext.request.contextPath}/css/store/updatestorecss.css?ver=2" rel="stylesheet" type="text/css">
</head>
<jsp:include page="/sidebar/reservationsidebar3.jsp"/>
<body>
<a href="#"><img src="${pageContext.request.contextPath }/img/newLogo.png" alt="logo" class="logo_img" /></a>
	<div class="container">
		<form class="row g-4" action="storeRegister.do" method="post" id="updateform" name="form1" class="box" id="updateform" onsubmit="return check()">
			<h4>
				Store<span> 점포 등록</span>
			</h4>
			<div class="col-md-6">
				<label for="inputname" class="form-label">점포명</label> 
				<input type="text" name="store_name" class="form-control" id="inputEmail4">
			</div>
			<div class="col-md-6">
				<label for="inputtel" class="form-label">점포번호</label> 
				<input type="text" name="telephone" class="form-control" id="inputPassword4">
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">점포주소</label> 
				<input type="text" name="store_address" class="form-control" id="inputAddress" placeholder="주소를 입력해주세요">
			</div>
			<div class="col-12">
				<label for="inputMenu" class="form-label">대표메뉴</label> 
				<input type="text" name="represent_menu" class="form-control" id="inputAddress" placeholder="대표메뉴를 입력해주세요">
			</div>
			<div class="col-md-6">
				<label for="inputtime" class="form-label">이용시간</label> 
				<input  type="text" name="available_time" class="form-control" id="inputCity">
			</div>
			<div class="col-md-4">
				<label for="inputState" class="form-label">점포 업종</label> 
				<select id="inputState" class="form-select" name="food_category">
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
				<label for="inputZip" class="form-label">좌석수</label> 
				<input type="text"  name="sit_capacity" class="form-control" id="inputZip">
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-primary" id="btn1">점포 등록</button>
			</div>
			<div class="col-md-2">
			<label for="inputJpg" class="form-label">점포 사진</label> 
			<input type="file" name="store_img" multiple="multiple" accept=".jpg">
			</div>
		</form>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
    function check() {
    	
        var f = document.form1;
        console.log(f)
        
       if (f.store_name.value == "") {
           alert("점포명을 입력해주세요.");              
           return false;
       }
       if (f.telephone.value == "") {
           alert("번호를 입력해주세요.");              
           return false;
       }  
       if (f.store_address.value == "") {
           alert("점포주소를 입력해주세요.");              
           return false;
       }
       if (f.represent_menu.value == "") {
           alert("대표메뉴를 입력해주세요.");              
           return false;
       }
       if (f.available_time.value == "") {
           alert("이용시간을 입력해주세요.");              
           return false;
       }
       if (f.food_category.value == "") {
           alert("업종을 선택해주세요.");              
           return false;
       }  
       if (f.sit_capacity.value == "") {
           alert("좌석수를 입력해주세요.");              
           return false;
       }  
     }
	</script>
</body>
</html>