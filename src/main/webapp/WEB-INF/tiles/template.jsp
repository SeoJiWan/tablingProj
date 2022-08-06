<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link href="${pageContext.request.contextPath}/css/head.css" rel="stylesheet" type="text/css">
<!-- 아이콘 사용 링크 -->
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
</head>
<body>
	<!-- 헤더 -->
	<tiles:insertAttribute name="head"></tiles:insertAttribute>
	
	<!-- 바디 -->
	<tiles:insertAttribute name="body"></tiles:insertAttribute>


</body>


<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 헤더에서 엔터키 입력 시 이벤트 발생 -->
<script type="text/javascript">
function enterkey() {
	if (window.event.keyCode == 13) {
		let keyword = $('#keyword').val();
		//console.log(keyword);
		
		if (keyword != "") {
			$.ajax({
				type: "POST",
				// 통신할 컨트롤러 지정 (.do) --> 은하
				url: "#", 
				
				data: {
					// 앞에 변수는 데이터 받는 변수 이름
					keyword: keyword
				},
				
				dataType: "text",
				
				success: function (data) {
					alert(keyword + " 검색결과 : ")
				},
				
				error: function (request, status, error) {
	    		      alert("code:" + request.status + "\n" + "error:" + error);
	    		},
				
			
			});
		}
		
		else {
			alert('검색어를 입력하세요.');
		}
	}
} 
</script>

</html>

