<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>줄을서시오 : 맛집 검색 및 예약</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="SumoLanding/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="SumoLanding/lib/ionicons/css/ionicons.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/main.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: SumoLanding
    Template URL: https://templatemag.com/sumolanding-bootstrap-landing-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>

  <div id="h">
    <div class="logo">줄을서시오</div>
    <div class="social hidden-xs">
      <a href="#"><i class="ion-social-twitter"></i></a>
      <a href="#"><i class="ion-social-instagram"></i></a>
      <a href="#"><i class="ion-social-facebook"></i></a>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2 centered">
          <h1>믿을 수 있는 평점, 식당 간편 예약!<br/>줄을서시오</h1>
          <div class="mtb">
            <form role="form" action="${pageContext.request.contextPath }/storeSearchPaging.do" method="post">
              <input type="text" id="window" name="keyword" class="subscribe-input" placeholder="지역, 식당 또는 음식">
              <input type="hidden" name="pageNum" value="1">
              <input type="hidden" name="postNum" value="8">
              <button class='btn btn-conf btn-green' type="submit">검색</button>
            </form>
          </div>
          <!--/mt-->
        </div>
      </div>
      <!--/row-->
    </div>
    <!--/container-->
  </div>
  <!-- /H -->

  <div class="container ptb">
    <div class="row">
      <div class="col-md-6">
        <h3>추천 맛집 리스트</h3>
        <br>
        <ul class="ul-store-list">
          <c:forEach var="store" items="${list }">
            <li>
              <!-- 이미지 -->
              <c:forEach var="img" items="${store.storeImgUrl }">
               <a href="${pageContext.request.contextPath }/detailPage.do?storeName=${store.storeName}"><img src="${pageContext.request.contextPath }/img/store_img/${img }" width="400" height="300"></a>
              </c:forEach>
              <!-- 가게 정보 -->
              <h4>${store.storeName } ${store.score }</h4>
              <c:set var="add" value="${store.storeAddress }" />
              <c:set var="lo" value="${fn:indexOf(add, '로') }" />
              <!-- 주소 -->
              <h5>${fn:substring(add,9,lo+1) } 
              <!-- 업태 -->
              - ${store.foodCategory }</h5>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <!--/row-->
  </div>
  <!--/container-->
  <div id="f">
    <div class="container">
      <div class="row centered">
        <h2>JULSEO</h2>
        <h5>맛집 검색, 예약은 줄을서시오</h5>

        <p class="mt">
          <a href="#"><i class="ion-social-twitter"></i></a>
          <a href="#"><i class="ion-social-dribbble"></i></a>
          <a href="#"><i class="ion-social-instagram"></i></a>
          <a href="#"><i class="ion-social-facebook"></i></a>
          <a href="#"><i class="ion-social-pinterest"></i></a>
          <a href="#"><i class="ion-social-tumblr"></i></a>
        </p>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
        </div>
      </div>
      <!--/row-->
    </div>
    <!--/container-->
  </div>
  <!--/F-->

  <div id="copyrights">
    <div class="container">
      <p>
        &copy; Copyrights <strong>JULSEO</strong>. All Rights Reserved
      </p>
      <div class="credits">
        <!--
          You are NOT allowed to delete the credit link to TemplateMag with free version.
          You can delete the credit link only if you bought the pro version.
          Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/sumolanding-bootstrap-landing-template/
          Licensing information: https://templatemag.com/license/
        -->
        Created with SumoLanding template by <a href="https://templatemag.com/">TemplateMag</a>
      </div>
    </div>
  </div>
  <!-- / copyrights -->

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/php-mail-form/validate.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>

</body>
</html>
