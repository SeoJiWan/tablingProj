package dev.service;

import java.util.List;

import dev.domain.Board;
import dev.domain.Criteria;
import dev.repository.BoardRepository;

public class BoardService {
	
	//싱글톤
	 private static BoardService boardService = new BoardService();
	 BoardRepository boardRepo = new BoardRepository();
	 
	 //생성자
	 private BoardService() {};
	 public static BoardService getBoardService() {
		return boardService;
	 }
	 
	 //게시글 등록
	 public void addPost(Board bd) {
		 boardRepo.insertPost(bd);
	 }
	 
	 //글목록
	 public List<Board> boardList(){
		 return boardRepo.boardList();
	 }
	 
	 //게시글 보기
	 public Board getPost(Board bd) {
		return boardRepo.getPost(bd);
	 }
	 
	 //게시글 수정
	 public void updatePost(Board bd) {
		 boardRepo.updatePost(bd);
	 }
	 
	 //게시글 삭제
	 public void deletePost(Board bd) {
		 boardRepo.deletePost(bd);
	 }
	 
	 //페이징
	 public List<Board> getPaging(Criteria criteria) {
		 return boardRepo.getListPaging(criteria);
	 }
	
}
