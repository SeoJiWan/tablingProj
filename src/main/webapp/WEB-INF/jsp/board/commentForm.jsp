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
		<textarea id = "commentId" name ="commentId" placeholder="���¸��� ��;� ���¸��� �����ϴ�^^"></textarea>
	</div>
	<div class="comment_button">
		<button id="comment_button">��۴ޱ�</button>
	</div>
</div>
		<!-- �۾���Ȯ�� -->
		<!-- ����, ���� �ΰ� Ȯ�� �� �� ��� ���� Ȯ�� -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$("#comment_button").click(function() {
			if(loginId==null){
				alert("�α��� ���ּ���!");
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
				console.log("������ ����"');
				location.reload()
				},	
				}}
			})
		})
		
			
       </script>
</body>
</html>