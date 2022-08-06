package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.service.BoardService;

public class PostListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//변수 boardList 속성값에 글목록 실행 서비스 담기
		BoardService boardService = BoardService.getBoardService();
		req.setAttribute("boardList", boardService.boardList());
		
		//게시판 목록뷰 실행
		Utils.forward(req, resp, "/board/postList.tiles");
	}

}
