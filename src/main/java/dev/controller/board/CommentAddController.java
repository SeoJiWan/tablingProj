package dev.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.repository.CommentRepository;

public class CommentAddController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("utf-8");
		//로그인 세션 가져오기
//		MemberService memberSerivce = MemberService.getMemberService();
//		
//		String content = req.getParameter("content");
//		CommentService commentService = new CommentService();
		
		CommentRepository commentRepo = new CommentRepository();
		commentRepo.insertComment(null); 
		
//		if(content == null || !RegExp.checkString(content, content) || (content.equals("")) {
//			resp.setContentType("text/html;charset=utf-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('잘못된 접근입니다 !');location.href='postList.do';<script>");
//			out.close();
//			return null;
//		}
//		if (boardId == null || boardId.equals("")  || !RegExp.checkString(boardId, boardId)) {
//			resp.setContentType("text/html;charset=utf-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('잘못된 접근입니다 !');location.href='postList.do';<script>");
//			out.close();
//			return null;
//		}
//		int boardId = Integer.parseInt(boardId);
//		if(boardId<=0) {
//			resp.setContentType("text/html;charset=utf-8");
//			PrintWriter out = resp.getWriter();
//			out.println("<script>alert('잘못된 접근입니다 !');location.href='postList.do';<script>");
//			out.close();
//			return null;
//		}
		
	}

}
