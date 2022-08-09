<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="css/detail/detailStyle.css?after">
</head>
<body>
   <!-- 디테일 부분 -->
   <div id="detailImg">
      <c:forEach var="img" items="${storeDetail.storeImgUrl }">
         <img src="img/store_img/${img }" width="331" height="331"></img>
      </c:forEach>
   </div>
   <div id="storeInfo">
      <span><h3 class="storeTitle">가게 상세 정보</h3><span>${store.score }</span></span>
      
      
      
      <!-- <h3>찜하기</h3> -->
      <div>
      
      <c:if test="${not empty loginMember.memberId }">
         <c:if test="${empty likeOrUnlike }">
            <button id="like" value="1" class="like" style="display: none" onclick="hideHeart()"> ❤️ </button>
            <button id="unlike" value="0" class="like" onclick="showHeart()"> 🤍 </button>
         </c:if>
         <c:if test="${not empty likeOrUnlike }">
            <button id="like" value="1" class="like" onclick="hideHeart()"> ❤️ </button>
            <button id="unlike" value="0" class="like" style="display: none" onclick="showHeart()"> 🤍 </button>
         </c:if>
      </c:if>
      <c:if test="${empty loginMember.memberId}">
         <button onclick="loginForm()"><img src="img/unlike.png" width="25" height="25"></button>
      </c:if>
      
      </div>
      <p>가게명 : ${storeDetail.storeName }</p>
      <p>주소 : ${storeDetail.storeAddress }</p>
      <p>전화번호 : ${storeDetail.telephone }</p>
      <p>이용 시간 : ${storeDetail.availableTime }</p>
      <p>음식 종류 : ${storeDetail.foodCategory }</p>
      <p>======= 대표메뉴 =======</p>
      <c:forEach var="menu" items="${storeDetail.representMenu }">
         <p>${menu }</p>
      </c:forEach>
   </div>

   <!-- 예약 부분 -->
   <div id="reservationForm">
      <h3>Reservation</h3>
      <form action="${pageContext.request.contextPath }/reserve.do"
         id="form">
         <div>
            <input id="storeName" type="hidden" name="storeName"
               value="${storeDetail.storeName }">
            <div class="form">
               <label for="peopleNum">How many persons?</label> <select
                  id="peopleNum" name="peopleNum">
                  <option value="none">-</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
               </select>
            </div>
         </div>
         <div id="reservationDate">
            <p>Select a reservation date</p>
            <input type="date" name="date" placeholder="Year-Month-Day">
         </div>
         <div>
            <label for="timeZone">What time to make a reservation?</label> <br>
            <select id="timeZone" name="timeZone">
               <optgroup label="DayTime">
                  <option value="none">-</option>
                  <option value="11:00 ~ 13:00">11:00 ~ 01:00</option>
                  <option value="13:00 ~ 15:00">01:00 ~ 03:00</option>
                  <option value="15:00 ~ 17:00">03:00 ~ 05:00</option>
               </optgroup>
               <optgroup label="DinnerTime">
                  <option value="none">-</option>
                  <option value="17:00 ~ 19:00">17:00 ~ 19:00</option>
                  <option value="19:00 ~ 21:00">19:00 ~ 21:00</option>
                  <option value="21:00 ~ 23:00">21:00 ~ 23:00</option>
               </optgroup>
            </select>
         </div>
         
            <c:if test="${not empty loginMember.memberId }">
            <input type="submit" value="Reserve">
            </c:if>
         
         <c:if test="${empty loginMember.memberId }">
         <input type="button" value="Reserve" onclick="loginForm()">
         </c:if>
      </form>
   </div>

   <!-- 리뷰 부분 -->   
   <form action="${pageContext.request.contextPath }/addReview.do" id="myform" method='POST'>
      <div class="star-rating space-x-4 mx-auto">
         <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" /> 
         <label for="5-stars" class="star pr-4">★</label>
         <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" /> 
         <label for="4-stars" class="star">★</label> 
         <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" />
         <label for="3-stars" class="star">★</label> 
         <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" /> 
         <label for="2-stars" class="star">★</label> 
         <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" /> 
         <label for="1-star" class="star">★</label>
      </div>
   </form>
   <textarea rows="10" cols="20" placeholder="Write Review" name="content"
      id="content"></textarea>
   <input type="hidden" name="storeName" id="storeName"
      value="${storeDetail.storeName }">
      
   <c:if test="${not empty loginMember.memberId }">
   <button type="button" id="btn_review_insert" onclick="review_insert()">Upload</button>
   </c:if>
   
   <c:if test="${empty loginMember.memberId }">
   <button type="button" onclick="loginForm()">Upload</button>
   </c:if>
   
   <h3>============== review ==============</h3>

   <table>
      <tr>
         <th>memberId</th>
         <th>Content</th>
         <th>Taste Score</th>
         <th>Create Date</th>
      </tr>

      <c:forEach var="review" items="${list }">
         <tr>
            <td>${review.memberId }</td>
            <td>${review.content }</td>
            <td>
            <c:forEach var="a" begin="1" end="${review.tasteScore }">
               ⭐
            </c:forEach>
            </td>
            <td>${review.createDate }</td>
               <c:if test="${review.memberId eq loginMember.memberId }">
                  <td> <button value="삭제" onclick='deleteCallback(event)' class=delete>삭제</button> </td>
                  <td> <button value="수정" onclick='updateCallback(event)' class=update>수정</button> </td>
               </c:if>
         </tr>
      </c:forEach>
   </table>

   <script>
   function loginForm() {
      alert('로그인이 필요합니다.');
      window.location.href = "memberLoginForm.do";
   }
   </script>


   <!-- 리뷰쓰기 -->
   <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

   <script type="text/javascript">
   function review_insert() {
      let storeName = $('#storeName').val();
      let content = $('#content').val();
      let rating = $('input[name=rating]').val();
      
      console.log(storeName);
      console.log(content);
      console.log(rating);
      
      if(content != ""){
         $.ajax({
               type: 'POST',
               
               url: 'addReview.do',
               
               data:{
                  storeName : storeName,
                  content : content,
                  rating : rating
               },
               dataType: 'text',
               
               success: function(){
                  alert("리뷰작성완료");
                  window.location.href = "detailPage.do?storeName=" + storeName;
               },
               
               error: function(error){
                  alert("error : "+error)
               },
          });
      } else{
         alert('리뷰를 작성을 완료하십시오.');
      }
   }
   
   </script>
   <!-- 찜하기 Ajax -->
   <script type="text/javascript">
      
      /* 찜 */
         function showHeart() {
            $('#like').show();
            $('#unlike').hide();
            console.log("add zzim");
            $.ajax({
                  type: 'POST',
                  
                  url: 'likeStoreAjax.do',
                  
                  data:{
                     status : "1",
                     storeName : $("#storeName").val(),
                  },
                  dataType: 'text',
                  success: function(){
                     alert("찜하기 완료");
                  },
                  
                  error: function(error){
                     alert("error : "+error)
                  },
             });
         }
         
         /* 찜취소 */
         function hideHeart() {
            $('#like').hide();
            $('#unlike').show();
            
            console.log("delete zzim");
            $.ajax({
                  type: 'POST',
                  
                  url: 'likeStoreAjax.do',
                  
                  data:{
                     status: "0",
                     storeName : $('#storeName').val(),
                  },
                  dataType: 'text',
                  success: function(){
                     alert('찜하기 취소 완료')
                  },
                  error: function(error){
                     alert("error: "+error);
                  },
               });
         }
      </script>

   <!-- 삭제 Ajax -->
   <script>
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
   <script>
      /* let w = window.open("about:blank","_blank"); */
      
      function updateCallback(e){
          console.log(e.target);
         let upno = e.target.parentElement.parentElement.childNodes[1].innerText
         let upstore = e.target.parentElement.parentElement.childNodes[7].innerText
         console.log(upno)
         console.log(upstore)
         
         //창 크기 지정
         var width = 500;
         var height = 500;
         
         //pc화면기준 가운데 정렬
         var left = (window.screen.width / 2) - (width/2);
         var top = (window.screen.height / 4);
         
             //윈도우 속성 지정
         var windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';
         
             //연결하고싶은url
            const url = "updatereviewform.do?upno="+upno+"&upstore="+upstore;

         //등록된 url 및 window 속성 기준으로 팝업창을 연다.
         window.open(url, "popup", windowStatus);      
      }
      </script>
</body>
</html>