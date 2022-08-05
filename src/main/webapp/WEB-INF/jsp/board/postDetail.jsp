<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<%-- <link href="${pageContext.request.contextPath}/css/board.css" rel="stylesheet"/> --%>
</head>
	<body>
		<form action="postUpdateForm.do" method="post">
			<input type="hidden" id = "boardId" name="boardId" value="${boardDetail.boardId}">
			<input type="hidden" name="memberId" value="${boardDetail.memberId}">
			<input type="hidden" name="title" value="${boardDetail.title}">
			<input type="hidden" name="content" value="${boardDetail.content}">
			<input type="hidden" name="createDate" value="${boardDetail.createDate}">
			<input type="hidden" name="hits" value="${boardDetail.hits}">
					
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody style="text-align: left;">
					<tr style="border-bottom:1px solid #cccccc;">
						<th>${boardDetail.boardId}</th>
						<th>${boardDetail.nickName}</th>
						<th>${boardDetail.title}</th>
						<th>${boardDetail.createDate}</th>
						<th>${boardDetail.hits}</th>
					</tr>
					<tr>
						<td colspan="5" width="600px" height="350px">${boardDetail.content}</td>
					</tr>
					<tr>
				</tbody>
			</table>
			<input type="submit" value="수정">
		</form>
			<a href= "postListPaging.do?pageNum=1&postNum=10"><button>목록으로</button></a>
			<input type="button" id="postDelete" value="삭제" />
		
		<!-- 삭제확인 -->
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
		    $("#postDelete").click(function () {
		    	
		    	let delAnswer = function () {
		    	  if (confirm("삭제된 글은 되돌릴 수 없습니다."+"\n"+"정말 삭제하시겠습니까?") == true) {
		    	    return 1;
		    	  } else {
		    	    return 0;
		    	  }
		    	};
		    	
		    	if (delAnswer() == 1) {
		    		$.ajax({
		    		    type: "POST",
		    		
		    		    url: "postDelete.do",
		    		
		    		    data:{
		    				boardId: $('#boardId').val()
		    			}, 
		    		
		    		    dataType: "text",
		    		
		    		    success: function (data, textStatus, xhr) {
		    		      if (data == "success") {
		    		        alert("삭제되었습니다!")
		    		        window.location.href = "postListPaging.do?pageNum=1&postNum=10";
		    		      } else {
		    		        window.location.href = "postListPaging.do?pageNum=1&postNum=10";
		    		      }
		    		    },
		    		
		    		    error: function (request, status, error) {
		    		      alert("code:" + request.status + "\n" + "error:" + error);
		    		    },
		    	  	});
		    	}
		    });
	    </script>
    </body>
</html>
