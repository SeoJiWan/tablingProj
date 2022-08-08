package dev.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class PostAddFormController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// 요청에서 세션 받아옴
				Member loginMember = (Member) req.getSession().getAttribute("loginMember");

				// 세션에서 로그인 아이디 받기

				// >>TEST
				System.out.println("1." + loginMember);

				// 파라메터에 세션의 memberId담은 속성값 loginMemberId 세팅
				req.setAttribute("loginMember", loginMember);

				Utils.forward(req, resp, "/board/postAddForm.tiles");
			}
		}