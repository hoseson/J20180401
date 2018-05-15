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

public class ConDAO {
	private static ConDAO instance;

	private ConDAO() {

	}

	public static ConDAO getInstance() {
		if (instance == null) {
			instance = new ConDAO();
		}
		return instance;
	}

	private Connection getConnection() {
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

	public int getTotal(String deptName) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 1;
		String sql = "select count(consultNo) from consult where deptname=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptName);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("총 카운트-->" + e.getStackTrace());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public String manage(String memNo) throws SQLException {
		String manage = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select manage from member where memNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				manage = rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("관리자확인 dao" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return manage;
	}

	public int recontent(ConDTO con) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update consult set recontent=? where consultNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, con.getRecontent());
			pstmt.setString(2, con.getConsultNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("관리자 답변 dao=>>>" + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public List<ConDTO> list(String deptName, int startRow, int endRow)
			throws SQLException {
		List<ConDTO> list = new ArrayList<ConDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum rn,a.* from (select * from consult where deptname=? order by regdate desc) a)"
				+ " where rn between ? and ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptName);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ConDTO con = new ConDTO();
				con.setConsultNo(rs.getString("consultno"));
				con.setContent(rs.getString("content"));
				con.setDeptName(rs.getString("deptname"));
				con.setMemNo(rs.getString("memno"));
				con.setReadCount(rs.getInt("readcount"));
				con.setRecontent(rs.getString("recontent"));
				con.setRegDate(rs.getString("regdate"));
				con.setSubject(rs.getString("subject"));
				list.add(con);
			}
		} catch (Exception e) {
			System.out.println("건강상담 목록 dao" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public void readcount(String consultNo,String memNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update consult set readcount=readcount+1 where consultNo=? and memNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consultNo);
			pstmt.setString(2, memNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("조회수 dao==>" + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	public ConDTO content(String consultNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConDTO con = new ConDTO();
		String sql = "select * from consult where consultNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, consultNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				con.setRegDate(rs.getString(1));
				con.setConsultNo(rs.getString(2));
				con.setMemNo(rs.getString(3));
				con.setSubject(rs.getString(4));
				con.setDeptName(rs.getString(5));
				con.setReadCount(rs.getInt(6));
				con.setContent(rs.getString(7));
				con.setRecontent(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return con;
	}

	public int insert(ConDTO con) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into consult values(to_char(sysdate,'yy/MM/dd'),consult_seq.nextval,?,?,?,1,?,'')";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, con.getMemNo());
			pstmt.setString(2, con.getSubject());
			pstmt.setString(3, con.getDeptName());
			pstmt.setString(4, con.getContent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("등록하기 dao==>" + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int getTotalCnt(String memNo) throws SQLException {
		Connection conn = null;
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from consult where memNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return count;
	}

	public List<ConDTO> list(String memno) throws SQLException {
		List<ConDTO> list = new ArrayList<ConDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from consult where memno=? "
				+ "order by regdate desc consultno desc";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ConDTO cdto = new ConDTO();
				cdto.setConsultNo(rs.getString("consultno"));
				cdto.setDeptName(rs.getString("deptname"));
				cdto.setSubject(rs.getString("subject"));
				cdto.setRegDate(rs.getString("regdate"));
				cdto.setMemNo(rs.getString("memno"));
				cdto.setReadCount(rs.getInt("readcount"));
				cdto.setContent(rs.getString("content"));
				cdto.setRecontent(rs.getString("recontent"));
				list.add(cdto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}

	public List<ConDTO> list2(String memno, int startRow, int endRow)
			throws SQLException {
		List<ConDTO> list2 = new ArrayList<ConDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from ( select rownum rn, a.* from ( select * from consult where memno=? "
				+ "order by regdate desc ) a )" + "where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ConDTO cdto = new ConDTO();
				cdto.setConsultNo(rs.getString("consultno"));
				cdto.setDeptName(rs.getString("deptname"));
				cdto.setSubject(rs.getString("subject"));
				cdto.setRegDate(rs.getString("regdate"));
				cdto.setMemNo(rs.getString("memno"));
				cdto.setReadCount(rs.getInt("readcount"));
				cdto.setContent(rs.getString("content"));
				cdto.setRecontent(rs.getString("recontent"));
				list2.add(cdto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list2;
	}

	// 건강상담글 조회(로그인한 아이디로 작성한 글만 조회)
	public ConDTO content(String memno, String consultno) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from consult where memno=? and consultno=? ";
		ConDTO cdto = new ConDTO();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memno);
			pstmt.setString(2, consultno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cdto.setRegDate(rs.getString(1));
				cdto.setConsultNo(rs.getString(2));
				cdto.setMemNo(rs.getString(3));
				cdto.setSubject(rs.getString(4));
				cdto.setDeptName(rs.getString(5));
				cdto.setReadCount(rs.getInt(6));
				cdto.setContent(rs.getString(7));
				cdto.setRecontent(rs.getString(8));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());

		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

		return cdto;
	}

	// 건강상담글 수정
	public int update(ConDTO cdto) throws SQLException {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "update consult set subject=?, content=? where memno=? and consultno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cdto.getSubject());
			pstmt.setString(2, cdto.getContent());
			pstmt.setString(3, cdto.getMemNo());
			pstmt.setString(4, cdto.getConsultNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("업데이트쪽 dao==>>>>" + e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// 건강상담글 삭제
	public int remove(String memno, String consultno) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from consult where memno=? and consultno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memno);
			pstmt.setString(2, consultno);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

}
