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
</style>
<body>
  <div class="container">
    <form id="updatereview" name="form1" class="box" id="updateform" action="updatereview.do" method="post"  onsubmit="return false">
      <h4>리뷰 수정</h4>
      	<p><span>내용변경</span></p>
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