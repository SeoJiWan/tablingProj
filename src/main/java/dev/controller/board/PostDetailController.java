package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.domain.Member;
import dev.repository.BoardRepository;

public class PostDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		/*
		* 문제>>!postAdd.do에서 넘어올 때 boardId를 받아오지 못해 500번 에러 뜸ㅠ
		*		  -> repo.Detail의 매개변수 Board에서 받는것으로 수정
		*/
		
//		// 요청에서 세션 받아옴
//		 Member loginMember = (Member) req.getSession().getAttribute("loginMember");
//		 
//		//세션에서 로그인 아이디 받기
//		String loginMemberId = loginMember.getMemberId();
		
		//postList에서 선택한 글의 boardId값 받아옴
		String boardId = req.getParameter("boardId");
		
		
		//DAO.getPost()에 받아온 boardId값을 매개변수에 넣어 단건 조회 실행
//		BoardRepository bdRepo = new BoardRepository();
//		Board boardDetail = bdRepo.getPost(Integer.parseInt(boardId));
		
		Board board = new Board();
		board.setBoardId(Integer.parseInt(boardId));
		
		boardService.getPost(board);
		

		//속성값 세팅해서 postDetail 뷰로 보냄
		req.setAttribute("boardDetail", board);
//		req.setAttribute("loginMemberId", loginMemberId);
		
		Utils.forward(req, resp, "/board/postDetail.tiles");
	}
}

