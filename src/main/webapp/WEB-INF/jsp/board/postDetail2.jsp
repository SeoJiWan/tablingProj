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
<%-- 			<input type="hidden" id = "boardId" name="boardId" value="${boardDetail.boardId}">
				<input type="hidden" id ="writer" name="writer" value="${boardDetail.memberId}">
				<input type="hidden" name="title" value="${boardDetail.title}">
				<input type="hidden" name="content" value="${boardDetail.content}">
				<input type="hidden" name="createDate" value="${boardDetail.createDate}">
				<input type="hidden" name="hits" value="${boardDetail.hits}"> --%>
					
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody style="text-align: left;">
					<tr id="trHead">
						<th>${boardDetail.boardId}</th>
						<th>${boardDetail.nickName}</th>
						<th>${boardDetail.title}</th>
						<th>${boardDetail.createDate}</th>
						<th>${boardDetail.hits}</th><!-- 디테일 페이지에서 클릭, 새로고침시 조회수 업데이트 X  -->
					</tr>
					<tr>
						<td colspan="5" width="600px" height="350px">${boardDetail.content}</td>
					</tr>
					<tr>
				</tbody>
			</table>
			<c:choose>
				<c:when test="${!empty loginMember.memberId && loginMember.memberId eq boardDetail.memberId }">
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
			
			
		<!-------------------------------------------------------------------- 댓글 구현 -------------------------------------------------------------------->
		<!-- 댓글  목록 -->
			<a href="#">[댓글]</a><br>
			<c:if test="${!empty comment}">
			<table class="comment_tbl" style="text-align: center; border: 1px solid #dddddd">
						<c:forEach var="item" items="${comment}">
								<tr>
									<td width="150">
									<input type="hidden" id = "commentId" name="commentId" value="${item.commentId}">
									<div>
										${item.nickName}(${item.memberId})
									</div>
								</td>
								<td width="550">
									<div class="text_wrapper">${item.content}</div>
								</td>
								<td width="150">
									<font size="2" color="lightgray">${item.commentDate }</font>
								</td>
								<td width="100">
								<div id="btn" style="text-align:center;">
									<!-- 댓글 작성자만 수정, 삭제 가능 -->
									<c:choose>
										<c:when test="${!empty loginMember && item.memberId eq loginMember.memberId}">
											<input type="button" value="댓글수정" />
											<input type="button" id="commentDelete" value="댓글삭제" />
										</c:when>
										<c:otherwise>
											<input type="hidden" value="댓글수정" />
											<input type="hidden" id="commentDelete" value="댓글삭제" />
										</c:otherwise>
									</c:choose>
							</div>
						</td>
					</tr>
					</c:forEach>
				</table>
			</c:if>
				<table class="comment_btn">
					<tr>
						<!-- 버튼 -->
			
							
				</table>
			<!-- 로그인 했을 경우만 댓글 작성 가능 -->
			<c:if test="${!empty loginMember.memberId}">
				<form action = "commentAdd.do" method = "post" id = "addCommentFrm">
							<input type="hidden" id = "cmtBoardId" name="cmtBoardId" value="${boardDetail.boardId}">
							<input type="hidden" id = "cmtWriter" name="cmtWriter" value="${loginMember.memberId}">
					<table>
						<tr bgcolor = "#F5F5F5">
							<!-- 댓글 닉네임(아이디) -->
							<td width="150">
								<div>
								${loginMember.nickName}(${loginMember.memberId})
								</div>
							</td>
							<!-- 댓글작성 -->
							<td width ="550">
								<div>
									<textarea id = "cmtContent" name="cmtContent" placeholder="내용을 입력하세요" maxlength="500" style="width: 500px; height: 100px;" ></textarea>
								</div>
							</td>
							<!-- 댓글 등록 버튼 -->
							<td>
								<div id="cmt_btn" style="text-align:center;">
									<p><input type="button" id="addCmt" value="댓글등록" /></p>
								</div>
							</td>
						</tr>
					</table>
				</form>
		</c:if>
	
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			$("#addCmt").click(function() {
				
				if (addCommentFrm.cmtContent.value ==""){
				 alert("내용을 입력하세요!");
				 addCommentFrm.cmtContent.focus();
				 return;
				}
				let addCmtCheck = function() {
				if(confirm("댓글을 등록하시겠습니까?") == true) {
			    	    return 1;
			    	  } else {
			    	    return 0;
			    	  }
			    	};
			    	
			    	if(addCmtCheck() == 1) {
			    		$.ajax({
			    			type:"POST",
			    			url:"commentAdd.do",
			    			data:{
			    				cmtWriter:$('#cmtWriter').val(),
			    				cmtBoardId:$('#cmtBoardId').val(),
			    				cmtContent:$('#cmtContent').val()
			    			},
			    			dataType:"text",
			    			
			    			success: function(data,textStatus,xhr) {
			    				if(data == "success") {
			    					alert("등록 되었습니다!")
			    					$("#cmtContent").val(''); // #cmtContent의 값 초기화
			    					/* window.href.location.reload(); */
			    				} else {
			    					return;
			    				  }
			    		    },
			    		    error: function (request, status, error) {
			    		      alert("code:" + request.status + "\n" + "error:" + error);
			    		    },
			    	  	});
			    	}
			    });
		
			<!-- ajax 댓글 삭제확인 및 삭제 -->
 			$("#commentDelete").click(function () {
		    	
		    	let delAnswer = function () {
		    	  if (confirm("댓글을 삭제하시겠습니까?") == true) {
		    	    return 1;
		    	  } else {
		    	    return 0;
		    	  }
		    	};
		    	
		    	if (delAnswer() == 1) {
		    		$.ajax({
		    		    type: "POST",
		    		
		    		    url: "commentDelete.do",
		    		
		    		    data:{
		    		    	commentId: $('#commentId').val()
		    			}, 
		    		
		    		    dataType: "text",
		    		
		    		    success: function (data, textStatus, xhr) {
		    		      if (data == "success") {
		    		        alert("삭제되었습니다!")
		    		        window.location.href.reload();
		    		      } else {
		    		      return;
		    		      }
		    		    },
		    		    error: function (request, status, error) {
		    		      alert("code:" + request.status + "\n" + "error:" + error);
		    		    },
		    	  	});
		    	}
		    });
			<!-- ajax 게시글 삭제확인 및 삭제 -->
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
