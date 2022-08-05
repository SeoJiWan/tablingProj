package dev.controller.member;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;

public class MemberCheckIdDuplController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		
		String status = memberService.checkIdDupl(id);
		System.out.println("status = " + status);
		
		try {
			// 컨트롤러는 요청에 대한 결과를 response객체에 담아서 보냄
			resp.getWriter().write(status);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
