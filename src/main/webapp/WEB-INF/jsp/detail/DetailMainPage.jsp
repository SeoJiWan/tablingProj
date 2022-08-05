<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 디테일 부분 -->
	<c:forEach var="img" items="${storeDetail.storeImgUrl }">
		<img src="img/store_img/${img }" width="320" height="320"></img>
	</c:forEach>
	<h3>가게 상세 정보</h3>
	<p>가게명 : ${storeDetail.storeName }</p>
	<p>주소 : ${storeDetail.storeAddress }</p>
	<p>전화번호 : ${storeDetail.telephone }</p>
	<p>이용 시간 : ${storeDetail.availableTime }</p>
	<p>카테고리 : ${storeDetail.foodCategory }</p>
	<p>======= 대표메뉴 =======</p>
	<c:forEach var="menu" items="${storeDetail.representMenu }">
		<p>${menu }</p>
	</c:forEach>
	
	<!-- 예약 부분 -->
	<h3>Reservation</h3>
	<div>
	<form action="${pageContext.request.contextPath }/reserve.do">
		<div>
			<label for="peopleNum">How many persons?</label>
			<select id="peopleNum" name="peopleNum">
				<option value="none">-</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
			</select>
		</div>
		<div>
			<p>
			<input type="date" name="date" placeholder="Year-Month-Day">
		</div>
		<div>
			<label for="timeZone">What time to make a reservation?</label>
			<br><select id="timeZone" name="timeZone">
				<optgroup label="DayTime">
				<option value="11:00 ~ 13:00">11:00 ~ 01:00</option>
				<option value="13:00 ~ 15:00">01:00 ~ 03:00</option>
				<option value="15:00 ~ 17:00">03:00 ~ 05:00</option>
				</optgroup>
				<optgroup label="DinnerTime">
				<option value="17:00 ~ 19:00">17:00 ~ 19:00</option>
				<option value="19:00 ~ 21:00">19:00 ~ 21:00</option>
				<option value="21:00 ~ 23:00">21:00 ~ 23:00</option>
				</optgroup>
			</select>
		</div>	
	<input type="submit" value="Reserve">
	</form>
	</div>
	
	<!-- 리뷰 부분 -->
	<form action="${pageContext.request.contextPath }/addReview.do">
		<div>
		<fieldset>
		<span class="text-bold">Good of store</span>
		<input type="radio" name="tasteScore" value="1" id="tasteScore1"><label
			for="rate1">★</label>
		<input type="radio" name="tasteScore" value="2" id="tasteScore2"><label
			for="rate2">★</label>
		<input type="radio" name="tasteScore" value="3" id="tasteScore3"><label
			for="rate3">★</label>
		<input type="radio" name="tasteScore" value="4" id="tasteScore4"><label
			for="rate4">★</label>
		<input type="radio" name="tasteScore" value="1" id="tasteScore5"><label
			for="rate5">★</label>
		</fieldset>
		</div>
		<textarea rows="10" cols="20" placeholder="Write Review" name="content"></textarea>
		<input type="hidden" name="storeName" value="${storeDetail.storeName }">
		<a>${storeDetail.storeName }</a> 
		<input type="submit" value="Upload">
	</form>
	
	<h3>============== review ==============</h3>
		
		
		<table border="1">
			<tr>
				<th>No.</th>
				<th>Id: </th>
				<th>Content: </th>
				<th>Store Name: </th>
				<th>Taste Score: </th>
				<th>Create Date: </th>
			</tr>
			
			<c:forEach var="review" items="${list }">
				<tr>
					<td>${review.reviewId }</td>
					<td>${review.memberId }</td>
					<td id=content><textarea id="content" cols="30" rows="10" readonly>${review.content }</textarea></td>
					<td>${review.storeName }</td>
					<td>${review.tasteScore }</td>
					<td>${review.createDate }</td>
					<td>
					<%-- <c:if test="${review.memberId eq loginMember.memberId }"> --%>
					<button value="삭제" onclick='deleteCallback(event)' class=delete >삭제</button>
					<button value="수정" onclick='updateReview(this.id)'class=update id="${review.reviewId }" >수정</button>
					<%-- </c:if> --%>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 삭제 Ajax -->
		<script >
		function deleteCallback (e) {
			/* event의 call함수 (이벤트 받는 대상) */
			console.log(e.target);
			let delreviewId = e.target.parentElement.parentElement.firstElementChild.innerText;
			console.log(delreviewId);
			if(confirm('리뷰를 삭제하시겠습니까?')){
				/* ajax의 XMLHttpRequest 형식을 사용하겠다 */
				let delAjx = new XMLHttpRequest();
				/* 보내는 방식 : post , 이동 url : deleteReviewAjax.do */
				delAjx.open('POST', 'deleteReviewAjax.do');
				/* header이름 : Content-type , header 값: application/x-www-form-urlencoded */
				delAjx.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				/* tr td의 reviewId를 보낸다 */
				delAjx.send('review_id=' + delreviewId);
				delAjx.onload = function(){
					/* 받아온 값들을 JSON언어로 사용 */
					let result = JSON.parse(delAjx.responseText);
					/* retCode : Success */
					if(result.retCode == 'Success'){
						alert('리뷰가 삭제되었습니다');
						/* 받아온 값의 부모의 부모를 지움 */
						e.target.parentElement.parentElement.remove();
					} else {
						alert('Error');
					}
				}
			} else {
				
			}
		}
		</script>
		
		<!-- jquery ajax사용 -->
		<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
		
		<!-- 수정 Ajax -->
		<script type="text/javascript">

		$('#edit').click(function(){
			let content = $("#content").val();
			let reviewId = $("#reviewId").val();
			console.log("content = " + content);
			
			if(content != ""){
				$.ajax({
					type: 'POST',
					
					url: 'updateReviewAjax.do',
					
					data:{
					 //넘겨줄 파라미터 이름 : value;
						reviewContent: content,
						reviewId: reviewId
					},
					
					dataType: 'text',
					
					success: function(data) {
	                    if (data == 'isUpdate') {
							alert("")
	    					$('#reg_id').focus();
	                    } else {
	                     
	               
	                        $('#reg_pwd').focus();
	                    }  
	                    
		                },
				})
			}
		})
		
		</script>
		<script>
		function updateReview(id){
			$("#content").attr("readonly", false);
		}
 				/* $("#contentbtn").click(function() { */
                    
/*                     $(".edit").click(function(event) {
                   $("#textarea").attr("readonly", false);
                    }); */
                /* }); */
		</script>
</body>
</html>