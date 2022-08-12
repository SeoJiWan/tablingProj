<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Curve Outside in Active Tab</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/sidebar.css" />
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
  </head>
  <body>
    <div class="navigation">
      <ul>
        <li class="list active">
          <a href="#" onclick="show_memberInfo()">
            <span class="icon">
              <i class="input-icon uil uil-user-exclamation"></i>
            </span>
            <span class="title">정보수정</span>
          </a>
        </li>
        <li class="list">
          <a href="#" onclick="show_zzim_list()">
            <span class="icon">
              <i class="input-icon uil uil-store"></i>
            </span>
            <span class="title">찜한가게</span>
          </a>
        </li>
        <li class="list">
          <a href="#" onclick="show_reservationlist()">
            <span class="icon">
              <i class="input-icon uil uil-file-check"></i>
            </span>
            <span class="title">예약확인</span>
          </a>
        </li>
        <li class="list">
          <a href="#" onclick="show_myreviews()">
            <span class="icon">
              <i class="input-icon uil uil-list-ul"></i>
            </span>
            <span class="title">내가 쓴 리뷰</span>
          </a>
        </li>
      </ul>
    </div>
  </body>
  
  <script type="text/javascript">
  const list = document.querySelectorAll(".list");
  function activeLink() {
    list.forEach((item) => item.classList.remove("active"));
    this.classList.add("active");
  }
  list.forEach((item) => item.addEventListener("click", activeLink));
  </script>
</html>
