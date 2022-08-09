<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>팝업</title>
</head>
<style>
  textarea {
    width: 100%;
    height: 6.25em;
    border: 1px solid black;
    border-radius : 20px;
    resize: none;
  }
  #button {
  float : right
  }
  .star-rating {
   display: flex;
   flex-direction: row-reverse;
   font-size: 2.25rem;
   line-height: 2.5rem;
   justify-content: space-around;
   padding: 0 0.2em;
   text-align: center;
   width: 5em;
}

.star-rating input {
   display: none;
}

.star-rating label {
   -webkit-text-fill-color: transparent;
   /* Will override color (regardless of order) */
   -webkit-text-stroke-width: 2.3px;
   -webkit-text-stroke-color: #2b2a29;
   cursor: pointer;
}

.star-rating :checked ~ label {
   -webkit-text-fill-color: orange;
}

.star-rating label:hover, .star-rating label:hover ~ label {
   -webkit-text-fill-color: orange;
}
</style>
<body>
  <div class="container">
    <form id="updatereview" name="form1" class="box" id="updateform" action="updatereview.do" method="post"  onsubmit="return false">
      <h4>리뷰 수정</h4>
      	<p><span>내용변경</span></p>
      	<div class="star-rating space-x-4 mx-auto">
		      <input type="radio" id="5-stars" name="rating" value="5"/>
		      <label for="5-stars" class="star pr-4">★</label>
		      <input type="radio" id="4-stars" name="rating" value="4"/>
		      <label for="4-stars" class="star">★</label>
		      <input type="radio" id="3-stars" name="rating" value="3"/>
		      <label for="3-stars" class="star">★</label>
		      <input type="radio" id="2-stars" name="rating" value="2"/>
		      <label for="2-stars" class="star">★</label>
		      <input type="radio" id="1-star" name="rating" value="1"/>
		      <label for="1-star" class="star">★</label>
   		</div>
        <textarea id="story" name="content" rows="5" cols="33"></textarea>
        <input type="hidden" name="upno" value="${upno }">
        <input type="hidden" name="upstore" value="${upstore }">
        <p id="button">
        <input type="submit" value="수정" class="btn1">
        <input type="button" value="닫 기" onclick="self.close();">
        </p>
      </form>
      </div>
      
     <script type="text/javascript">
	document.getElementById("updatereview").onsubmit=function() {
		let Check = confirm('수정하시겠습니까?');
		if (!Check) {
			return false;
		} else {
			alert('수정완료');
		}
	}
	</script>

</body>
</html>