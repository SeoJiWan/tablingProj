<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>팝업</title>
</head>
<link rel="stylesheet" href="css/detail/popup.css?after">
<body>
  <div class="container">
    <form id="updatereview" name="form1" class="box" id="updateform" action="updatereview.do" method="post"  onsubmit="return false">
      <span id="updateContent">수정 할 내용</span>
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
        <input type="submit" value="수정 완료" class="btn1">
        <input type="button" value="닫기" onclick="self.close();">
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