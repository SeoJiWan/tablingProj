package dev.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.controller.Controller;
import dev.domain.Comment;
import dev.repository.CommentRepository;
//댓글 등록 컨트롤러
public class CommentAddController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		
		String cmtWriter = req.getParameter("cmtWriter");
		String cmtContent = req.getParameter("cmtContent");
		int cmtBoardId = Integer.parseInt(req.getParameter("cmtBoardId")); //=>Cannot parse null string
		
		//>>TEST
		System.out.println("댓글등록 보드ID: " + cmtBoardId);
		System.out.println("댓글작성자: " + cmtWriter);
		System.out.println("댓글내용: " + cmtContent);
		
		Comment comment = new Comment();
		comment.setBoardId(cmtBoardId);
		comment.setMemberId(cmtWriter);
		comment.setContent(cmtContent);
		
		//댓글 추가 서비스 실행
		CommentRepository commentRepo = new CommentRepository();
		commentRepo.insertComment(comment); 
		req.setAttribute("comment", comment);
		
		req.setCharacterEncoding("utf-8");
		resp.getWriter().write("success");
		
	}

}
