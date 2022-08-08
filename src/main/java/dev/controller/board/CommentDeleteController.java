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
		String commentId = req.getParameter("commentId");
		
		Comment comment = new Comment();
		comment.setCommentId(Integer.parseInt(commentId));
		
		commentService.deleteComment(comment);
		
		resp.getWriter().write("success");
	}

}
