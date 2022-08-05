package dev.controller.member;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;

public class MemberadminDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json; charset=utf-8");
		String memberId = req.getParameter("memberId");

		boolean isDeleted = memberService.removeMember(memberId);

		// {"retCode" : "Success"}
		try {
			if (isDeleted) 
			resp.getWriter().print("{\"retCode\" : \"Success\"}");
			else
				resp.getWriter().print("{\"retCode\" : \"Fail\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
