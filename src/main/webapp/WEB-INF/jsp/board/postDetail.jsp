<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<!-- Board CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/boardDetail.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/pagination.css" />
<!-- Icon -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
	<script src="https://kit.fontawesome.com/a9389f0a9d.js" crossorigin="anonymous"></script>
	
<!-- Favicons -->
  <link href="../img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
<style>
textarea:focus {
	outline: none;
}
</style>
</head>
	<body>
		<!-------------------------------------------------------------------- 게시글 -------------------------------------------------------------------->
 		<div id="container" class="me_menu3">
			<div class="section _section">
				<div class="contents _contents">
					<div class="frst_contents _noti_box" style=""> 
						<div class="time_line _noti_list type_alrm"> 
							<div class="daily_obj _ccast_list_group">
								<!-- <a id ="go_list_btn" href= "postListPaging.do?pageNum=1&postNum=10"><i class="fa-solid fa-line-columns"></i>목록으로</a> -->
						 		<div class="tx_tooltip">
									<input type="hidden" id = "boardId" name="boardId" value="${boardDetail.boardId}">
									<input type="hidden" id = "hits" name="hits" value="${boardDetail.hits}">
									<input type="hidden" id = "content" name="content" value="${boardDetail.content}">
									<input type="hidden" id = "title" name="title" value="${boardDetail.title}">
									<div id="title_group">
										<div class = "title_famaily" style="margin-left:25px"> No. ${boardDetail.boardId}</div>
										<div class = "title_famaily" style="width:80px; text-align:center;"><i class="fa-solid fa-pen-nib"></i> ${boardDetail.nickName}</div>
										<div class = "title_famaily" style="width:330px">${boardDetail.title}</div>
										<div class = "title_famaily"><i class="fa-solid fa-calendar-days"></i> ${boardDetail.createDate}</div>
										<div class = "title_famaily"><i class="fa-regular fa-eye"></i> ${boardDetail.hits}</div>
									</div>
									<div id="btn_btn_btn">
										<textarea id= "postContent" name = "postContent" class="postContent" maxlength="2000" style="display: block; padding : 30px 10px; width: 650px; height: 300px; border-radius: 5px; resize: none; border: none; overflow:hidden; text-align:left; margin: 0 auto;" readonly>${boardDetail.content}</textarea>
									<c:choose>
										<c:when test="${!empty loginMember.memberId && loginMember.memberId eq boardDetail.memberId }">
											<ul id = "writer_btn">
												<li>
													<button class = "cmt_login_btn" id="postUpdate_btn" type="button" value="수정" style="margin-right:5px; cursor:pointer;" onclick = "postUpdate_btn()"><i class="uil uil-file-edit-alt" style="color:#898989;"></i></button>
													<button class = "cmt_login_btn" id="postDelete" type="button" value="삭제"><i class="uil uil-times-circle" style="color:#CC0303; cursor:pointer;"></i></button>
													<button class="cmt_login_btn" id ="postUpdate_save_btn" value="저장" style="display:none; margin-right:5px; cursor:pointer;"><i class="uil uil-check-circle" style="color:#2AAB56;"></i></button>
													<!-- 취소버튼 -->
												</li>
											</ul>
										</c:when>
									<c:otherwise>
										<div id = "nonWriter_btn">
											<input type="hidden" value="수정" /><input type="hidden" id="postDelete" value="삭제" />
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						 </div>
					 		<a id ="go_list_btn" href= "postListPaging.do?pageNum=1&postNum=10"><i class="fa-solid fa-line-columns"></i>목록으로</a>
					 		<!-------------------------------------------------------------------- 댓글 입력 -------------------------------------------------------------------->
							<div id = "add_cmt_frm_hide_mode" class="tx_tooltip">
								<form action = "commentAdd.do" method = "post" id = "addCommentFrm">
									<input type="hidden" id = "cmtBoardId" name="cmtBoardId" value="${boardDetail.boardId}">
									<input type="hidden" id = "cmtWriter" name="cmtWriter" value="${loginMember.memberId}">
									<div class="tx_bubble">
										<p class="thumb" style="display:inline-block;">
											<img src="${pageContext.request.contextPath }/img/boardListProfile.png" width="40" height="40" alt="프로필이미지">
										</p>
										<div class="bubble_content">
										    <div class="tx_width" style="margin-top:0px;">
												<span class="linkTx">
													<strong class="ans_type _ccast_item_url  N=a:amx*b.content"></strong>
													<!-- TITLE -->
													<span class="alarm_tx _ccast_item_url  N=a:amx*b.content" style="display:inline-block;">
													</span>
													<span class="etc_obj">
														<textarea id = "cmtContent" name="cmtContent" placeholder="내용을 입력하세요" maxlength="200" style="width: 520px; height: 100px; border-radius: 5px; resize: none; display:inline-block; padding : 10px;" ></textarea>
														<input type="button" id="addCmt" class="bottom_btn" value="댓글등록" style="display:inline-bolck" />
													</span>
												</span>
										    </div>
										</div>							
									</div>
								</form>
							</div>
							<!-------------------------------------------------------------------- 댓글 목록 -------------------------------------------------------------------->
							<c:if test="${!empty comment}">
								<c:forEach var="commentVO" items="${comment}">
								<div id = "cmt_list_hide_mode" class="tx_tooltip">
									<input type="hidden" id = "commentId" name="commentId" value="${commentVO.commentId}">
										<div class="tx_bubble">
											<p class="thumb" style="display:inline-block;">
												<img src="${pageContext.request.contextPath }/img/boardListProfile.png" width="40" height="40" alt="프로필이미지">
											</p>
											<p class = "cmt_nicknameDate">
												${commentVO.nickName}
											</p>
											<p class = "cmt_nicknameDate" style="display:inline-block;">
											${commentVO.commentDate }
											</p>
											<div class="bubble_content">
											    <div class="tx_width">
													<span class="linkTx">
														<strong class="ans_type _ccast_item_url  N=a:amx*b.content"></strong>
														<!-- TITLE -->
														<span class="alarm_tx _ccast_item_url  N=a:amx*b.content" style="display:inline-block;">
														</span>
														<span class="etc_obj">
															<textarea id = "text_wrapper" class="text_wrapper" maxlength="200" style="width: 500px; height: 50px; border-radius: 5px; resize: none; display:inline-block; padding : 10px; border: none; overflow:hidden; margin-left:0;" readonly>${commentVO.content}</textarea>
														</span>
													</span>
											    </div>
											</div>							
											<!-- 댓글 작성자만 수정, 삭제 가능 -->
											<c:choose>
												<c:when test="${!empty loginMember && commentVO.memberId eq loginMember.memberId || loginMember.role == 0}">
													<input type="button" id ="commentDelete" class= "comment_edit_delete_btn" value="삭제" style="display:inline-block" />
													<input type="button" id ="cmtUpdate_btn" class="comment_edit_delete_btn" value="수정" style="display:inline-block"  onclick = "cmtUpdate_btn()" />
													<input type="button" id ="cmtUpdate_save_btn" class="comment_edit_delete_btn" value="저장" style="display:none;"/>
												</c:when>
												<c:otherwise>
													<input type="hidden" value="댓글수정" />
													<input type="hidden" id="commentDelete" value="댓글삭제" />
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
		<!-- ajax 글 수정 -->
		/* 수정버튼을 누르면 textarea폼 readonly모드 해제 -> 수정 -> 값 전달 */
		$("#postUpdate_btn").click(function () {
			$("#add_cmt_frm_hide_mode").css("display","none"); //댓글 입력폼 안보이게
			$("#cmt_list_hide_mode").css("display","none"); //댓글 리스트 안보이게
			$("#postContent").removeAttr("readonly"); //textarea readonly 해제
			$("#postUpdate_btn").css("display", "none"); //수정 버튼 비활성화
			$("#postDelete").css("display", "none"); //삭제 버튼 비활성화
			$("#postUpdate_save_btn").css("display", "inline-block"); //저장버튼 활성화
			$("#postContent").css("border", "solid 1"); //테두리 선 활성화
			$("#postContent").focus();// textarea focus
		});
		
		/* 저장 버튼 클릭시 수정내용 반영 -> 다시 게시글로 */
			$("#postUpdate_save_btn").click(function () {
			$("#postUpdate").attr("readonly", "readonly"); //textarea readonly 활성화
			$("#postUpdate_btn").css("display", "block"); //수정 버튼 활성화
			$("#postDelete").css("display", "inline-block"); //삭제 버튼 활성화
			$("#postUpdate_save_btn").css("display", "none"); //저장버튼 비활성화
	    	
			let updatePostAnswer = function () {
	    	  if (confirm("댓글을 수정하시겠습니까?") == true) {
	    	    return 1;
	    	  } else {
	    	    return 0; //취소 -> 게시글
	    	  }
	    	};
	    	if (updatePostAnswer() == 1) {
	    		$.ajax({
	    		    type: "post",
	    		
	    		    url: "postUpdate.do",
	    		
	    		    data:{
	    				boardId:$('#boardId').val(),
	    				content:$('#postContent').val(),
	    				title:$('#title').val()
	    			}, 
	    		
	    		    dataType: "text",
	    		
	    		    success: function (data, textStatus, xhr) {
	    		      let boardId = $('#boardId').val();
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
			    				cmtContent:$('#cmtContent').val(),
			    			},
			    			dataType:"text",
			    			
			    			success: function(data,textStatus,xhr) {
		    					let boardId = $('#cmtBoardId').val(); //jQuery에서 파라메터값 들고오는 법
			    				if(data == "success") {
			    					alert("등록 되었습니다!")
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
		<!-- ajax 댓글 수정 -->
		/* 수정버튼을 누르면 updateForm을 통해 textarea폼 로드 */
		$("#cmtUpdate_btn").click(function () {
			$("#text_wrapper").removeAttr("readonly"); //textarea readonly 해제
			$("#cmtUpdate_btn").css("display", "none"); //수정 버튼 비활성화
			$("#cmtUpdate_save_btn").css("display", "inline-block"); //저장버튼 활성화
			$("#text_wrapper").css("border", "solid"); //테두리 선 활성화
			$("#text_wrapper").focus();// textarea focus/outline활성화 //과제
		});
		
		/* 저장 버튼 클릭시 수정내용 반영 -> 댓글 리스트 로드 */
		$("#cmtUpdate_save_btn").click(function () {
			$("#text_wrapper").attr("readonly", "readonly"); //textarea readonly 활성화
			$("#cmtUpdate_btn").css("display", "block"); //수정 버튼 비활성화
			$("#cmtUpdate_save_btn").css("display", "none"); //저장버튼 활성화
	    	
			let updateCmtAnswer = function () {
	    	  if (confirm("댓글을 수정하시겠습니까?") == true) {
	    	    return 1;
	    	  } else {
	    	    return 0; //취소 -> 댓글 리스트
	    	  }
	    	};
	    	if (updateCmtAnswer() == 1) {
	    		$.ajax({
	    		    type: "post",
	    		
	    		    url: "commentUpdate.do",
	    		
	    		    data:{
	    		    	commentId: $('#commentId').val(),
	    				boardId:$('#boardId').val(),
	    				cmtContent:$('#text_wrapper').val(),
	    				cmtWriter:$('#cmtWriter').val()
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
	    </script>
    </body>
</html>
