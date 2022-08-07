<%@page import="java.util.List"%>
<%@page import="dev.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${keyword } 맛집 인기 검색 순위</title>
<link href="${pageContext.request.contextPath }/css/store/storeSearchOutput.css" rel="stylesheet">
<!-- 페이징 css -->
<link href="${pageContext.request.contextPath }/css/store/paging.css" rel="stylesheet">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<!-- header -->
	<c:if test="${empty keyword }">
		<script>alert('검색어를 입력해주세요.')</script>
	</c:if>
	<div id="container">
		<h2>${keyword } 맛집 인기 검색 순위</h2>
		<div id="a">
			<a href="#layer-popup" class="btn-open">필터</a>
		</div>
			<div id="layer-container">
			<div class="layer-popup" id="layer-popup">
    			<div class="modal-dialog">
      				<div class="modal-content">
			<!-- 폼 -->
				<form action="${pageContext.request.contextPath }/storeFilterSearchPaging.do">
					검색 필터<br>
					<!-- 조건 설정 -->
					<input type="hidden" name="job" value="filter">
					<!-- pn, am -->
					<input type="hidden" name="pageNum" value="1">
					<input type="hidden" name="postNum" value="8">
	     				<hr>
	     				지역<br>
	     				대구 중구<br>
	     				<input type="hidden" name="area" value="0">
	     				<input type="checkbox" name="area" value="공평로" id="gong">
	     				<label for="gong">공평로</label>
	     				<input type="checkbox" name="area" value="국채보상로" id="gook">
	     				<label for="gook">국채보상로</label>
	     				<input type="checkbox" name="area" value="남성로" id="nam">
	     				<label for="nam">남성로</label>
	     				<input type="checkbox" name="area" value="달구벌대로" id="dalgu">
	     				<label for="dalgu">달구벌대로</label>
	     				<input type="checkbox" name="area" value="달성로" id="dalseong">
	     				<label for="dalseong">달성로</label>
	     				<input type="checkbox" name="area" value="동덕로" id="dongdeok">
	     				<label for="dongdeok">동덕로</label>
	     				<input type="checkbox" name="area" value="동성로" id="dongseong">
	     				<label for="dongseong">동성로</label>
	     				<input type="checkbox" name="area" value="명덕로" id="myeongdeok">
	     				<label for="myeong">명덕로</label>
	     				<input type="checkbox" name="area" value="명륜로" id="myeongryoon">
	     				<label for="myeongryoon">명륜로</label>
	     				<input type="checkbox" name="area" value="북성로" id="book">
	     				<label for="book">북성로</label>
	     				<input type="checkbox" name="area" value="서성로" id="seo">
	     				<label for="seo">서성로</label>
	     				<input type="checkbox" name="area" value="종로" id="jong">
	     				<label for="myeong">종로</label>
	     				<input type="checkbox" name="area" value="중앙대로" id="joong">
	     				<label for="joong">중앙대로</label>
	     				<input type="checkbox" name="area" value="큰장로" id="keon">
	     				<label for="keon">큰장로</label>
	     				<hr>
	     				음식종류<br>
	     				<input type="hidden" name="food" value="0">
	     				<input type="checkbox" name="food" value="한식" id="ko">
	     				<label for="ko">한식</label>
	     				<input type="checkbox" name="food" value="일식" id="jp">
	     				<label for="jp">일식</label>
	     				<input type="checkbox" name="food" value="중식" id="cn">
	     				<label for="cn">중식</label>
	     				<input type="checkbox" name="food" value="양식" id="eu">
	     				<label for="eu">양식</label>
	     				<input type="checkbox" name="food" value="별식" id="bu">
	     				<label for="bu">분식</label>
	     				<input type="checkbox" name="food" value="디저트" id="de">
	     				<label for="de">디저트</label>
	     				<input type="checkbox" name="food" value="주점" id="al">
	     				<label for="al">주점</label><br>
	     				<input type="button" id="cancle" value="취소">
	       			<input type="submit" value="적용">
	      			</form>
      			</div>
			</div>
			</div>
		</div>
		<div id="list">
			<c:if test="${empty list }">
				<p>'${keyword }'에 대한 결과가 없습니다.</p>
			</c:if>
			<ul>
				<c:forEach var="store" items="${list }">
					<li>
						<!-- 이미지 -->
						<c:forEach var="img" items="${store.storeImgUrl }">
							<a href="${pageContext.request.contextPath }/detailPage.do?storeName=${store.storeName}"><img src="${pageContext.request.contextPath }/img/store_img/${img }" width="340" height="250"></a>
						</c:forEach>
						<!-- 가게명 -->
						<br><h3>${store.storeName }</h3><span> ${store.score }</span>
						<div id="detial">
						<c:set var="add" value="${store.storeAddress }" />
						<c:set var="lo" value="${fn:indexOf(add, '로') }" />
						<!-- 주소 -->
						${fn:substring(add,9,lo+1) } 
						<!-- 업태 -->
						- ${store.foodCategory }
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<!-- 필터 페이징 -->
		<c:choose>
			<c:when test="${job eq 'filter'}">
				<div class="center">
				  	<div class="pagination">
					  	<c:if test="${pageInfo.prev }">
					  		<a href="storeFilterSearchPaging.do?job=${job }&pageNum=${pageInfo.startPage - 1 }&postNum=${pageInfo.cri.postNum}${areaStr }${foodStr }">prev</a>
					  	</c:if>
					  	<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					  		<a href="storeFilterSearchPaging.do?job=${job }&pageNum=${num }&postNum=${pageInfo.cri.postNum}${areaStr }${foodStr }">${num }</a>
					 	</c:forEach>
					 	<c:if test="${pageInfo.next }">
					  		<a href="storeFilterSearchPaging.do?job=${job }&pageNum=${pageInfo.endPage + 1 }&postNum=${pageInfo.cri.postNum}${areaStr }${foodStr }">next</a>
					  	</c:if>
				  	</div>
				</div>
			</c:when>
		
			<c:otherwise>
				<div class="center">
				  	<div class="pagination">
					  	<c:if test="${pageInfo.prev }">
					  		<a href="storeSearchPaging.do?pageNum=${pageInfo.startPage - 1 }&postNum=${pageInfo.cri.postNum}">prev</a>
					  	</c:if>
					  	<c:forEach var="num" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					  		<a href="storeSearchPaging.do?keyword=${keyword }&pageNum=${num }&postNum=${pageInfo.cri.postNum}">${num }</a>
					 	</c:forEach>
					 	<c:if test="${pageInfo.next }">
					  		<a href="storeSearchPaging.do?keyword=${keyword }&pageNum=${pageInfo.endPage + 1 }&postNum=${pageInfo.cri.postNum}">next</a>
					  	</c:if>
				  	</div>
				</div>
				
			</c:otherwise>
		</c:choose>
	</div> 
	<script>
	// 팝업 열기
	$(document).on("click", ".btn-open", function (e){
		var target = $(this).attr("href");
		$(target).addClass("show");
	});

	// 외부영역 클릭 시 팝업 닫기
	$(document).mouseup(function (e){
		var LayerPopup = $(".layer-popup");
		if(LayerPopup.has(e.target).length === 0){
			LayerPopup.removeClass("show");
		}
	});
	
	// 취소 시 팝업 닫기
	$(document).on("click", "#cancle", function (e){
		var LayerPopup = $(".layer-popup");
		LayerPopup.removeClass("show");
	});
	</script>
</body>
</html>