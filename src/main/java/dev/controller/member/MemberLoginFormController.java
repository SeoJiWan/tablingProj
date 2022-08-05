package dev.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;

public class MemberLoginFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		if (req.getSession().getAttribute("logidId") == null) {
			Utils.forward(req, resp, "member/memberLoginForm.tiles");
		}
	}

}
