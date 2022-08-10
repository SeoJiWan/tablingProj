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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
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
  <link href="SumoLanding/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="SumoLanding/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
</head>
<jsp:include page="/sidebar/boardSidebar.jsp"/>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
    <!-- COMUNITYBOARD_LIST-->
  	<div id="community_board">
    <!-- HEADER-->
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
	  	<form action="postAddForm.do" method="post" id="frm">
		  <input type="hidden" id ="writer" name="writer" value="${loginMember.memberId}">
		</form>
		<div id="container" class="me_menu3">
			<div class="section _section">
				<div class="contents _contents">
					<div class="frst_contents _noti_box" style=""> 
						<div class="time_line _noti_list type_alrm"> 
							<div class="daily_obj _ccast_list_group">
								<!-- ADD BUTTON-->
								<h4 class="ico_time" style="height: 53px; padding-bottom: 0px; padding-left: 0px; margin-bottom: 0px;padding-top: 10px;""><button id = "write_btn" type="button" onclick="checkLogin()"><i class="uil uil-pen"></i>글쓰기</button></h4>
						        <!-- POSTLIST-->
									<ul>
										<li class="_ccast_list_item _ccast_item nlst   " readcheck="true" serviceid="nid" catgroupid="1" catid="999" timekey="1555525715519205549" style="display:inline">
											<div class="tx_box_obj">
						        					<c:forEach var="boardList" items="${boardList}">
														<div class="tx_tooltip">
															<div class="tx_bubble">
																<p class="thumb">
																	<a href="#" title="연결 페이지로 이동(관리자 계정이면 회원 정보로 ?)" class="_ccast_item_url  N=a:amx*x.img" target="_blank" >
																		<img src="${pageContext.request.contextPath }/img/boardListProfile.png" width="40" height="40" alt="프로필이미지">
																		<span class="mask"></span>
																	</a>
																</p>
																<div class="bubble_content">
																    <div class="tx_width">
																		<span class="linkTx">
																			<a href="postDetail.do?boardId=${boardList.boardId}">
																				<strong class="ans_type _ccast_item_url  N=a:amx*b.content"></strong>
																				<!-- TITLE -->
																				<span class="alarm_tx _ccast_item_url  N=a:amx*b.content"><strong>No.${boardList.boardId}. </strong> ${boardList.title}</span>
																				<span class="etc_obj">
																				</span>
																			</a>
																		</span>
																        <div class="from_obj" style=" width: 480px;">
																				<span id = "postDate"><strong>by ${boardList.nickName}</strong></span>
																				<span class="alarm_time">| ${boardList.createDate} </span>
																				<span>| 조회수: ${boardList.hits}</span>
																    	</div>
																    </div>
																</div>							
															</div>
															<button type="button" class="env_bubble _noti_show_config N=a:amx*b.set" data-service="blog" >
																<span class="blind">설정</span>
															</button>
															<!-- <button type="button" class="del_bubble _noti_del N=a:amx*b.del"><span class="blind">삭제</span></button> -->
															<span class="bx_bg">
																<span class="ico_timeDot"></span>
															</span>
														</div>
													</c:forEach>
											</div>
										</li>
									</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
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