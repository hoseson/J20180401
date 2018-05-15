package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DiseaseBoardDAO {
	private static DiseaseBoardDAO instance;

	private DiseaseBoardDAO() {

	}

	public static DiseaseBoardDAO getInstance() {
		if (instance == null)
			instance = new DiseaseBoardDAO();
		return instance;
	}

	private Connection getConnection() {
		// DB 연결
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx
					.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public List<DiseaseBoardDTO> getDiseaseBoard(String search)
			throws SQLException {
		// 게시물 받아오기
		List<DiseaseBoardDTO> list = new ArrayList<>();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from diseaseboard order by to_number(boardno) desc";
		try {
			if (search == null || search.equals(""))
				sql = "select * from diseaseboard order by to_number(boardno) desc";
			else {
				sql = "select * from diseaseboard where subject like '%"
						+ search + "%' or content like '%" + search
						+ "%' order by to_number(boardno) desc";
			}
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				DiseaseBoardDTO board = new DiseaseBoardDTO();
				board.setBoardno(rs.getString("boardno"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				list.add(board);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public int getMax() throws SQLException {
		// 가장 높은 번호 게시물 받아오기
		int max = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select max(to_number(boardno)) mx from diseaseBoard";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				max = rs.getInt("mx");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return max;
	}

	public int plusReadCnt(DiseaseBoardDTO board) throws SQLException {
		// 조회수 증가시키고 받아오는 매소드
		int readcount = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 증가시키고 받아오는 쿼리
		String sql1 = "update diseaseboard set readcount = (select readcount+1 from diseaseboard where boardno = ?) where boardno = ?";
		String sql2 = "select readcount from diseaseboard where boardno = ?";
		try {
			ps = conn.prepareStatement(sql1);
			ps.setString(1, board.getBoardno());
			ps.setString(2, board.getBoardno());
			if (ps.executeUpdate() > 0) {
				ps.close();
				ps = conn.prepareStatement(sql2);
				ps.setString(1, board.getBoardno());
				rs = ps.executeQuery();
				if (rs.next()) {
					readcount = rs.getInt("readcount");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return readcount;
	}

	public DiseaseBoardDTO getPage(int boardno) throws SQLException {
		// 페이지 정보 받아오기 (이전,현재,다음)
		DiseaseBoardDTO board = new DiseaseBoardDTO();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from diseaseboard where boardno = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardno);
			rs = ps.executeQuery();
			if (rs.next()) {
				board.setBoardno(rs.getString("boardno"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setRegdate(rs.getString("regdate"));
				board.setSubject(rs.getString("subject"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return board;
	}

	public int insertBoard(DiseaseBoardDTO board) throws SQLException {
		// 질병정보 게시물 삽입하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "insert into diseaseboard values(sysdate, (select max(to_number(boardno))+1 from diseaseBoard),?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, board.getSubject());
			ps.setString(2, board.getContent());
			ps.setInt(3, 0);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int deleteBoard(String boardNo, String regDate) throws SQLException {
		// 질병정보 게시물 삭제하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "delete from diseaseboard where boardno = ? and regdate = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, boardNo);
			ps.setString(2, regDate);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int updateBoard(String boardno, String subject, String content) {
		// 질병 게시물 수정하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "update diseaseboard set subject = ?, content = ? where boardno = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, subject);
			ps.setString(2, content);
			ps.setString(3, boardno);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
