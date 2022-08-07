<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 매니지먼트</title>
  <link href="${pageContext.request.contextPath}/css/store/updatestorecss.css" rel="stylesheet" type="text/css">
</head>
<body>
  <div class="container">
    <form id="updateform" name="form1" class="box" id="updateform" action="updatestore.do" method="post"  onsubmit="return false">
    <c:set var="vo" value="${stores }"></c:set>
      <h4>Store<span> 점포 수정</span></h4>
      	<span>점포명</span>
        <input type="text" name="store_name" value="${vo.storeName }">
        <span>점포주소</span>
        <input type="text" name="storeaddress" value="${vo.storeAddress }">
        <span>가게번호</span>
        <input type="text" name="telephone" value="${vo.telephone }">
        <span>이용시간(수정불가!)</span>
        <input type="text" name="availabletime" value="${vo.availableTime }" readonly>
        <span>업태</span>
        <input type="text" name="foodcategory"value="${vo.foodCategory }">      
        <input type="submit" value="회원정보 수정" class="btn1">
      </form>
      </div>
      
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