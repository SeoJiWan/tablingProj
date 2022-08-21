<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/interested_store/interested_storeList.css">
</head>
<jsp:include page="/sidebar/reservationsidebar2.jsp"/>
<a href="#"><img src="${pageContext.request.contextPath }/img/newLogo.png" alt="logo" class="logo_img" /></a>
<body>
	 <!-- 마이페이지 - 찜목록 -->
    <div id="container_mypage_zzims">
      <div class="ul_zzim_list">
        <h1>내 점포 목록</h1>
        <h3>점포정보 수정 시 이미지를 클릭하세요 :)</h3>
        <ul>
          <c:forEach var="store" items="${stores }">
            <li>
              <div>
                <a
                  href="${pageContext.request.contextPath }/ownerupdate.do?storeName=${store.storeName}"
                >
                  <img
                    src="${pageContext.request.contextPath }/img/store_img/${store.storeName }1.jpg"
                    alt="store"
                  />
                </a>
                <h3>${store.storeName }</h3>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
</body>
</html>