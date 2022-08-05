package dev.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class MemberInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");

		String id = req.getParameter("reg_id");
		String pwd = req.getParameter("reg_pwd");
		String phoneNum = req.getParameter("reg_phone");
		String nickName = req.getParameter("reg_nickname");
		String role = req.getParameter("reg_role");
		System.out.println("role = " + role);

		Member member = new Member();
		member.setMemberId(id);
		member.setPassword(pwd);
		member.setPhoneNum(phoneNum);
		member.setNickName(nickName);
		member.setRole(Integer.parseInt(role));

		// 중복체크
		String status = memberService.checkIdDupl(id);

		if (status.equals("isNotDupl")) {
			memberService.joinMember(member);
			System.out.println("member = " + member);
			Utils.forward(req, resp, "/member/memberLoginForm.tiles");
		}

		
	}

}
