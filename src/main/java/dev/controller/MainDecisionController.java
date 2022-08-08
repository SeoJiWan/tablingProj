package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.domain.Member;

public class MainDecisionController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		
		if (loginMember.getRole() == 0) {
			Utils.forward(req, resp, "admin_main.do?pageNum=1&postNum=10");
		}
		
		else if (loginMember.getRole() == 1) {
			Utils.forward(req, resp, "owner_main.do");
		}
		
		else if (loginMember.getRole() == 2) {
			Utils.forward(req, resp, "main.do");
		} 
	}

}
