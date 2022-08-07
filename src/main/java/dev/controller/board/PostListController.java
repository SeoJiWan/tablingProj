package dev.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;
import dev.service.BoardService;

public class PostListController implements Controller {
//죽은 게시글 리스트
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
//		// 요청에서 세션 받아옴
//		 Member loginMember = (Member) req.getSession().getAttribute("loginMember");
//		 
//		//세션에서 로그인 아이디 받기
//		String loginMemberId = loginMember.getMemberId();
//		System.out.println("ddd" + loginMemberId);
//		//변수 boardList 속성값에 글목록 실행 서비스 담기
//		BoardService boardService = BoardService.getBoardService();
//		req.setAttribute("boardList", boardService.boardList());
//		req.setAttribute("loginMember", loginMember);
//		
//		//게시판 목록뷰 실행
//		Utils.forward(req, resp, "/board/postList.tiles");
	}

}
