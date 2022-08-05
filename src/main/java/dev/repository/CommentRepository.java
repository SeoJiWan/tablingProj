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
			String sql = "insert into comments(comment_id, member_id, board_id, content, create_date) values(comment_id_seq.nextval, ?, ?, ?, sysdate)";
			
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
			String sql = "select b.board_id c.comment_id, c.member_id ,m.nickname, c.content, c.create_date "
					+ "from comments c inner join boards b on c.member_id = b.member_id "
					+ "inner join members m on b.member_id = m.member_id "
					+ "where b.boarder_id=? order by c.comment_id desc";
			ArrayList<Comment> commentList = new ArrayList<>();
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, boardId);
				rs = ps.executeQuery();
				
				while (rs.next()) {
					Comment comment = new Comment(rs.getInt("comment_id"),
										 rs.getString("member_id"),
										 rs.getInt("board_id"),
										 rs.getString("nickname"),
										 rs.getString("content"),
										 rs.getString("create_date"));
					commentList.add(comment);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return commentList;
		}
		private int getNext() {
			// TODO Auto-generated method stub
			return 0;
		}

		//댓글 디테일(단건조회) - 쓸 일 있?
		public Comment getComment(int commentId) {
			connect();
			String sql = "select * from comments where board_id=?";
			
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
		//뎃글 내용 수정
		public void updateComment(Comment comment) {
			connect();
			String sql = "update comments set content=? where comment_id=?";
			
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
		public void deletePost(Board bd) {
			connect();
			String sql = "delete from boards where board_id=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, bd.getBoardId());
				
				int result = ps.executeUpdate();
				if (result > 0) {
					System.out.println(result + "건 삭제 완료");
				} else {
					System.out.println("삭제 실패");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
		//로그인체크
		public Member loginCheck(String id, String pwd) {
			connect();
			String sql = "select * from members where member_id=? and password=?";
			
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, pwd);
				
				rs = ps.executeQuery();
				if(rs.next()) {
					Member member = new Member();
					member.setMemberId(rs.getString("member_id"));
					member.setMemberId(rs.getString("password"));
					member.setNickName(rs.getString("nick_name"));
					return member;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;
		}
		//페이징
		public List<Board> getListPaging(Criteria criteria) {
			connect();
			List<Board> pageList = new ArrayList<>();
			String sql = "select board_id, member_id, title, create_date, hits "
					+ "from (select rownum rn, board_id, member_id, title,create_date, hits "
					+ "      from (select rownum rn, board_id, member_id, title,create_date, hits "
					+ "            from boards order by board_id desc) "
					+ "      where rownum <= ?) "
					+ "where rn>?"; 
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, criteria.getPostNum()*criteria.getPageNum());//글갯수
				ps.setInt(2, criteria.getPostNum()*(criteria.getPageNum()-1));//페이지
				
				rs=ps.executeQuery();
				while(rs.next()) {
					Board board = new Board();
					board.setBoardId(rs.getInt("board_id"));
					board.setMemberId(rs.getString("member_id"));
					board.setTitle(rs.getString("title"));
					board.setCreateDate(rs.getString("create_date"));
					board.setHits(rs.getInt("hits"));
					
					pageList.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return pageList;
		}
	}
