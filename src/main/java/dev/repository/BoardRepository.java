package dev.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dev.domain.Board;
import dev.domain.Criteria;
import dev.domain.Member;

public class BoardRepository extends DAO{
	/*
	 * 커뮤니티
	 * role=0 -> 글 읽기&쓰기 가능
	 * role=1 -> 글 읽기만 가능
	 * role=2 -> 글 읽기&쓰기 가능
	 */
					
	
	//글등록
	public void insertPost(Board bd) {
		connect();
		String sqlSelect = "SELECT NVL(MAX(board_id),2022100)+1 FROM boards";
		String sqlInsert = "INSERT INTO boards VALUES(?, ?, ?, ?, TO_CHAR(SYSDATE, 'YYYYMMDD'),0)";
		try {
			//SELECT 쿼리문 1(boardId조회)
			ps = conn.prepareStatement(sqlSelect);
			rs = ps.executeQuery();
			int maxSeq = 0;
			if(rs.next()) {
				//maxSeq에 db의 board_id값을 가져와 담아줌
				maxSeq=rs.getInt(1);
				//그리고 Board.boardId에 그 maxSeq를 담음
				bd.setBoardId(maxSeq);
			}
			//INSERT 쿼리문 2
			ps = conn.prepareStatement(sqlInsert);
			
			ps.setInt(1, maxSeq); //쿼리 1에서 조회한 boardId값 담아줌
			ps.setString(2, bd.getMemberId());
			ps.setString(3, bd.getTitle());
			ps.setString(4, bd.getContent());
			
			int result = ps.executeUpdate();
			
			if(result>0) {
				System.out.println(result + "건 등록 완료");
			} else {
				System.out.println("등록 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	//게시판 전체 목록
	public List<Board> boardList() {
		connect();
		String sql = "SELECT b.board_id, b.member_id ,m.nickname, b.title, b.content, b.create_date, b.hits "
					  + "FROM boards b "
					  + "JOIN members m ON (b.member_id = m.member_id) "
					  + "ORDER BY b.board_id DESC";
		List<Board> list = new ArrayList<>();
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				Board board = new Board(rs.getInt("board_id"),
									 rs.getString("member_id"),
									 rs.getString("nickname"),
									 rs.getString("title"),
									 rs.getString("content"),
									 rs.getString("create_date"),
									 rs.getInt("hits"));
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	//게시글 디테일(단건조회)
	public Board getPost(int boardId) {
		connect();
		String sql = "SELECT b.board_id, b.member_id ,m.nickname, b.title, b.content, b.create_date, b.hits "
					  + "FROM boards b "
					  + "JOIN members m ON (b.member_id = m.member_id) WHERE board_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardId);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				Board bd = new Board();
				bd.setBoardId(boardId);
				bd.setMemberId(rs.getString("member_id"));
				bd.setNickName(rs.getString("nickname"));
				bd.setTitle(rs.getString("title"));
				bd.setContent(rs.getString("content"));
				bd.setCreateDate(rs.getString("create_date"));
				
				updateHits(boardId); //게시글 클릭->조회수++메소드 실행
				
				return bd;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return null;
	}
	//조회수++
	private void updateHits(int boardId) {
		connect();
		String sql = "UPDATE boards SET hits=hits+1 WHERE board_id=?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, boardId);
				ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
	}
	//게시글 제목, 내용 수정
	public void updatePost(Board bd) {
		connect();
		String sql = "UPDATE boards SET title=?, content=? WHERE board_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bd.getTitle());
			ps.setString(2, bd.getContent());
			ps.setInt(3, bd.getBoardId());
			
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
		String sql = "DELETE FROM boards WHERE board_id=?";
		
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

	//페이징
	public List<Board> getListPaging(Criteria criteria) {
		connect();
		List<Board> pageList = new ArrayList<>();
		String sql = "SELECT board_id, member_id, nickname, title, create_date, hits "
				     + "FROM (SELECT rownum rn, board_id, member_id, nickname, title, create_date, hits "
				     		 + "FROM (SELECT rownum rn, b.board_id, b.member_id, m.nickname, b.title, b.create_date, b.hits "
				     		 		   + "FROM boards b JOIN members m ON (m.member_id = b.member_id) "
				     		 		   + "ORDER BY board_id DESC) "
				     		 		   + "WHERE rownum <= ?) " //글 갯수
 		 		     + "WHERE rn>?";  //페이지
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, criteria.getPostNum()*criteria.getPageNum());//글 갯수
			ps.setInt(2, criteria.getPostNum()*(criteria.getPageNum()-1));//페이지
			
			rs=ps.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardId(rs.getInt("board_id"));
				board.setMemberId(rs.getString("member_id"));
				board.setNickName(rs.getString("nickname"));
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
	
