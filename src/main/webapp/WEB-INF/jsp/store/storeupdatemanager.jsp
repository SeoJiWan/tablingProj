<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점포 매니지먼트</title>
  <link href="${pageContext.request.contextPath}/css/store/updatestorecss.css?ver=1" rel="stylesheet" type="text/css">
</head>
<jsp:include page="/sidebar/reservationsidebar2.jsp"/>
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
        <span>업태</span>
        <select id="class" name="class">
       	<option value="한식">한식</option>
		<option value="일식">일식</option>
		<option value="중식">중식</option>
		<option value="양식">양식</option>
		<option value="분식">분식</option>    
		<option value="디저트">디저트</option>  
		<option value="주점">주점</option>  
       	</select>
       	<input type="text" name="foodcategory" id="ddd" readonly value="${vo.foodCategory }">
       	<div id="box">
       	<span>대표메뉴</span>
            <input type="text"> <input type="button" value="추가" onclick="add_textbox()">
        </div>
        <input type="submit" value="가게정보 수정" class="btn1">
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
	<script>
    $("select[name=class]").on("change", function(){
        var $addr = $(this).closest(".box").find("input[name=foodcategory]");
        if ($(this).val() == "etc") {
            $addr.val('');
            $addr.prop("readonly",false);

        } else {
            $addr.val($(this).val());
            $addr.prop("readonly",true);
        }
    });
	</script>
</body>
</html>