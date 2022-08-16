package dev.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Comment;

public class CommentDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/json; charset=utf-8");
		String comment = req.getParameter("commentId");
		int commentId = Integer.parseInt(comment.trim());
		boolean isDeleted = commentService.deleteComment(commentId);

		// {"retCode" : "Success"}
		try {
			if (isDeleted) 
			// {retCode : Success}
			resp.getWriter().print("{\"retCode\" : \"Success\"}");
			else
				resp.getWriter().print("{\"retCode\" : \"Fail\"}");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

