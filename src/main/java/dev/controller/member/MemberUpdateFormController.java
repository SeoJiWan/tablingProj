package dev.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Utils;
import dev.controller.Controller;

public class MemberUpdateFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		Utils.forward(req, resp, "/member/memberUpdateForm.tiles");
		
	}
}
