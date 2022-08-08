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
<!-- Sweet alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

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
		let pageNum = 1;
		let postNum = 8;
		console.log(keyword);
		
		if (keyword == "") {
			alert("검색어를 입력하세요 :)");
		}
		else {
			alert(keyword + " 검색 결과 :)");
			window.location.href = "storeSearchPaging.do?keyword=" + keyword + "&pageNum=" + pageNum + "&postNum=" + postNum;
		}
	}
} 

function loginRequired() {
// 	if (confirm("로그인이 필요한 서비스입니다.\n 이동하시겠습니까?") == true) {
// 		window.location.href = "memberLoginForm.do";
// 	}
// 	else {
// 		return 0;
// 	}
	Swal.fire({
            title: '로그인이 필요합니다.',
            text: "로그인페이지로 이동하시겠습니까?",
            icon: 'info',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '이동',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
            	location.href = "memberLoginForm.do";
            }
        })
}
</script>

</html>

