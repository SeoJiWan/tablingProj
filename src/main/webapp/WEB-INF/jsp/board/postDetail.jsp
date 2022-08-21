<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>게시글 보기</title>
	<!-- Board CSS-->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/css/board/boardDetail.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath }/css/board/pagination.css" />
	<!-- Icon -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
	<script src="https://kit.fontawesome.com/a9389f0a9d.js" crossorigin="anonymous"></script>
	
	<!-- Favicons -->
	  <link href="../img/favicon.png" rel="icon">
	  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
		
	<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
	</head>
	<body>
		<!-------------------------------------------------------------------- 게시글 -------------------------------------------------------------------->
		<div id = "container">
			<div id = "goTo_post_list_btn">
				<a href="postListPaging.do?pageNum=1&postNum=6"><button id="go_list_btn">목록으로</button></a>
			</div>
			<div id = "post_detail" class = "box_outline">
				<input type="hidden" id="boardId" name="boardId" value="${boardDetail.boardId}">
				<input type="hidden" id="hits" name="hits" value="${boardDetail.hits}">
				<input type="hidden" id="content" name="content" value="${boardDetail.content}">
				<input type="hidden" id="title" name="title" value="${boardDetail.title}">
				<!-- 게시글 제목영역 : 닉네임, 제목, & 드롭박스 버튼 영역(수정, 삭제?)-->
				<div id="post_detail_head_area" class = "under_line">
					<div id = "post_detail_head_area_title">${boardDetail.title}</div>
					
					<!-- 로그인 타입에 따라 분리하여 이미지 출력 (카카오 계정이면 카카오톡 프사) -->
	                <c:set var="img" value="${boardDetail.profile }"></c:set>
	                <c:if test="${!fn:startsWith(img, 'http')}">
		                <img
		                  class="profile_img"
		                  id="profile_img"
		                  alt="profile"
		                  src="img/profile_img/${boardDetail.profile }"
		                />
	                </c:if>
	                <c:if test="${fn:startsWith(img, 'http')}">
		                <img
		                  class="profile_img"
		                  id="profile_img"
		                  alt="profile"
		                  src="${boardDetail.profile }"
		                />
	                </c:if>
					
					<div id = "post_detail_head_area_info">
							${boardDetail.nickName}<br>
						<div id = "post_detail_head_area_date_hits">
							${boardDetail.createDate}
							<i class="fa-regular fa-eye"></i>${boardDetail.hits}
						</div>
					</div>
				</div>
				<!-- 게시글 내용영역 -->
				<div id="post__detail_content_area">
					<textarea id="postContent" name="postContent" class="postContent" maxlength="2000" readonly>${boardDetail.content}</textarea>
					<textarea id="post_block_content" name="postContent" class="postContent" placeholder= "부적절한 내용으로 차단된 게시글입니다." style="display: none; padding: 30px 10px; width: 650px; height: 300px; border-radius: 5px; resize: none; border: none; overflow: hidden; text-align: left; margin: 0 auto;" readonly></textarea>
				</div>
				<!-- 게시글 버튼영역 -->
				<div id="post_detail_btn_area" class ="top_line">
					<!-- 작성자 = 로그인 멤버 -->
					<c:choose>
						<c:when test="${!empty loginMember.memberId && loginMember.memberId eq boardDetail.memberId}">
							<ul>
								<li>
									<button class="user_cmt_open_btn" type="button" value="댓글열기">
									<i class="#"></i>댓글▼</button>
								</li>
								<li>
									<button class="user_cmt_close_btn" type="button" value="댓글닫기" style="display: none;">
									<i class="#"></i>댓글▲</button>
								</li>
							</ul>	
							<ul class = "cmt_writer_access_btn">
								<li><button class="cmt_user_btn" id="postUpdate_btn" type="button" value="수정">
									<i class="uil uil-file-edit-alt"></i></button>
								</li>	
								<li>
									<button class="cmt_user_btn" id="postDelete" type="button" value="삭제">
									<i class="uil uil-times-circle"></i></button>
								</li>
							</ul>
							<ul class  = "cmt_writer_access_btn">
								<li><button class="cmt_user_btn" id="postUpdate_save_btn" value="저장" style="display: none; cursor: pointer;">
									<i class="uil uil-check-circle"></i></button> 
								</li>
								<li><button class="cmt_user_btn" id="postUpdate_cancel_btn" value="취소" style="display: none; cursor: pointer;">
									 <i class="#"></i></button>
								</li>
							</ul>
						</c:when>
						<c:when test="${!empty loginMember.memberId && loginMember.role == 0 }">
							<ul>
								<li><button class="cmt_user_btn" id="post_block_btn" type="button" value="게시글차단">
								<i class="uil uil-file-edit-alt"></i></button>
								</li>
							</ul>	
						</c:when>
						<c:otherwise>
							<ul>
								<li>
									<button class="user_cmt_open_btn" type="button" value="댓글열기">
									<i class="#"></i>댓글▼</button>
								</li>
								<li>
									<button class="user_cmt_close_btn" type="button" value="댓글닫기" style="display: none;">
									<i class="#"></i>댓글▲</button>
								</li>
							</ul>	
						</c:otherwise>
					</c:choose>
				</div>
			</div>	
			<!-------------------------------------------------------------------- 댓글 입력 -------------------------------------------------------------------->
			<!-- 로그인한 사람이면 댓글 달 수 있도록 -->
			<div id = "cmt_area" style="display:none;">
				<div id = "cmt_add" class = "box_outline">
						<c:choose>
							<c:when test="${!empty loginMember.memberId}">
								<form action = "commentAdd.do" method = "post" id = "addCommentFrm">
									<div id = "cmt_add_profile_area" class = "under_line">

										<!-- 로그인 타입에 따라 분리하여 이미지 출력 (카카오 계정이면 카카오톡 프사) -->
										<c:set var="img" value="${loginMember.profileImgUrl }"></c:set>
						                <c:if test="${!fn:startsWith(img, 'http')}">
							                <img
							                  class="profile_img"
							                  id="profile_img"
							                  alt="profile"
							                  src="img/profile_img/${loginMember.profileImgUrl }"
							                />
						                </c:if>
						                <c:if test="${fn:startsWith(img, 'http')}">
							                <img
							                  class="profile_img"
							                  id="profile_img"
							                  alt="profile"
							                  src="${loginMember.profileImgUrl }"
							                />
						                </c:if> 
										<div id = cmt_add_nickname class = "cmt_nickname">
											${loginMember.nickName}
										</div>
										<input type="hidden" id="cmtBoardId" name="cmtBoardId" value="${boardDetail.boardId}">
										<input type="hidden" id="cmtWriter" name="cmtWriter" value="${loginMember.memberId}">
										<input type="button" id = "add_cmt_btn" class="add_cmt_btn" value="등록" />
									</div>
									<div class = "cmt_content_area">
										<textarea id="cmtContent" name="cmtContent" placeholder="내용을 입력하세요" maxlength="500" style="display: inline-block; width:770px; min-height : 80px; padding: 10px; border-radius: 5px; resize: none; margin:auto;"></textarea>
									</div>
								</form>
							</c:when>
							<c:otherwise>
								<div class = "cmt_add_profile_area">
									<input type="button" id = "nonuser_add_cmt_btn" class="add_cmt_btn" value="등록" />
								</div>
								<div class = "cmt_content_area">
									<textarea id="cmtContent_nonuser" name="cmtContent_nonuser" placeholder="로그인 후에 사용가능합니다." readonly></textarea>
								</div>
							</c:otherwise>
						</c:choose>
				</div>
				<!-------------------------------------------------------------------- 댓글 목록 -------------------------------------------------------------------->
				<div id = "cmt_list" class = "box_outline">
					<c:if test="${!empty comment}">
						<c:forEach var="cmtInfo" items="${comment}">
							<div class = "cmt_detail">
								<p style="display:none">
									${cmtInfo.commentId}
								</p>
								<div id = "cmt_list_profile_area" class = "under_line">
