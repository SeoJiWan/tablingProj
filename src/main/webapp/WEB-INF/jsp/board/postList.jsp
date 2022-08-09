<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>커뮤니티 글목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/basic.css" /> --%>
<!-- Favicons -->
<link href="${pageContext.request.contextPath }/img/favicon.png" rel="icon">
<link href="${pageContext.request.contextPath }/img/apple-touch-icon.png" rel="apple-touch-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/board/boardList.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('./img/header.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>커뮤니티</h1>
                            <span class="subheading">Communication With ZULUP People !</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
	  <!-- MAIN POST CONTENT-->
  	  <form action="postAddForm.do" method="post" id="frm">
	  <input type="hidden" id ="writer" name="writer" value="${loginMember.memberId}">
	  </form>
	  <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                <!-- Add button-->
                <button type="button" class="btn btn-primary"
				  style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="checkLogin()">
				  ✏ 글쓰기
				</button>
                <!-- <button type="button" ></button> -->
                	<!-- Post preview-->
                	<c:forEach var="boardList" items="${boardList}">
                    <div class="post-preview"><!-- <h5 class="post-title"></h5> -->
                        <a href="postDetail.do?boardId=${boardList.boardId}">
                           ${boardList.title}
                        </a>
                       	<p class="post-meta">
                       		<small>
	                          	 ${boardList.boardId} 작성자 : <a href="#">${boardList.nickName}</a> 작성일 : ${boardList.createDate} 조회수 : ${boardList.hits}
                        	</small>
                        </p>
                    </div>
                    <hr class="my-4" />
                    </c:forEach>
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
            </div>
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
		function checkLogin() {
			if ( frm.writer.value == "") { //로그인폼으로 이동
				alert("로그인이 필요합니다!")
				window.location.href = "memberLoginForm.do";
	    	  } else { //글쓰기폼으로 이동
				frm.submit();
	    	  }
		}
    </script>
</body>
</html>