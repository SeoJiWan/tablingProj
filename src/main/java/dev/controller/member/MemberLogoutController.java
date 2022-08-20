package dev.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class MemberLogoutController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		HttpSession ss = req.getSession();
		
		Member loginMember = (Member) ss.getAttribute("loginMember");
		
		if (loginMember.getMemberId() != null) {
			ss.setAttribute("loginMember", null);
			
			
			Utils.forward(req, resp, "main.do");
		}
	}

}
