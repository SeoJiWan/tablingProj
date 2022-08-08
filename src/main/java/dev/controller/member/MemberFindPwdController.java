package dev.controller.member;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Member;

public class MemberFindPwdController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 랜덤 문자열 생성
		Random rd = new Random();
		StringBuffer sb = new StringBuffer(5);
		
		String id = req.getParameter("id");
		String ph = req.getParameter("ph");
		
		Member member = memberService.findOneMember(id);
		
		// 해당하는 유저가 있으면
		if (member != null && member.getPhoneNum().equals(ph)) {
			// 새로운 비밀번호 생성하여 전달
			for (int i = 0; i < 5; i++) {
				sb.append((char)((int)(rd.nextInt(26))+97));
			}
			
			String new_pwd = sb.toString();
			System.out.println("new_pwd = " + new_pwd);
			member.setPassword(new_pwd);
			memberService.modifyMember(member);
			resp.getWriter().write(new_pwd);
		}
		else {
			resp.getWriter().write("");
		}
	}

}
