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
		* 	문제점>>! 로그인을 해도 null값을 받아와 로그인페이지로 이동됨ㅠ
		*  			   -> 수정ㅇ. 테스트 필요
		*/
		
		
		// 요청에서 세션 받아옴
		 Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		 
		//세션에서 로그인 아이디 받기
		
		//>>TEST
		System.out.println("1."+loginMember);
		
		// --------loginMemberId가 null -> 로그인폼
		if (loginMember == null) {
			
			resp.setContentType("text/html;charset=utf-8");
			resp.setCharacterEncoding("UTF-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인이 필요합니다!')");
			writer.println("</script>");
			
			Utils.forward(req, resp, "memberLoginForm.do");
		}
		
		// -------loginMemberId가 존재 -> 글등록폼
			else {
			
			// 파라메터에 세션의 memberId담은 속성값 loginMemberId 세팅
			req.setAttribute("loginMember", loginMember);
			
			Utils.forward(req, resp, "/board/postAddForm.tiles");
		}
	}
}
