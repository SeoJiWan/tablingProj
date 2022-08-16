package dev.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.service.CommentService;

public class CommentUpdateController implements Controller {
	
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/json; charset=utf-8");
		String comment = req.getParameter("commentId");
		int commentId = Integer.parseInt(comment.trim());	
		String content = req.getParameter("content");
		System.out.println(content);
		
		boolean isDeleted = commentService.updateComment(commentId, content);
		System.out.println(isDeleted);
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
