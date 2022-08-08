package dev.service;

import java.util.List;

import dev.domain.Board;
import dev.domain.Comment;
import dev.domain.Criteria;
import dev.repository.CommentRepository;

public class CommentService {

	//싱글톤
	private static CommentService commentService=new CommentService();
	CommentRepository commentRepo = new CommentRepository();
	
	//생성자
	private CommentService() {};
	
	//싱글톤 객체 리턴하는 메소드
	public static CommentService getCommentService() {
		return commentService;
	}
	
	//댓글 등록
	public void insertComment(Comment cm) {
		commentRepo.insertComment(cm);
	}
	
	//댓글 목록
	public List<Comment> commentList(int boardId){
		return commentRepo.getCommentList(boardId);
	}
	//댓글 수정
	
	//댓글 보기
	
	//댓글 삭제
	public void deleteComment(Comment cm) {
		commentRepo.deleteComment(cm);
	}
	
	//페이징?
	 public List<Comment> getcommentPaging(Criteria criteria) {
		 return commentRepo.getCommentListPaging(criteria);
	 }
	
}
