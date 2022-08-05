package dev.controller.member;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class MemberLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		HttpSession ss = req.getSession();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Member loginMember = memberService.login(id, pwd);
		System.out.println("loginMember = " + loginMember);
		
		if (loginMember == null) {
			System.out.println("로그인 실패");
			resp.getWriter().write("loginFail");
		}
		else {
			System.out.println("로그인 성공");
			ss.setAttribute("loginMember", loginMember);
			
			if (loginMember.getRole() == 0) {
				Utils.forward(req, resp, "owner_main.do");
			}
			
			else if (loginMember.getRole() == 1) {
				Utils.forward(req, resp, "admin_main.do?pageNum=1&postNum=10");
			}
			
			else if (loginMember.getRole() == 2) {
				Utils.forward(req, resp, "main.do");
			}
 		}
	}

}
