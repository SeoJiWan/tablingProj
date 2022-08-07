package dev.controller.store;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.domain.Store;

public class updatemanagement implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
//		String memberId = (String)req.getSession().getAttribute("loginId");
//		System.out.println("로그인 멤버 = " + memberId);
		
//		Member loginMember = (Member) req.getSession().getAttribute("loginMember");
//	    String loginMemberId = loginMember.getMemberId();
		
		String loginMemberId = "store2";	
		Store st = storeService.storemanagement(loginMemberId);
		
		System.out.println("member = " + loginMemberId);
		
		req.setAttribute("stores", st);
		
		Utils.forward(req, resp, "/store/storeupdatemanager.tiles");
	}

}
