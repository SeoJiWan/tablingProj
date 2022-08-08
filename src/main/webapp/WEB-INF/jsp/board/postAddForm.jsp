<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록폼</title>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<!-- 로그인 값 확인 -->

	<!-- 글쓰기 영역 시작 -->
	<div class="container">
		<div class="row">
		<form action = "postAdd.do" method="post" id="frm">
			<input type="hidden" id ="memberId" name="writer" value="${loginMember.memberId}">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">커뮤니티</th>
						</tr>
					</thead>
					<tbody>
						<tr> <!-- 제목 영역 -->
							<td><input id="title" type="text" class="form-control" placeholder="제목" name="title" maxlength="22" style="width: 600px;" required></td>
						</tr>
						<tr> <!-- 내용 영역 -->
							<td><textarea id="content" class="form-control" placeholder="내용을 입력하세요" name="content" maxlength="2000" style="width: 600px; height: 350px;" required></textarea></td>
						</tr>
						<tr>
							<td><input type="file" id="uploadFile" name="uploadFile"></td>
						</tr>
					</tbody>
		<!-- 글쓰기 영역 끝 -->
		<!-- 글쓰기 버튼 -->
				</table>
			<button id="btn_register" class="btn_registert" type="button" onclick="checkAdd()">등록</button>
		</form>
		<!-- 취소 버튼 -->
			<button id="btn_previous" type="button" class="btn_previous" onclick="location.href='postListPaging.do?pageNum=1&postNum=10'">취소</button>
		</div>
	</div>
</body>
		<!-- 글쓰기확인 -->
		<!-- 제목, 내용 널값 확인 및 글 등록 여부 확인 -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function checkAdd() {
			if (frm.title.value == "") { 
				 alert("제목을 입력하세요!");
				 return;
	    	} else if (frm.content.value == "") {
	               alert("내용을 입력하세요!");
	               frm.content.focus();
	            return;
	    	  } else {
	    		  if (confirm("글을 등록하시겠습니까?") == true) { 
	  				frm.submit();
	  	    	  } else { 
	  	    		  return;
	  	    	  	}
	    	  }
		}
       </script>
   </body>
</html>