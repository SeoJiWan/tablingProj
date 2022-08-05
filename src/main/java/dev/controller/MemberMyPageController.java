package dev.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.domain.Member;

public class MemberMyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		// 내 정보를 보여주는 컨트롤러
//		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
		Utils.forward(req, resp, "member/memberMyPage.tiles");
		
		
		
	}

}
