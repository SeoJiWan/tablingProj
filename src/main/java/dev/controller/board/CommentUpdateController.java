package dev.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Comment;

public class CommentUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		// 값 받아올 속성
		String boardId = req.getParameter("boardId");
		int commentId = Integer.parseInt(req.getParameter("commentId"));
		String cmtWriter = req.getParameter("cmtWriter");
		String cmtContent = req.getParameter("cmtContent");

		// 값 세팅할 속성
		Comment comment = new Comment();
		comment.setBoardId(Integer.parseInt(boardId));
		comment.setCommentId(commentId);
		comment.setMemberId(cmtWriter);
		comment.setContent(cmtContent);

		// DB데이터 업데이트
		commentService.updateComment(comment);

		// 요청에 comment 속성 값 담을 변수 지정
		req.setAttribute("comment", comment);

		resp.getWriter().write("success");
	}

}
