<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/basic.css" />
</head>
	<body>
		<form action="postUpdateForm.do" method="post">
			<input type="hidden" id = "boardId" name="boardId" value="${boardDetail.boardId}">
			<input type="hidden" name="writer" value="${boardDetail.memberId}">
			<input type="hidden" name="title" value="${boardDetail.title}">
			<input type="hidden" name="content" value="${boardDetail.content}">
			<input type="hidden" name="createDate" value="${boardDetail.createDate}">
			<input type="hidden" name="hits" value="${boardDetail.hits}">
					
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody style="text-align: left;">
					<tr id="trHead">
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
			<c:choose>
				<c:when test="${!empty loginMemberId && loginMemberId eq boardDetail.memberId }">
					<input type="submit" value="수정" />
					<input type="button" id="postDelete" value="삭제" />
				</c:when>
				<c:otherwise>
					<input type="hidden" value="수정" />
					<input type="hidden" id="postDelete" value="삭제" />
				</c:otherwise>
			</c:choose>
		</form>
			<a href= "postListPaging.do?pageNum=1&postNum=10"><button>목록으로</button></a>
			
			
		<%-- 	<c:if test="${requestScope.commentList != null} ">
				<c:forEach var="comment" items="${commentList}">
					<tr>
						<td width="150">
							<div>${comment.comment_id}<br><font size="2" color="lightgray">${comment.create_date }</font></div>
						</td>
						<!-- 본문내용 -->
						<td width="550">
							<div class="text_wrapper">${comment.comment_content}</div>
						</td>
						<!-- 버튼 -->
						<td width="100">
							<div id="btn" style="text-align:center;">
									<a href="#">[답변]</a><br>
								<!-- 댓글 작성자만 수정, 삭제 가능 -->
								<c:if test="${comment.comment_id == sessionScope.sessionId }">
									<a href = "#">[수정]</a><br>
									<a href = "#">[삭제]</a>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if> --%>
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
