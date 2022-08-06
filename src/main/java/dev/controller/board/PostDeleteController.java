package dev.controller.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Board;

public class PostDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String boardId = req.getParameter("boardId");
		
		Board board = new Board();
		board.setBoardId(Integer.parseInt(boardId));
		
		boardService.deletePost(board);
		
		resp.getWriter().write("success");
	}
}