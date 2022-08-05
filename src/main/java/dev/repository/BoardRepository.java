package dev.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dev.domain.Board;
import dev.domain.Criteria;
import dev.domain.Member;

public class BoardRepository extends DAO{
	//커뮤니티 : role=2면 -> 글 읽기&쓰기 가능
	
	//글등록
	public void insertPost(Board bd) {
		connect();
		String sql = "insert into boards values((select nvl(max(board_id),2022100)+1 from boards), ?, ?, ?, sysdate,0)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bd.getMemberId());
			ps.setString(2, bd.getTitle());
			ps.setString(3, bd.getContent());
			
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
		String sql = "select b.board_id, b.member_id ,m.nickname, b.title, b.content, b.create_date, b.hits from boards b join members m on (b.member_id = m.member_id) order by b.board_id desc";
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
		String sql = "select * from boards where board_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardId);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				Board bd = new Board();
				bd.setBoardId(boardId);
				bd.setMemberId(rs.getString("member_id"));
				bd.setTitle(rs.getString("title"));
				bd.setContent(rs.getString("content"));
				bd.setCreateDate(rs.getString("create_date"));
				bd.setHits(rs.getInt("hits"));
				
				updateHits(boardId); //게시글 클릭->조회수++메소드 실행
				
				return bd;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		System.out.println("조회된 값이 없습니다");
		return null;
	}
	//조회수++
	private void updateHits(int boardId) {
		connect();
		String sql = "update boards set hits=hits+1 where board_id=?";
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
		String sql = "update boards set title=?, content=? where board_id=?";
		
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
				member.setNickName(rs.getString("nickname"));
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
	
