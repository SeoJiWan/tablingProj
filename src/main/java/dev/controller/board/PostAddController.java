package dev.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.domain.Member;
import dev.service.BoardService;

//게시글 등록 컨트롤러
public class PostAddController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		// 로그인 아이디 세션에서 가져오기
			String loginId = (String) req.getSession().getAttribute("loginId");
			//임의 세팅값
			loginId = "user1";
			
//			String memberId = req.getParameter(loginId);
			String title = req.getParameter("title");
			String cont = req.getParameter("content");

			System.out.println("등록할 글제목: " + title);
			System.out.println("등록할 내용: " + cont);

			Board board = new Board();
			board.setMemberId(loginId);
			board.setTitle(title);
			board.setContent(cont);

			// 글 추가 서비스 실행
			BoardService boardService = BoardService.getBoardService();
			boardService.addPost(board);
			req.setAttribute("boardDetail", board);

			// 글 등록 후 디테일로 들어가도록
			Utils.forward(req, resp, "postDetail.do");
		}
	}
