package dev.controller.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class updatemanagement implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String loginId = (String) req.getSession().getAttribute("loginId");

		Member member = memberService.findOneMember(loginId);
		
		System.out.println("member = " + member);
		
		req.setAttribute("member", member);
		
		Utils.forward(req, resp, "/store/storeupdatemanager.tiles");
	}

}
