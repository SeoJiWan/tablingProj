package dev.controller.member;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.domain.Member;

public class MemberUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 수정 폼에서 멤버 정보 받아오기
		Member loginMember = (Member) req.getSession().getAttribute("loginMember");

		if (req.getParameter("nn") != null) {
			if (!req.getParameter("nn").equals("")) {
				loginMember.setNickName(req.getParameter("nn"));
				memberService.modifyMember(loginMember);
				resp.getWriter().write("modifySuccess");
			}
		}

		if (req.getParameter("ph") != null) {
			if (!req.getParameter("ph").equals("")) {
				loginMember.setPhoneNum(req.getParameter("ph"));
				memberService.modifyMember(loginMember);
				resp.getWriter().write("modifySuccess");
			}
		}

		if (req.getParameter("pwd") != null) {
			if (!req.getParameter("pwd").equals("")) {
				loginMember.setPassword(req.getParameter("pwd"));
				System.out.println("입력 비밀번호 == " + req.getParameter("pwd"));
				System.out.println("loginMember.getPassword() = " + loginMember.getPassword());
				memberService.modifyMember(loginMember);
				System.out.println("loginMember.getPassword() = " + loginMember.getPassword());
				resp.getWriter().write("modifySuccess");
			}
		}
	}
}
