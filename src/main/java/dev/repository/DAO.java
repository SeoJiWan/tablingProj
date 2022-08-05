package dev.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {
	/*
	 * Field
	 */
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	//
	Statement st;
	
	// 커넥션 풀 안되서 방지용으로 사용
	// field for DB configuration
	private String cDriver = "oracle.jdbc.driver.OracleDriver";
	private String cUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	private String cId = "tabling";
	private String cPwd = "tabling";

	/*
	 * Method
	 */
	// dao의 메서드를 실행할때마다 커넥션을 하지 않고 커넥션 풀 사용
	public void connect() {
//		try {
//			// server.xml 에 등록해놓은 orcleDriver 정보 불러오기
//			InitialContext ic = new InitialContext();
//			// 톰캣 가상 환경에 저장되어 있음
//			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
//			conn = ds.getConnection();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		try {
			Class.forName(cDriver);
			conn = DriverManager.getConnection(cUrl, cId, cPwd);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void disconnect() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
