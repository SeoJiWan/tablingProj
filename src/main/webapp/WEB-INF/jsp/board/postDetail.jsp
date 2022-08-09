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
		<!-------------------------------------------------------------------- 게시글 구현 -------------------------------------------------------------------->
 		<form action="postUpdateForm.do" method="post">
			<input type="hidden" id = "boardId" name="boardId" value="${boardDetail.boardId}">
<%-- 			<input type="hidden" id ="writer" name="writer" value="${boardDetail.memberId}">
			<input type="hidden" name="title" value="${boardDetail.title}">
			<input type="hidden" name="content" value="${boardDetail.content}">
			<input type="hidden" name="createDate" value="${boardDetail.createDate}"> --%>
			<input type="hidden" name="hits" value="${boardDetail.hits}"> 
				
		<table id = "postList" style="text-align: center; border: 1px solid #dddddd">
			<tbody style="text-align: left;">
				<tr id="trHead">
					<th>${boardDetail.boardId}</th>
					<th>작성자 : ${boardDetail.nickName}</th>
					<th>${boardDetail.title}</th>
					<th>작성날짜 : ${boardDetail.createDate}</th>
					<th>조회수 : ${boardDetail.hits}</th><!-- 디테일 페이지에서 클릭, 새로고침시 조회수 업데이트 X  -->
				</tr>
				<tr>
					<td colspan="5" width="600px" height="350px">${boardDetail.content}</td>
				</tr>
				<tr>
			</tbody>
		</table>
		<c:choose>
			<c:when test="${!empty loginMember.memberId && loginMember.memberId eq boardDetail.memberId }">
				<ul id = "writer_btn">
					<li>
						<input type="submit" value="수정" /><input type="button" id="postDelete" value="삭제" />
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<div id = "nonWriter_btn">
					<input type="hidden" value="수정" /><input type="hidden" id="postDelete" value="삭제" />
				</div>
			</c:otherwise>
		</c:choose>
	</form>
	<a href= "postListPaging.do?pageNum=1&postNum=10"><button>목록으로</button></a>	
	<!-------------------------------------------------------------------- 댓글 구현 -------------------------------------------------------------------->
	<form action = "commentAdd.do" method = "post" id = "addCommentFrm">
				<input type="hidden" id = "cmtBoardId" name="cmtBoardId" value="${boardDetail.boardId}">
				<input type="hidden" id = "cmtWriter" name="cmtWriter" value="${loginMember.memberId}">
		<a href="cmt">[댓글]</a><br>
		<table id = "cmt">
			<tr bgcolor = "#dddddd">
				<!-- 댓글작성 -->
				<td width ="700">
					<div>
						<textarea id = "cmtContent" name="cmtContent" placeholder="내용을 입력하세요" maxlength="500" style="width: 650px; height: 100px;" ></textarea>
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
	<!-- 댓글  목록 -->
	<c:if test="${!empty comment}">
		<table class="comment_tbl" style="text-align: center; border: 1px solid #dddddd">
					<c:forEach var="commentVO" items="${comment}">
							<tr>
								<td width="150">
								<input type="hidden" id = "commentId" name="commentId" value="${commentVO.commentId}">
								<div>
									${commentVO.nickName}
								</div>
							</td>
							<td width="550">
								<div class="text_wrapper">${commentVO.content}</div>
							</td>
							<td width="150">
								<font size="2" color="lightgray">${commentVO.commentDate }</font>
							</td>
							<td width="100">
							<div id="btn" style="text-align:center;">
								<!-- 댓글 작성자만 수정, 삭제 가능 -->
								<c:choose>
									<c:when test="${!empty loginMember && commentVO.memberId eq loginMember.memberId}">
										<input type="button" id ="commentUpdate" value="댓글수정" />
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

		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
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
	    <!-- ajax 댓글 등록버튼 클릭 체크 -->
		$("#addCmt").click(function() {
			/* 댓글 로그인 확인 */
			if (addCommentFrm.cmtWriter.value == "") { 
				alert("로그인이 필요합니다!")
				window.location.href = "memberLoginForm.do"; //로그인폼으로 이동
			} 
			/* 내용 입력 확인 */
			else if (addCommentFrm.cmtContent.value ==""){
						 alert("내용을 입력하세요!");
						 addCommentFrm.cmtContent.focus();
						 return;
			} /* 댓글 등록 확인 */
			else {
					let addCmtCheck = function() {
						if(confirm("댓글을 등록하시겠습니까?") == true) { 
							return 1;
						} else {
								 return 0;
						  }
					};
			    	/* 확인 -> 댓글 등록 */
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
		    					let boardId = $('#cmtBoardId').val(); //jQuery에서 파라메터값 들고오는 법
			    				if(data == "success") {
			    					alert("등록 되었습니다!")
			    					console.log(boardId)
			    					$("#cmtContent").val(''); // #cmtContent의 값 초기화
			    					window.location.href = "postDetail.do?boardId="+ boardId; //위에서 변수 선언한 페라메터값 이동조건에 붙여주기
			    				} else {
			    					return;
			    				  }
			    		    },
			    		    error: function (request, status, error) {
			    		    alert("code:" + request.status + "\n" + "error:" + error);
			    		    },
			    	  	});
			    	}
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
	   		      	let boardId = $('#cmtBoardId').val();
	   		      	if (data == "success") {
					alert("삭제되었습니다!")
					window.location.href = "postDetail.do?boardId="+ boardId;
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
		<!-- ajax 댓글 수정 -->
			$("#commentUpdate").click(function () {
				/* 수정버튼을 누르면 updateForm을 통해 textarea폼 로드 */
				/* 저장 버튼 클릭시 수정내용 반영 -> 댓글 리스트 로드 */
				/* 취소 -> 댓글 리스트 */
	    	let updateAnswer = function () {
	    	  if (confirm("댓글을 수정하시겠습니까?") == true) {
	    	    return 1;
	    	  } else {
	    	    return 0;
	    	  }
	    	};
	    	
	    	if (updateAnswer() == 1) {
	    		$.ajax({
	    		    type: "POST",
	    		
	    		    url: "commentUpdateForm.do",
	    		
	    		    data:{
	    		    	commentId: $('#commentId').val()
	    			}, 
	    		
	    		    dataType: "text",
	    		
	    		    success: function (data, textStatus, xhr) {
	    		      let boardId = $('#cmtBoardId').val();
	    		      if (data == "success") {
	    		        alert("수정되었습니다!")
	    		        window.location.href = "postDetail.do?boardId="+ boardId;
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
			
	    </script>
    </body>
</html>
