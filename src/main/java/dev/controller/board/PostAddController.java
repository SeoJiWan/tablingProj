package dev.controller.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.service.BoardService;

//게시글 등록 컨트롤러
public class PostAddController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String writer = req.getParameter("writer");
		String title = req.getParameter("title");
		String cont = req.getParameter("content");

		System.out.println("등록할 글제목: " + title);
		System.out.println("등록할 내용: " + cont);

		Board board = new Board();
		board.setMemberId(writer);
		board.setTitle(title);
		board.setContent(cont);

		// 글 추가 서비스 실행
		BoardService boardService = BoardService.getBoardService();
		boardService.addPost(board);
		req.setAttribute("boardDetail", board);

		//>>TEST
		System.out.println(board.getBoardId());
		
		// 글 등록 후 디테일로 들어가도록
		Utils.forward(req, resp, "postDetail.do");
	}
}
