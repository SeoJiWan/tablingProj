package dev.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class KakaoLoginController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("UTF-8");
		
		HttpSession ss = req.getSession();
		
		String nickname = req.getParameter("kakao_nickname");
		String img = req.getParameter("kakao_img");
		
		System.out.println("nickname = " + nickname);
		System.out.println("img = " + img);
		
		Member loginMember = new Member();
		loginMember.setMemberId(nickname);
		loginMember.setNickName(nickname);
		loginMember.setPassword("1111");
		loginMember.setProfileImgUrl(img);
		loginMember.setRole(2);
		
		Member member = memberService.findOneMember(nickname);
		if (member == null) {
			memberService.joinMember(loginMember);
			memberService.changeProfile(loginMember);
		}
		
		ss.setAttribute("loginMember", loginMember);
		
		PrintWriter out = resp.getWriter();
		out.println("<script>alert('카카오 로그인 성공!');location.href='main.do';</script>");

		out.flush();
		out.close();
				
		
	}

}
