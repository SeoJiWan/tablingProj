package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;


public class PostUpdateFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//값 받아올 속성
		String boardId = req.getParameter("boardId");
		String memberId = req.getParameter("memberId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String createDate = req.getParameter("createDate");
		String hits = req.getParameter("hits");
		
		//값 세팅할 속성
		Board boardDetail = new Board();
		boardDetail.setBoardId(Integer.parseInt(boardId));
		boardDetail.setMemberId(memberId);
		boardDetail.setTitle(title);
		boardDetail.setContent(content);
		boardDetail.setCreateDate(createDate);
		boardDetail.setHits(Integer.parseInt(hits));
		
		System.out.println("boardDetail = " + boardDetail);

		//요청에 board 속성 값 담을 변수 지정
		req.setAttribute("boardDetail",boardDetail);
		
		//수정폼뷰 실행
		Utils.forward(req, resp, "/board/postUpdateForm.tiles");
		
	}
}
