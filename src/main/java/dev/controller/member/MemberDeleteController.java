package dev.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;

public class MemberDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// -------------- delete 조건문 추가 ------------------- //
		// --> .do 실행 시 실제 데이터 삭제 안됐는데 삭제 창 띄우느 것 방지
		String id = req.getParameter("id");
		System.out.println("deleteId = " + id);
		
		memberService.deleteMember(id);
		
		System.out.println("deleteMember = " + memberService.findOneMember(id));
		
		// 로그아웃 처리
		HttpSession ss = req.getSession();
		ss.setAttribute("loginMember", null);
		
		resp.getWriter().write("deleteSuccess");
	}

}
