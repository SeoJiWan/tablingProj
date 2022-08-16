<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/reservation/reservationListResult.css" />
  </head>
  <body>
  	<input type="hidden" id="contextPath" value="${pageContext.request.contextPath }">
    

    <div class="container_res_list">
      <h1>나의 예약 목록</h1>
      <table class="table_res_list">
        <tr>
          <th>No.</th>
          <th>점포</th>
          <th>예약날짜</th>
          <th>인원수</th>
          <th>-</th>
        </tr>
        <c:forEach var="reservation" items="${reservationList }" varStatus="status">
          <tr>
            <td>${status.count}</td>
            <td><a href="#">${reservation.storeName }</a></td>
            <td>${reservation.reservationTime }</td>
            <td>${reservation.peopleNum }</td>
            <!-- question -->
            <td>
            	<button type="button" id="${reservation.reservationId }" onclick="res_del(this.id)">예약취소</button>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
	
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<!-- 예약취소 AJAX -->
	<script type="text/javascript">
	let contextPath = document.getElementById("contextPath").value
	// 버튼 onclick 이용하여 this.id 로 해당 버튼의 id 를 파라미터로 사용
	function res_del(res_id) {
  		
		let deleteStatus = function () {
		  if (confirm("정말 취소하시겠습니까?") == true) { //확인
		    return 1;
		  } else { //취소
		    return 0; // function 종료
		  }
		};
		
		if (deleteStatus() == 1) {
			$.ajax({
			    type: "POST",
			
			    url: "reservationDelete.do",
			
			    data:{
					id: res_id,
				}, 
			
			    dataType: "text",
			
			    success: function (data, textStatus, xhr) {
			      if (data == "deleteSuccess") {
			        alert("삭제 완료")
			        window.location.href = "reservationList.do";
			      } else {
			        window.location.href = "main.jsp";
			      }
			    },
			
			    error: function (request, status, error) {
			      alert("code:" + request.status + "\n" + "error:" + error);
			    },
		  	});
		}
	}
  </script>
  </body>
</html>
