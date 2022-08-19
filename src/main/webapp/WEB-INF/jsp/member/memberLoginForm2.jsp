<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberLoginForm2.css?after" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"/>
</head>
    
  <body>
    <!-- modal popup -->
    <!-- 비밀번호 찾기 -->
    <div class="modal_wrap" id="modal_wrap">
      <div class="popup_find_pwd">
        <table class="table_find_pwd">
          <tr>
            <td colspan="2">비밀번호 찾기</td>
          </tr>
          <tr>
            <td class="find_new_pwd_label">아이디</td>
            <td>
              <input type="text" id="id_for_find_pwd" class="input_modify" />
            </td>
          </tr>
          <tr>
            <td class="find_new_pwd_label">전화번호</td>
            <td>
              <input type="text" id="ph_for_find_pwd" class="input_modify" />
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <span id="find_new_pwd"></span>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <button
                type="button"
                class="btn_popup_cancle"
                onclick="cancle_find_pwd()"
              >
                닫기
              </button>
              <button type="button" class="btn_popup_sure" onclick="find_pwd()">
                찾기
              </button>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <div class="container" id="container">
      <!-- 회원가입 폼 -->
      <div class="form-container sign-up-container">
        <form action="memberInsert.do" method="post" id="frm">
          <h1>Create Account</h1>
          <div class="social-container">
            <a href="https://www.facebook.com" class="social" target="_blank"
              ><i class="fab fa-facebook-f"></i
            ></a>
            <a href="http://www.google.com" class="social" target="_blank"
              ><i class="fab fa-google-plus-g"></i
            ></a>
            <a href="https://www.instagram.com/" class="social" target="_blank"
              ><i class="fab fa-linkedin-in"></i
            ></a>
          </div>
          <!-- 아이디 입력 -->
          <span>or use your email for registration</span>
          <div class="dupl_check">
            <input
              type="text"
              name="reg_id"
              id="reg_id"
              autocomplete="off"
              placeholder="아이디"
            />
            <!-- 중복 체크 -->
            <button
              type="button"
              class="btn_id_check"
              id="btn_id_check"
              name="btn_id_check"
              value="unchecked"
            >
              중복체크
            </button>
          </div>
          <span id="result" class="span_dupl_chek"></span>
          <!-- 비밀번호 입력 -->
          <input
            type="password"
            name="reg_pwd"
            id="reg_pwd"
            autocomplete="off"
            placeholder="비밀번호"
          />
          <!-- 비밀번호 확인 입력 -->
          <input
            type="password"
            name="reg_pwd_check"
            id="reg_pwd_check"
            autocomplete="off"
            placeholder="비밀번호 확인"
          />
          <!-- 닉네임 입력 -->
          <input
            type="text"
            name="reg_nickname"
            id="reg_nickname"
            autocomplete="off"
            placeholder="닉네임"
          />
          <!-- 전화번호 입력 -->
          <input
            type="text"
            name="reg_phone"
            id="reg_phone"
            autocomplete="off"
            placeholder="전화번호"
          />
          <!-- 역할 드롭박스 -->
          <div class="select-style">
            <select name="reg_role">
              <option value="1">사장님</option>
              <option value="2">손님</option>
            </select>
          </div>
          <!-- 회원가입 버튼 -->
          <button type="button" onclick="formCheck()">회원가입</button>
        </form>
      </div>
      <!-- 회원가입 폼 끝 -->

      <!-- 로그인 폼 -->
      <div class="form-container sign-in-container">
        <form action="#">
          <h1>Sign in</h1>
          <div class="social-container">
            <a href="https://www.facebook.com" class="social" target="_blank"
              ><i class="fab fa-facebook-f"></i
            ></a>
            <a href="http://www.google.com" class="social" target="_blank"
              ><i class="fab fa-google-plus-g"></i
            ></a>
            <a href="https://www.instagram.com/" class="social" target="_blank"
              ><i class="fab fa-linkedin-in"></i
            ></a>
          </div>
          <span>or use your account</span>
          <input
            type="text"
            name="log_id"
            id="log_id"
            autocomplete="off"
            placeholder="아이디"
          />
          <input
            type="password"
            name="log_pwd"
            id="log_pwd"
            autocomplete="off"
            placeholder="비밀번호"
            onkeyup="enterkey2()"
          />
          <a href="#" class="link" onclick="solveForgotPwd()"
            >비밀번호를 잊으셨나요?</a
          >
          <button type="button" id="btn_login">로그인</button>
        </form>
      </div>
      <!-- 로그인 폼 끝 -->

      <div class="overlay-container">
        <div class="overlay">
          <div class="overlay-panel overlay-left">
            <h1>Welcome Back!</h1>
            <p>
              To keep connected with us please login with your personal info
            </p>
            <button class="ghost" id="signIn">Sign In</button>
          </div>
          <div class="overlay-panel overlay-right">
            <h1>Hello, Friend!</h1>
            <p>Enter your personal details and start journey with us</p>
            <button class="ghost" id="signUp">Sign Up</button>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
      const signUpButton = document.getElementById("signUp");
      const signInButton = document.getElementById("signIn");
      const container = document.getElementById("container");

      signUpButton.addEventListener("click", () => {
        container.classList.add("right-panel-active");
      });

      signInButton.addEventListener("click", () => {
        container.classList.remove("right-panel-active");
      });
    </script>

    <!-- JQUERY AJAX 사용 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- 비밀번호 찾기 -->
    <script type="text/javascript">
      let myModal = document.getElementById("modal_wrap");
      //팝업창
      function solveForgotPwd() {
        //console.log('비밀번호좀 찾자;;');
        myModal.style.display = "block";
        $("#id_for_find_pwd").focus();
      }

      // 비밀번호 찾기 팝업 닫기
      function cancle_find_pwd() {
        myModal.style.display = "none";
      }

      // 비밀번호 찾기
      function find_pwd() {
        let id = $("#id_for_find_pwd").val();
        let ph = $("#ph_for_find_pwd").val();
        console.log(id);
        console.log(ph);

        if (id != "" || ph != "") {
          $.ajax({
            type: "post",

            url: "memberFindPwd.do",

            data: {
              id: id,
              ph: ph,
            },

            datatype: "text",

            success: function (data) {
              if (data != "") {
                $("#find_new_pwd").text("새로운 비밀번호 : " + data);
              } else {
                $("#find_new_pwd").text("해당하는 유저정보가 없습니다");
              }
            },
          });
        } else {
          alert("정보를 입력하세요");
        }
      }
    </script>

    <!-- 중복체크 AJAX  -->
    <script type="text/javascript">
      $(function () {
        $("#reg_id").change(function () {
          $("#btn_id_check").val("unChecked");
        });

        $("#btn_id_check").click(function () {
          let regId = $("#reg_id").val();
          console.log("reg_id = " + regId);

          if (regId != "") {
            // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
            $.ajax({
              type: "post",
              // http://localhost:8081/tablingProj/jsp/member/memberLoginForm.jsp
              // data 를 넘겨줄 url 지정
              url: "memberCheckIdDupl.do",
              // 위 url 로 넘길 데이터 -> req.getParameter("id") 로 받을 수 있음
              data: {
                id: regId,
              },
              dataType: "text",
              // controller 에서 resp.getWriter().write(status); 를 사용하여 'status' data 로 받음
              // 데이터 교환 성공 시 수행 로직
              success: function (data) {
                if (data == "isDupl") {
                  $("#result").text("이미 사용중인 아이디입니다.");
                  $("#reg_id").focus();
                } else {
                  $("#result").text("사용 가능한 아이디입니다.");
                  $("#btn_id_check").val("checked");
                  $("#reg_pwd").focus();
                }
              },

              // 에러 발생 시 수행 로직
              error: function (error) {
                alert("error : " + error);
              },
            });
          } else {
            alert("아이디를 입력하세요.");
            //Swal.fire("아이디를 입력하세요", "", "warning");
          }
        });
      });
    </script>

    <!-- 회원가입 AJAX -->
    <script type="text/javascript">
      function formCheck() {
        if (frm.reg_id.value == "") {
          alert("아이디를 입력하세요.");
          //Swal.fire("", "아이디를 입력하세요", "warning");
          frm.reg_id.focus();
          return false;
        }

        if (frm.btn_id_check.value == "unChecked") {
          alert("아이디 중복체크를 하세요.");
          //Swal.fire("", "아이디 중복확인이 필요합니다", "warning");
          return false;
        }

        if (frm.reg_pwd.value == "") {
          alert("비밀번호를 입력하세요.");
          //Swal.fire("", "비밀번호를 입력하세요", "warning");
          frm.reg_pwd.focus();
          return false;
        }

        console.log("reg check : " + reg_pwd_check.value);
        console.log("reg : " + reg_pwd.value);
        if (frm.reg_pwd.value != frm.reg_pwd_check.value) {
          alert("비밀번호를 확인하세요.");
          //Swal.fire("", "비밀번호를 확인하세요", "warning");
          $("#reg_pwd_check").val("");
          frm.reg_pwd_check.focus();
          return false;
        }

        alert("회원가입 완료!");
        frm.submit();
        // 		Swal.fire("회원가입 성공!", "", "success")
        // 		.then(function() {
        // 			frm.submit();
        // 		});
      }
    </script>

	<!-- 엔터 입력시 로그인 -->
	<script type="text/javascript">
	function enterkey2() {
		if (window.event.keyCode == 13) {
			console.log("r1");

	        $.ajax({
	          type: "POST",

	          url: "memberLogin.do",

	          data: {
	            id: $("#log_id").val(),
	            pwd: $("#log_pwd").val(),
	          },

	          dataType: "text",

	          success: function (data, textStatus, xhr) {
	            console.log("r2");
	            if (data == "loginFail") {
	              alert("아이디, 비밀번호를 확인하세요.");
	              $("#log_id").val("");
	              $("#log_pwd").val("");
	              $("#log_id").focus();
	            } else {
	              //alert("로그인 성공!");
	              //window.location.href = "mainDecision.do";

	              Swal.fire(
	                "로그인 성공!",
	                "메인페이지로 이동합니다",
	                "success"
	              ).then(function () {
	                window.location.href = "mainDecision.do";
	              });

	              //window.location.href = "admin_main.do?pageNum=1&postNum=10";
	              //window.location.href = "main.do";
	              //window.location.href = "owner_main.do";
	            }
	            console.log(data);
	          },

	          error: function (request, status, error) {
	            alert("code:" + request.status + "\n" + "error:" + error);
	          },
	        });
		}
	}
	</script>
	
    <!-- 로그인 AJAX -->
    <script type="text/javascript">
      $("#btn_login").click(function () {
        console.log("r1");

        $.ajax({
          type: "POST",

          url: "memberLogin.do",

          data: {
            id: $("#log_id").val(),
            pwd: $("#log_pwd").val(),
          },

          dataType: "text",

          success: function (data, textStatus, xhr) {
            console.log("r2");
            if (data == "loginFail") {
              alert("아이디, 비밀번호를 확인하세요.");
              $("#log_id").val("");
              $("#log_pwd").val("");
              $("#log_id").focus();
            } else {
              alert("로그인 성공!");
              window.location.href = "mainDecision.do";

//               Swal.fire(
//                 "로그인 성공!",
//                 "메인페이지로 이동합니다",
//                 "success"
//               ).then(function () {
//                 window.location.href = "mainDecision.do";
//               });

              //window.location.href = "admin_main.do?pageNum=1&postNum=10";
              //window.location.href = "main.do";
              //window.location.href = "owner_main.do";
            }
            console.log(data);
          },

          error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "error:" + error);
          },
        });
      });
    </script>
  </body>
</html>
