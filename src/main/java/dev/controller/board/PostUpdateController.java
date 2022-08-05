package dev.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.service.BoardService;

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
		BoardService bdService = BoardService.getBoardService();
		bdService.updatePost(boardDetail);

		// 요청에 board 속성 값 담을 변수 지정
		req.setAttribute("boardDetail", boardDetail);


//		resp.setContentType("text/html;charset=utf-8");
//		resp.setCharacterEncoding("UTF-8");
//		PrintWriter writer = resp.getWriter();
//		writer.println("<script type='text/javascript'>");
//		writer.println("alert('존재하지 않는 아이디입니다. ')");
//		writer.println("</script>");
		Utils.forward(req, resp, "postDetail.do");
	}

}
