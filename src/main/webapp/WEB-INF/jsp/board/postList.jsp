<%@page import="dev.domain.Board"%>
<%@page import="dev.repository.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/boardPaging.css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<div style="text-align:center;"><h2>커뮤니티</h2></div>

  <form action="postAddForm.do" method="post" id="frm">
  	  <input type="hidden" id ="memberId" name="memberId" value="${boardList.memberId}">
	  <button type="button" onclick="checkLogin()">글쓰기</button> <!-- location.href='postAddForm.do' -->
	  </form>
	  <table>
			<thead>
				<tr>
					<th>글 번호</th><th>닉네임</th><th>제목</th><th>작성일자</th><th>조회수</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="boardList" items="${boardList}">
					<tr>
						<td>${boardList.boardId}</td>
						<td id="nickName">${boardList.nickName}</td>
						<td><a href = "postDetail.do?boardId=${boardList.boardId}">${boardList.title}</a></td>
						<td>${boardList.createDate}</td>
						<td>${boardList.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<div class = "center">
		<div class="pagination">
			<c:if test="${pageInfo.prev}">
			<a href="postListPaging.do?pageNum=${pageInfo.startPage-1}&postNum=${pageInfo.cri.postNum}">◀</a>
			</c:if>
			<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}"><!-- 여기서 num:페이지 정보 -->
				<a href="postListPaging.do?pageNum=${num}&postNum=${pageInfo.cri.postNum}">${num}</a>
			</c:forEach>
			<c:if test="${pageInfo.next}">
			<a href="postListPaging.do?pageNum=${pageInfo.endPage+1}&postNum=${pageInfo.cri.postNum}">▶</a>
			<%-- <a href="postListPaging.do?pageNum=${pageInfo.lastPage}&postNum=${pageInfo.cri.postNum}">맨끝</a> --%>
			</c:if>
		</div>
	</div>
</body>
<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function checkLogin() {
		if (frm.memberId.value == "") {  //memberId없을 시
			 alert("로그인 해주세요! ");
			 window.location.href = "memberLoginForm.do"; //로그인 폼으로 이동
			 return;
    	  }  else {  //memberId있으면 글쓰기 폼으로 이동
    		  frm.submit();
  	    	  	}
			}
	}
</script>
</html>