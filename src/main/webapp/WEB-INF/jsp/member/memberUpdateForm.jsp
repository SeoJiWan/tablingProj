<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberUpdateForm.css" />
  </head>
  <body>

    <div class="container_mypage">
      <h1>회원수정</h1>
        <table class="table_mypage">
          <tr>
            <td>아이디</td>
            <td>
              <input type="text" id="update_id" value="${member.memberId }" readonly="readonly"
              />
            </td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td>
              <input type="password" id="update_pwd" value="${member.password }" />
            </td>
          </tr>
          <tr>
            <td>닉네임</td>
            <td>
	            <input type="text" id="update_nickname" value="${member.nickName }"/>
            </td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td>
              <input type="text" id="update_phone_num" value="${member.phoneNum }" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
            	<input type="button" id="btn_update" value="수정" />
            	<input type="button" id="btn_delete" value="회원탈퇴" />
            </td>
          </tr>
        </table>
    </div>
    
    <!-- jquery ajax 사용 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <!-- 회원수정 AJAX -->
    <script type="text/javascript">
    $("#btn_update").click(function () {
    	
    	let deleteStatus = function () {
    	  if (confirm("정말 수정하시겠습니까?") == true) { //확인
    	    return 1;
    	  } else { //취소
    	    return 0;
    	  }
    	};
    	
    	if (deleteStatus() == 1) {
    		$.ajax({
    		    type: "POST",
    		
    		    url: "memberUpdate.do",
    		
    		    data:{
    				id: $('#update_id').val(),
    				pwd: $('#update_pwd').val(),
    				nn: $('#update_nickname').val(),
    				ph: $('#update_phone_num').val(),
    			}, 
    		
    		    dataType: "text",
    		
    		    success: function (data, textStatus, xhr) {
    		      if (data == "modifySuccess") {
    		        alert("수정 완료")
    		        window.location.href = "main.do";
    		      } else {
    		        window.location.href = "main.do";
    		      }
    		    },
    		
    		    error: function (request, status, error) {
    		      alert("code:" + request.status + "\n" + "error:" + error);
    		    },
    	  	});
    	}
    });
    </script>
    
    <!-- 회원탈퇴 AJAX -->
    <script type="text/javascript">
    $("#btn_delete").click(function () {
    	
    	let deleteStatus = function () {
    	  if (confirm("정말 탈퇴하시겠습니까?") == true) { //확인
    	    return 1;
    	  } else { //취소
    	    return 0;
    	  }
    	};
    	
    	if (deleteStatus() == 1) {
    		$.ajax({
    		    type: "POST",
    		
    		    url: "memberDelete.do",
    		
    		    data:{
    				id: $('#update_id').val(),
    			}, 
    		
    		    dataType: "text",
    		
    		    success: function (data, textStatus, xhr) {
    		      if (data == "deleteSuccess") {
    		        alert("탈퇴 완료")
    		        window.location.href = "main.do";
    		      } else {
    		        window.location.href = "main.do";
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
