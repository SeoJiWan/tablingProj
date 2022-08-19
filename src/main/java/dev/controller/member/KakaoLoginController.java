package dev.controller.member;

import java.io.IOException;

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
		
		Utils.forward(req, resp, "main.do");
				
		
	}

}
