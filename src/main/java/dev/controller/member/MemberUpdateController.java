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
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String nickName = req.getParameter("nn");
		String phoneNum = req.getParameter("ph");
		
		
		Member member = new Member();
		member.setMemberId(id);
		member.setPassword(pwd);
		member.setNickName(nickName);
		member.setPhoneNum(phoneNum);
		
		memberService.modifyMember(member);
		
		resp.getWriter().write("modifySuccess");



		
		
	}

}
