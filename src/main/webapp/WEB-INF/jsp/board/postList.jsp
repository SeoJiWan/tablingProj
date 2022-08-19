<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" class="fixed_elem">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=1280">
	<title>커뮤니티 글목록</title>
	<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"> -->
	<!-- Board CSS-->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/boardList.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/pagination.css" />
	
	<!-- Icon -->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
	<script src="https://kit.fontawesome.com/a9389f0a9d.js" crossorigin="anonymous"></script>

	  <!-- Favicons -->
	  <link href="../img/favicon.png" rel="icon">
	  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">
	
	  <!-- Google Fonts -->
	  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">
	
	  <!-- Bootstrap CSS File -->
	  <!--   <link href="SumoLanding/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

 	  <!-- Libraries CSS Files -->
<!--   <link href="SumoLanding/lib/ionicons/css/ionicons.min.css" rel="stylesheet"> -->
</head>
<%-- <jsp:include page="/sidebar/boardSidebar.jsp"/> --%>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <!-- COMUNITYBOARD_LIST-->
    <!-- HEADER-->
	<header class="masthead" style="background-image: url('./img/boardHeader.jpg')">
	    <div class="container position-relative px-4 px-lg-5">
	        <div class="row gx-4 gx-lg-5 justify-content-center">
	            <div class="col-md-10 col-lg-8 col-xl-7">
	                <div class="site-heading">
	                    <h1>커뮤니티</h1>
	                    <span class="subheading">맛 잘 알 줄서 피플들과의 즐거운 소통!</span>
	                </div>
	            </div>
	        </div>
	    </div>
	</header>
	<div id = "container">
		<!-- ADD BUTTON-->
		<div id = write_btn_wrap>
			<button id = "write_btn" type="button" onclick="checkLogin()" style="cursor:pointer;"><i class="uil uil-pen"></i>글쓰기</button></h4>
        </div>
        <!-- ADD FORM-->
	     <div id="add_form" class="add_form" style= "display:none;">
        	<form action = "postAdd.do" method="post" id="frm">
				<input type="hidden" id ="addWriter" name="addWriter" value="${loginMember.memberId}">
				<input id="title" type="text" placeholder="제목은 22자 내로 입력해주세요" name="addTitle" maxlength="22" required>
				<div id = "add_write_btn">
					<!-- 등록버튼 -->
					<button id="btn_register" class="bottom_btn" type="submit" onclick="checkAdd()">등록</button>
					<!-- 취소버튼 -->
					<button id="btn_previous" type="button" class="bottom_btn" onclick="location.href='postListPaging.do?pageNum=1&postNum=6'">취소</button>
	 			</div>
				<hr style= "margin:0;">
				<textarea id="content" placeholder="바른말 고운말은 줄서 이웃들과의 소통을 한층 더 즐겁게 해줄거에요!" name="addContent" maxlength="2000" required></textarea>
				
	 		</form>
		</div>
		<!-- 게시글 헤드 -->
		<div id = post_area>
			<div id = post_title_area>
				<div id = "title_family_num">글 번호</div>
				<div id = "title_family_title">제목</div>
				<div id = "title_family_nickname">닉네임</div>
				<div id = "title_family_date">날짜</div>
				<div id = "title_family_hits">조회수</div>
			</div>
	        <!-- 게시글목록-->
    		<c:forEach var="boardList" items="${boardList}">
        		<div class="post_list">
					<div class = post_title>
						<!-- 글 제목 -->
						<a href="postDetail.do?boardId=${boardList.boardId}">
							<span class = post_title_boardId>No.${boardList.boardId}</span>
							<span class = post_title_boardTitle>${boardList.title}</span>
						</a>
					</div>
			        <div class="post_title_info">
						<span class = "postNick"><i class="fa-solid fa-pen-nib" style="font-size:10px; margin:0;"></i>${boardList.nickName}</span>
						<span class="postDate"> <i class="fa-solid fa-calendar-days" style="font-size:10px; margin:0;"></i>${boardList.createDate}</span>
						<span class = "postHits"> <i class="fa-regular fa-eye"></i>${boardList.hits}</span>
			    	</div>
				</div>
			</c:forEach>
			<!-- PAGINATION -->
			<div class = "center">
				<div class="pagination">
					<c:if test="${pageInfo.prev}">
						<a href="postListPaging.do?pageNum=${pageInfo.startPage-1}&postNum=${pageInfo.cri.postNum}">◀</a>
					</c:if>
					<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}"><!-- num=페이지 정보 -->
						<a href="postListPaging.do?pageNum=${num}&postNum=${pageInfo.cri.postNum}">${num}</a>
					</c:forEach>
					<c:if test="${pageInfo.next}">
						<a href="postListPaging.do?pageNum=${pageInfo.endPage+1}&postNum=${pageInfo.cri.postNum}">▶</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<!-- NOTICEBOARD_LIST -->
	<!-- <div id="notice_board" style="display:none"></div> -->
	
	<!-- FOOTER-->
  	<div id="f">
	    <div class="container">
	      <div class="row centered">
	        <h2>JULSEO</h2>
	        <h5>맛집 검색, 예약은 줄을서시오</h5>
	        <p class="mt">
	          <a href="#"><i class="ion-social-twitter"></i></a>
	          <a href="#"><i class="ion-social-dribbble"></i></a>
	          <a href="#"><i class="ion-social-instagram"></i></a>
	          <a href="#"><i class="ion-social-facebook"></i></a>
	          <a href="#"><i class="ion-social-pinterest"></i></a>
	          <a href="#"><i class="ion-social-tumblr"></i></a>
        	</p>
	     </div>
      	<div class="row">
	        <div class="col-md-8 col-md-offset-2">
	        </div>
      	</div>
      </div>
      <!--/row-->
    </div>
	<!-- COPYRIGHTS-->
	<div id="copyrights">
		<p>
			&copy; Copyrights <strong>JULSEO</strong>. All Rights Reserved
		</p>
		<div class="credits">
			<!--
			You are NOT allowed to delete the credit link to TemplateMag with free version.
			You can delete the credit link only if you bought the pro version.
			Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/sumolanding-bootstrap-landing-template/
			Licensing information: https://templatemag.com/license/
			-->
			Created with SumoLanding template by <a href="https://templatemag.com/">TemplateMag</a>
      	</div>
	</div>
	  			
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		/* 사이드바 */
 		// 공지사항보드 노출
/*		function show_notice_board() {
			if ($('#notice_board').css('display') == 'none') {
				$('#notice_board').show();
				$('#community_board').hide();
			}
		}
 		//커뮤니티보드 노출
 		function show_community_board() {
			if ($('#community_board').css('display') == 'none') {
				$('#community_board').show();
				$('#notice_board').hide();
		} */
			
		function checkLogin() {
			if ( frm.addWriter.value == "") { //로그인폼으로 이동
				alert("로그인이 필요합니다!")
				window.location.href = "memberLoginForm.do";
	    	  } else { //글쓰기폼으로 이동
	    		  let status = $('#add_form').css('display');
	    		  console.log(status); //콘솔창에 로그를 남기며, 확인했으면 삭제하기
	              if (status == 'none') {
	                  $('#add_form').show();
	                  $('#write_btn').text('닫기');
	              } else {
	                  $('#add_form').hide();
	                  $('#write_btn').text('글쓰기');
	            	}
	        	}
	    }
		
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
	  	    		window.location.href = "postListPaging.do?pageNum=1&postNum=6";
	  	    	  	}
	    	  }
		}
    </script>
</body>
</html>