<%-- 									<img src="${pageContext.request.contextPath }/img/profile_img/default_profile.jpg" alt="프로필이미지">  --%>

									<!-- 로그인 타입에 따라 분리하여 이미지 출력 (카카오 계정이면 카카오톡 프사) -->
					                <c:set var="img" value="${cmtInfo.profile }"></c:set>
					                <c:if test="${!fn:startsWith(img, 'http')}">
						                <img
						                  class="profile_img"
						                  id="profile_img"
						                  alt="profile"
						                  src="img/profile_img/${cmtInfo.profile }"
						                />
					                </c:if>
					                <c:if test="${fn:startsWith(img, 'http')}">
						                <img
						                  class="profile_img"
						                  id="profile_img"
						                  alt="profile"
						                  src="${cmtInfo.profile }"
						                />
					                </c:if>
					                
									<div class = "cmt_llist_nickname">
										${cmtInfo.nickName}<br>
										<div class = "cmt_list_profile_area_cmtDate">${cmtInfo.commentDate }</div>
									</div>
									<!-- 본인 댓글만 수정할 수 있도록 -->
									<div class ="cmt_detail_btn_area">
										<c:choose>
											<c:when test="${!empty loginMember && cmtInfo.memberId eq loginMember.memberId}">
												<input type="button" name="cmtDelete" class="cmt_btn" value="삭제" onclick="deleteCallBack(event)" />
												<input type="button" name="cmtUpdate" class="cmt_btn" value="수정" onclick="updateCallBack(event)" />
												<input type="button" name="cmtReturn" class="cmt_btn" value="취소" style="display: none;" onclick="backCallback(event)" />
												<input type="button" name="cmtSave" class="cmt_btn" value="저장" style="display: none;" onclick="saveCallback(event)" />
											</c:when>
											<c:when test = "${!empty loginMember &&  loginMember.role == 0}">
												<input type="button" id="cmt_block_btn" name="cmtBlock" class="cmt_btn" value="차단" onclick="blockCallback(event)"  />
											</c:when>
										</c:choose>
									</div>
								</div>
								<div class = "cmt_list_content_area">
									<textarea  maxlength="2000" style = "display: inline-block; width:780px; min-height:80px; padding: 10px; border-radius: 5px; border:none; resize: none; margin:auto;"  readonly>${cmtInfo.content}</textarea>
									<textarea placeholder="부적절한 내용으로 차단된 댓글입니다." style="display:none; resize: none; padding: 10px; border: none;" readonly></textarea>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty comment}">
						<div id = "non_cmt">댓글이 없습니다! 소중한 첫 댓글을 남겨주세요 :)</div>
					</c:if>
			</div>
		</div>
	</div>	
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		<script type="text/javascript">
			/* ajax 글 수정 */
			$("#postUpdate_btn").click(function () {
				$("#cmt_area").css("display","none"); //댓글 리스트 안보이게
				$("#postContent").removeAttr("readonly"); //textarea readonly 해제
				$("#postUpdate_btn").css("display", "none"); //수정 버튼 비활성화
				$("#postDelete").css("display", "none"); //삭제 버튼 비활성화
				$("#postUpdate_save_btn").css("display", "inline-block"); //저장버튼 활성화
				$("postUpdate_cancel_btn").css("display", "inline-block"); //취소버튼 활성화
				$("#postContent").css("border", "solid 1"); //테두리 선 활성화
				$("#postContent").focus();// textarea focus
			});
			
			/* 저장 버튼 클릭시 수정내용 반영 -> 다시 게시글로 */
				$("#postUpdate_save_btn").click(function () {
				$("#postUpdate").attr("readonly", "readonly"); //textarea readonly 활성화
				$("#postUpdate_save_btn").css("display", "none"); //저장버튼 비활성화
				$("#postUpdate_cancel_btn").css("display", "none"); //취소 버튼 비활성화
				$("#postUpdate_btn").css("display", "block"); //수정 버튼 활성화
				$("#postDelete").css("display", "inline-block"); //삭제 버튼 활성화
		    	
		    	if (confirm("글을 수정하시겠습니까?") == true) {
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
		    	 } else {
		    	   	return;
		    	  }
			});
		    
			
			/* ajax 게시글 삭제확인 및 삭제 */
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
		    		        window.location.href = "postListPaging.do?pageNum=1&postNum=6";
		    		      } else {
		    		        window.location.href = "postListPaging.do?pageNum=1&postNum=6";
		    		      }
		    		    },
		    		    error: function (request, status, error) {
		    		      alert("code:" + request.status + "\n" + "error:" + error);
		    		    },
		    	  	});
		    	}
		    });
		    
		    /* 댓글 열림 */
		    $(".user_cmt_open_btn").click(function () {
				$(this).css("display","none"); //댓글 열기버튼 안보이게
		    	$(".user_cmt_close_btn").css("display","inline-block"); //댓글 닫기 버튼 보이게
				$("#cmt_area").css("display","block"); //댓글영역 보이게
		    });
		    
		    /* 댓글 닫힘 */
		       $(".user_cmt_close_btn").click(function (){
				$(this).css("display","none"); //댓글 닫기버튼 안보이게
		    	$(".user_cmt_open_btn").css("display","inline-block"); //댓글 열기 버튼 보이게
				$("#cmt_area").css("display","none"); //댓글영역 숨기기
		    });
		    
		    /*ajax 댓글 등록버튼 클릭 체크 */
			/* 비회원 로그인폼 이동 */
			$("#nonuser_add_cmt_btn").click(function() {
					let loginCheck = confirm("로그인이 필요합니다!")
					if(loginCheck == true) {
						window.location.href = "memberLoginForm.do"; //로그인폼으로 이동
					} else {
						return;
					}
			});
			
			/* 회원 내용 입력 확인 후 댓글등록 */
			$("#add_cmt_btn").click(function() {
				
				if (addCommentFrm.cmtContent.value == ""){
							 alert("내용을 입력하세요!");
							 addCommentFrm.cmtContent.focus();
							 return;
				} 
				else {
						let addCmtCheck = function() {
							if(confirm("댓글을 등록하시겠습니까?") == true) {
								return true;
							} else {
								return false;
							}
						};	
						if(addCmtCheck() == true ) {
							$.ajax({
				    			type:"POST",
				    			url:"commentAdd.do",
				    			data:{
				    				cmtBoardId:$('#cmtBoardId').val(),
				    				cmtWriter:$('#cmtWriter').val(),
				    				cmtContent:$('#cmtContent').val(),
				    			},
				    			dataType:"text",
				    			
				    			success: function(data,textStatus,xhr) {
			    					let boardId = $('#cmtBoardId').val(); //jQuery에서 파라메터값 들고
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
		 </script>
		 <script>
		 /* 댓글삭제 */
		 function deleteCallBack(e) {
			console.log(e.target); //event의 call함수(이벤트를 받는 대상.)
			let commentId = e.target.parentElement.parentElement.parentElement.firstElementChild.innerText;
 			if(confirm('선택하신 댓글을 삭제하시겠습니까?')) {			
			let delAjx = new XMLHttpRequest();
			delAjx.open('post', 'commentDelete.do');
			delAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			delAjx.send('commentId=' + commentId);
			delAjx.onload = function() {		
			// {retCode : Success}
			let result = JSON.parse(delAjx.responseText);			
				if(result.retCode == 'Success') {
					alert('댓글을 삭제하였습니다!')
					location.reload(true);
					e.target.parentElement.parentElement.parentElement.remove();
				}
				else{ 
					alert('삭제에 실패했습니다.');
				}
			}
			} else {
			  } 
		}
		 
		/* 댓글수정 */
	    function updateCallBack(e) {
			let com = e.target.parentElement.parentElement.parentElement;
			let co = com.childNodes[5].firstElementChild.value; // 댓글 내용
			console.log(co);
			let c = com.childNodes[5].firstElementChild; // textarea
			let delbutton = com.childNodes[3].childNodes[9].firstElementChild; // 삭제버튼 
			let upbutton = delbutton.nextElementSibling; // 수정버튼
			let backbutton = upbutton.nextElementSibling; // 취소버튼
			let savebutton = backbutton.nextElementSibling; // 저장버튼
			
			c.readOnly=false;
			c.style.border = "1px solid #ededed"
			delbutton.style.display = "none";
			upbutton.style.display = "none";
			savebutton.style.display = "inline-block";
			backbutton.style.display = "inline-block";
	    }	    

	    function backCallback(e) {
	    	let com = e.target.parentElement.parentElement.parentElement;
			let co = com.childNodes[5].firstElementChild.value; // 댓글 내용
			let c = com.childNodes[5].firstElementChild; // textarea
			let delbutton = com.childNodes[3].childNodes[9].firstElementChild; // 삭제버튼 
			let upbutton = delbutton.nextElementSibling; // 수정버튼
			let backbutton = upbutton.nextElementSibling; // 취소버튼
			let savebutton = backbutton.nextElementSibling; // 저장버튼
			
			c.readOnly=true;
			c.style.border = "none"
			delbutton.style.display = "inline-block";
			upbutton.style.display = "inline-block";
			savebutton.style.display = "none";
			backbutton.style.display = "none";
	    	
	    }
	    
	    /* 수정 댓글 저장 */
	    function saveCallback(e) {
	    	let com = e.target.parentElement.parentElement.parentElement;
	    	let co = com.childNodes[5].firstElementChild.value; // 댓글 내용
			console.log(co);
			let c = com.childNodes[5].firstElementChild; // textarea
			let delbutton = com.childNodes[3].childNodes[9].firstElementChild; // 삭제버튼 
			let upbutton = delbutton.nextElementSibling; // 수정버튼
			let backbutton = upbutton.nextElementSibling; // 취소버튼
			let savebutton = backbutton.nextElementSibling; // 저장버튼
			
			let commentId = e.target.parentElement.parentElement.parentElement.firstElementChild.innerText;
			
 			if(confirm('댓글을 수정하시겠습니까?')) {			
 				let delAjx = new XMLHttpRequest();
 				delAjx.open('post', 'commentUpdate.do');
 				delAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
 				delAjx.send('commentId=' + commentId + '&content=' + co);
 				delAjx.onload = function() {		
 				// {retCode : Success}
 				let result = JSON.parse(delAjx.responseText);			
 					if(result.retCode == 'Success') {
 						alert('수정이 완료되었습니다!')
 						c.readOnly=true;
						c.style.border = "none"
						delbutton.style.display = "inline-block";
						upbutton.style.display = "inline-block";
						savebutton.style.display = "none";
						backbutton.style.display = "none";
						
 						location.reload(true);
 					}
 					else{ 
 						alert('수정에 실패했습니다!');
 					}
 				}
 				} else {
 				  } 
	    }
	    /* 댓글 차단 */
	    function blockCallback(e) {
	    	let com = e.target.parentElement.parentElement.parentElement;
	    	let blockCmt = com.childNodes[5].lastElementChild.value; // 차단 댓글 내용
			let blockbutton = com.childNodes[3].childNodes[7].lastElementChild;// 차단버튼
			
			let commentId = e.target.parentElement.parentElement.parentElement.firstElementChild.innerText;
			
			if(confirm('차단된 댓글은 해제가 불가능합니다.' + '\n' + '해당 댓글을 차단하시겠습니까?')) {	
				alert('해당 댓글이 차단 되었습니다!')
				blockCmt.style.display = "inline-block";
				blockbutton.style.display = "none";
			}
			
 			}
	    </script>
	</body>
</html>