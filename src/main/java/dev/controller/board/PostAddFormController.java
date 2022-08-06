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
		/*
		// 요청에서 세션 받아옴
		HttpSession ss = req.getSession();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Member user = memberService.login(id,  pwd);
		System.out.println("userInfo = " + user);
		
		
		// 파라메터 변수명 memberId에 세션의 memberId담은 속성값 loginId를 세팅
		String loginId = null;
		loginId = (String) ss.getAttribute("memberId");
		req.setAttribute("memberId", loginId);
		
		//>>TEST
		System.out.println("1."+loginId);
		
		
		// --------ss의 user가 null일 경우 로그인폼으로 이동
		//문제점>>! 로그인을 해도 null값을 받아와 로그인페이지로 이동됨ㅠ
		if (user == null) {
			//>>TEST
			System.out.println("2."+user);
			
			resp.setContentType("text/html;charset=utf-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인이 필요합니다!')");
			writer.println("</script>");
			
			Utils.forward(req, resp, "memberLoginForm.do");
		}
		// --------ss의 user일 경우 글등록폼으로 이동
			else {
			//>>TEST
			System.out.println("3."+user);
			ss.setAttribute("user", user);
		 */
			Utils.forward(req, resp, "/board/postAddForm.tiles");
		}
	}
//}
