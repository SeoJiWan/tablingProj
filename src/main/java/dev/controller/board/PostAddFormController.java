package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;


public class PostAddFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		// 글등록폼으로 이동(addPostForm.jsp)
		Utils.forward(req, resp, "/board/postAddForm.tiles");
	}

}
