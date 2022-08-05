<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>게시글 수정폼</title>
</head>
<body>
		<div class="container">
		<div class="row">
		<form action = "postUpdate.do" method="post" id="frm">
			<input type="hidden" id="boardId" name="boardId" value="${boardDetail.boardId }">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">커뮤니티</th>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 제목 영역 -->
						<td><input id="title" type="text" class="form-control" value="${boardDetail.title}" name="title" maxlength="22" style="width: 600px;" required></td>
					</tr>
					<tr> <!-- 내용 영역 -->
						<td><textarea id="content" class="form-control" name="content" maxlength="2000" style="width: 600px; height: 350px;" required>${boardDetail.content}</textarea></td>
					</tr>
					<tr>
						<td><input type="file" id="uploadFile" name="uploadFile"></td>
					</tr>
				</tbody>
			<!-- 수정 영역 끝 -->
			</table>
			<!-- 수정 버튼 -->
			<button id="btn_register" class="btn_postEdit" type="button" onclick="confirmEdit()">등록</button>
		</form>
			<!-- 취소 버튼// 목록 페이지로 -->
			<button id="btn_previous" type="button" class="btn_previous" onclick="location.href='postListPaging.do?pageNum=1&postNum=10'">취소</button>
		</div>
	</div>
			<!-- 수정 여부 확인 -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		function confirmEdit() {
			if (confirm("정말 수정하시겠습니까?") == true) { 
				frm.submit();
	    	  } else { //취소
	    		  return;
	    	  }
		}
    </script>
</body>
</html>