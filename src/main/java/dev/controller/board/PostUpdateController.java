package dev.controller.board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Board;

public class PostUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 로그인 아이디, 세션에서 가져오기
		String loginId = (String) req.getSession().getAttribute("loginId");

		// 값 받아올 속성
		String boardId = req.getParameter("boardId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		// 값 세팅할 속성
		Board boardDetail = new Board();
		boardDetail.setBoardId(Integer.parseInt(boardId));
		boardDetail.setMemberId(loginId);
		boardDetail.setTitle(title);
		boardDetail.setContent(content);

		// DB데이터 업데이트
		boardService.updatePost(boardDetail);

		// 요청에 board 속성 값 담을 변수 지정
		req.setAttribute("boardDetail", boardDetail);
		
		//ajax 통신
		resp.getWriter().write("success");

//		Utils.forward(req, resp, "postDetail.do");
	}

}
