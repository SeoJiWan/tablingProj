package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dev.domain.Board;
import dev.domain.Comment;
import dev.domain.Criteria;
import dev.domain.Member;

public class CommentRepository extends DAO{
	//댓글등록
		public void insertComment(Comment cm) {
			connect();
			String sql = "INSERT INTO comments VALUES(comment_id_seq.nextval, ?, ?, ?, TO_CHAR(SYSDATE, 'YY.MM.DD HH24:MI'))";
			
			try {
				ps = conn.prepareStatement(sql);
				
				ps.setString(1, cm.getMemberId());
				ps.setInt(2, cm.getBoardId());
				ps.setString(3, cm.getContent());
				int result = ps.executeUpdate();
				
				if(result>0) {
					System.out.println("댓글" + result + "건 등록 완료");
				} else {
					System.out.println("등록실패");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
		
		//댓글목록
		public List<Comment> getCommentList(int boardId) {
			connect();
			ArrayList<Comment> commentList = new ArrayList<>();
			String sql = "SELECT c.comment_id, c.board_id, c.member_id ,m.nickname, c.content, c.create_date "
						  + "FROM comments c "
						  + "JOIN members m ON (c.member_id = m.member_id) "
						  + "WHERE c.board_id=? "
						  + "ORDER BY c.comment_id DESC";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, boardId);
				rs = ps.executeQuery();
				
				while (rs.next()) {
					Comment comment = new Comment(rs.getInt("comment_id"),
																		 rs.getString("member_id"),
																		 rs.getInt("board_id"),
																		 rs.getString("content"),
																		 rs.getString("create_date"),
																		 rs.getString("nickname"));
													
					commentList.add(comment);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return commentList;
		}

		//댓글 디테일(단건조회) - 쓸 일 있?
		public Comment getComment(int commentId) {
			connect();
			String sql = "SELECT * FROM comments WHERE comment_id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, commentId);
				rs = ps.executeQuery();
				
				if (rs.next()) {
					Comment comment = new Comment();
					comment.setCommentId(rs.getInt("commentId"));
					comment.setMemberId(rs.getString("member_id"));
					comment.setBoardId(rs.getInt("board_id"));
					comment.setContent(rs.getString("content"));
					comment.setCommentDate(rs.getString("create_date"));
					
					return comment;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			System.out.println("조회된 값이 없습니다");
			return null;
		}
		//댓글 내용 수정
		public void updateComment(Comment comment) {
			connect();
			String sql = "UPDATE comments SET content=?, create_date=TO_CHAR(SYSDATE, 'YY.MM.DD HH24:MI') WHERE comment_id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, comment.getContent());
				ps.setInt(2, comment.getCommentId());
				
				int result = ps.executeUpdate();
				
				if (result > 0) {
					System.out.println(result + "건 수정 완료");
				} else {
					System.out.println("수정 실패");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} disconnect();
		}
		//게시글 삭제
		public void deleteComment(Comment cm) {
			connect();
			String sql = "DELETE FROM comments WHERE comment_id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, cm.getCommentId());
				
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println("댓글" + result + "건 삭제 완료");
				} else {
					System.out.println("삭제 실패");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
		
		//페이징
		public List<Comment> getCommentListPaging(Criteria criteria) {
			connect();
			List<Comment> cmtPageList = new ArrayList<>();
			String sql = "SELECT comment_id, board_id, member_id, nickname, content, create_date "
						 + "FROM (SELECT rownum rn, comment_id, board_id, member_id, nickname, content, create_date "
				 				    + "FROM (SELECT rownum rn, c.comment_id, c.board_id, c.member_id, m.nickname, c.content, c.create_date "
							  				  + "FROM comments c JOIN members m ON (c.member_id = m.member_id) "
						  				  	  + "ORDER BY comment_id DESC) "
						  				  	  + "WHERE rownum <= ?) "
						 + "WHERE rn>?"; 
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, criteria.getPostNum()*criteria.getPageNum());//글갯수
				ps.setInt(2, criteria.getPostNum()*(criteria.getPageNum()-1));//페이지
				
				rs=ps.executeQuery();
				while(rs.next()) {
					Comment comment = new Comment();
					comment.setCommentId(rs.getInt("comment_id"));
					comment.setBoardId(rs.getInt("board_id"));
					comment.setMemberId(rs.getString("member_id"));
					comment.setNickName(rs.getString("nickname"));
					comment.setContent(rs.getString("content"));
					comment.setCommentDate(rs.getString("create_date"));
					
					cmtPageList.add(comment);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return cmtPageList;
		}
	}