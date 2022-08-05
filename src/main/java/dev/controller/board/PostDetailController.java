package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.repository.BoardRepository;

public class PostDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//postList에서 선택한 글의 boardId값 받아옴
		String boardId = req.getParameter("boardId");
		
		//DAO.getPost()에 받아온 boardId값을 매개변수에 넣어 단건 조회 실행
		BoardRepository bdRepo = new BoardRepository();
		Board boardDetail = bdRepo.getPost(Integer.parseInt(boardId));

		//속성값 세팅해서 postDetail 뷰로 보냄
		req.setAttribute("boardDetail", boardDetail);
		Utils.forward(req, resp, "/board/postDetail.tiles");

	}
}
