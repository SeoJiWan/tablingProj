package dev.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Board;
import dev.domain.Criteria;
import dev.domain.Member;
import dev.domain.Page;


public class PostListPagingController implements Controller {
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
				// 요청에서 세션 받아옴
				Member loginMember = (Member) req.getSession().getAttribute("loginMember");
				req.setAttribute("loginMember", loginMember);
				
				//---------pageNum,postNum 속성 받아오기
				String pageNum = req.getParameter("pageNum");
				String postNum = req.getParameter("postNum");
				
				
				//---------criteria객체에 pageNum,postNum 속성 담기
				Criteria criteria = new Criteria();
				criteria.setPageNum(Integer.parseInt(pageNum));
				criteria.setPostNum(Integer.parseInt(postNum));
				
				//---------PageList서비스 호출
				List<Board> pageList = boardService.getPaging(criteria);

				req.setAttribute("boardList", pageList);
				
				//---------글 목록 전체
				List<Board> boardTotalList = boardService.boardList();
				int total = boardTotalList.size();
				req.setAttribute("pageInfo", new Page(criteria, total));
				
				//>>TEST
				System.out.println("postListPaging Controller test : " +  pageNum + " : " + postNum);
				
				//---------boardList전송
				Utils.forward(req, resp, "/board/postList.tiles");
			}
		}