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

		String loginId = "user1";
		HttpSession testSession = req.getSession();
		testSession.setAttribute("loginId", loginId);
		
	
		
//		String loginId = (String) req.getSession().getAttribute("loginId");
		
		
		BoardService boardService = BoardService.getBoardService();
		
		//속성값에 boardService.boardList()넣어줌
		req.setAttribute("boardList", boardService.boardList());
		
		//postList(게시판 목록)뷰로 보냄
		Utils.forward(req, resp, "/board/postList.tiles");
	}

}
