<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title>Tabling-login</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/member/memberLoginForm.css?after" />
    <!-- Sweet alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
  </head>
  <body>
    <div class="section_login_form">
      <div class="container">
        <div class="row full-height justify-content-center">
          <div class="col-12 text-center align-self-center py-5">
            <div class="section pb-5 pt-5 pt-sm-2 text-center">
              <h6 class="mb-0 pb-3">
                <span>Log In </span><span>Sign Up</span>
              </h6>
              <input
                class="checkbox"
                type="checkbox"
                id="reg-log"
                name="reg-log"
              />
              <label for="reg-log"></label>
              <div class="card-3d-wrap mx-auto">
                <div class="card-3d-wrapper">
                  <div class="card-front">
                    <div class="center-wrap">
                      <div class="section text-center">
                        <h4 class="mb-4 pb-3">Log In</h4>

                        <!-- 로그인 폼 -->
                        <div class="form-group">
                          <input
                            type="email"
                            name="log_id"
                            class="form-style"
                            placeholder="Your Id"
                            id="log_id"
                            autocomplete="off"
                          />
                          <i class="input-icon uil uil-at"></i>
                        </div>
                        <div class="form-group mt-2">
                          <input
                            type="password"
                            name="log_pwd"
                            class="form-style"
                            placeholder="Your Password"
                            id="log_pwd"
                            autocomplete="off"
                          />
                          <i class="input-icon uil uil-lock-alt"></i>
                        </div>
                        <button type="button" class="btn mt-4" id="btn_login">
                          LOGIN
                        </button>

                        <p class="mb-0 mt-4 text-center">
                          <a href="#" class="link" onclick="solveForgotPwd()"
                            >비밀번호를 잊으셨나요?</a
                          >
                        </p>
                        <!-- 비밀번호 찾기 -->
                        <div class="popup_find_pwd" style="display: none">
                          <table class="table_find_pwd">
                            <tr>
                              <td colspan="2"><h4>비밀번호 찾기</h4></td>
                            </tr>
                            <tr>
                              <td class="find_new_pwd_label">ID</td>
                              <td>
                                <input
                                  type="text"
                                  id="id_for_find_pwd"
                                  class="input_modify"
                                />
                              </td>
                            </tr>
                            <tr>
                              <td class="find_new_pwd_label">전화번호</td>
                              <td>
                                <input
                                  type="text"
                                  id="ph_for_find_pwd"
                                  class="input_modify"
                                />
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
                                <button
                                  type="button"
                                  class="btn_popup_sure"
                                  onclick="find_pwd()"
                                >
                                  찾기
                                </button>
                              </td>
                            </tr>
                          </table>
                        </div>
                        <!-- 로그인 폼 끝-->
                      </div>
                    </div>
                  </div>

                  <div class="card-back">
                    <div class="center-wrap">
                      <div class="section text-center">
                        <h4 class="mb-4 pb-3">Sign Up</h4>

                        <!-- 회원가입 폼 -->
                        <form action="memberInsert.do" method="post" id="frm">
                          <!-- 중복체크 -->
                          <div class="form-group">
                            <input
                              type="text"
                              name="reg_id"
                              class="form-style"
                              placeholder="Your Id"
                              id="reg_id"
                              autocomplete="off"
                            />
                            <i class="input-icon uil uil-user"></i>
                            <button
                              type="button"
                              class="btn_id_check"
                              id="btn_id_check"
                              name="btn_id_check"
                              value="unchecked"
                            >
                              중복확인
                            </button>
                            <span id="result" class="span_dupl_chek"></span>
                          </div>
                          <!-- 중복체크 끝 -->

                          <div class="form-group mt-2">
                            <input
                              type="password"
                              name="reg_pwd"
                              class="form-style"
                              placeholder="Your Password"
                              id="reg_pwd"
                              autocomplete="off"
                            />
                            <i class="input-icon uil uil-lock-alt"></i>
                          </div>

                          <div class="form-group mt-2">
                            <input
                              type="password"
                              name="reg_pwd_check"
                              class="form-style"
                              placeholder="Your Password Check"
                              id="reg_pwd_check"
                              autocomplete="off"
                            />
                            <i class="input-icon uil uil-lock-alt"></i>
                          </div>

                          <div class="form-group mt-2">
                            <input
                              type="text"
                              name="reg_phone"
                              class="form-style"
                              placeholder="Your Phone Number"
                              id="reg_phone"
                              autocomplete="off"
                            />
                            <i class="input-icon uil uil-phone"></i>
                          </div>

                          <div class="form-group mt-2">
                            <input
                              type="text"
                              name="reg_nickname"
                              class="form-style"
                              placeholder="Your Nickname"
                              id="reg_nickname"
                              autocomplete="off"
                            />
                            <i class="input-icon uil uil-user-square"></i>
                          </div>

                          <!-- 관리자, 점주, 사용자 드롭다운 메뉴 출력 -->
                          <div class="form-group mt-2">
                            <select class="form-style" name="reg_role">
                              <option value="1">사장님</option>
                              <option value="2">손님</option>
                            </select>
                            <i class="input-icon uil uil-dice-three"></i>
                          </div>
                          <button
                            type="button"
                            class="btn mt-4"
                            onclick="formCheck()"
                          >
                            JOIN
                          </button>
                        </form>
                        <!-- 회원가입 폼 끝 -->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- JQUERY AJAX 사용 -->
    <script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- 비밀번호 찾기 -->
    <script type="text/javascript">
      //팝업창
      function solveForgotPwd() {
        //console.log('비밀번호좀 찾자;;');
        if ($(".popup_find_pwd").css("display") == "none") {
          $(".popup_find_pwd").show();
        }
      }

      // 비밀번호 찾기 팝업 닫기
      function cancle_find_pwd() {
        if ($(".popup_find_pwd").css("display") != "none") {
          $(".popup_find_pwd").hide();
          $("#id_for_find_pwd").val("");
          $("#ph_for_find_pwd").val("");
          $("#find_new_pwd").text("");
        }
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
      });
    </script>
  </body>
</html>
