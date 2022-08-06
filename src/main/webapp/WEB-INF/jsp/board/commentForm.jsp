<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<textarea id = "commentId" name ="commentId" placeholder="가는말이 고와야 오는말이 곱습니다^^"></textarea>
	</div>
	<div class="comment_button">
		<button id="comment_button">댓글달기</button>
	</div>
</div>
		<!-- 글쓰기확인 -->
		<!-- 제목, 내용 널값 확인 및 글 등록 여부 확인 -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$("#comment_button").click(function() {
			if(loginId==null){
				alert("로그인 해주세요!");
				location.href=""
			}
			$.ajax({
				url: "/commentAdd.do",
				
				type:"POST",
				
				data: {
					boardId : '',
					
					content : $("#comment_button").val()
				},
				
				success: function () {
				console.log("보내기 성공"');
				location.reload()
				},	
				}}
			})
		})
		
			
       </script>
</body>
</html>