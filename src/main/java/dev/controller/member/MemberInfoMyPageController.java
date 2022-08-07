package dev.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.controller.Controller;
import dev.controller.Utils;

public class MemberInfoMyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 내 정보를 보여주는 컨트롤러
		Utils.forward(req, resp, "interestedStoreList.do");
	}

}
