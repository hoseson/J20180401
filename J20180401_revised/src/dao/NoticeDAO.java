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

public class NoticeDAO {
	private static NoticeDAO instance;

	private NoticeDAO() {

	}

	public static NoticeDAO getInstance() {
		if (instance == null)
			instance = new NoticeDAO();
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
			e.printStackTrace();
		}
		return conn;
	}

	public List<NoticeDTO> getNotice(String type, String subcon, String search)
	// 게시판 글 받아오기, 게시글 종류 / 검색 대상 제목 or 게시글 /검색 내용
			throws SQLException {
		List<NoticeDTO> li = new ArrayList<>();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";

		try {
			if ((type == null && subcon == null)
					|| (type.equals("") && (subcon.equals("")))) {
				// 전체로 선택한 경우
				System.out.println(search);
				if (search == null || search.equals("")) {
					//검색어 입력안 한 경우
					sql = "select * from noticeBoard order by to_number(boardno) desc";
				} else {
					//검색어 검색한 경우
					sql = "select * from noticeBoard where subject like '%" + search
							+ "%' or content like '%" + search
							+ "%' order by to_number(boardno) desc";
				}
				ps = conn.prepareStatement(sql);
			} else if (!type.equals("") && subcon.equals("")) {
				// 게시 종류 선택 되고 제목/내용 선택 안 됐을 때
				sql = "select * from noticeBoard where type=? and (subject like '%"
						+ search
						+ "%' or content like '%"
						+ search
						+ "%') order by to_number(boardno) desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, type);
			} else if (type.equals("") && subcon.equals("subject")) {
				// 게시 종류 선택 안 되고 제목 선택했을 때
				sql = "select * from noticeBoard where subject like '%"
						+ search + "%' order by to_number(boardno) desc";
				ps = conn.prepareStatement(sql);
			} else if (type.equals("") && subcon.equals("content")) {
				// 게시 종류 선택 안 되고 내용 선택했을 때
				sql = "select * from noticeBoard where content like '%"
						+ search + "%' order by to_number(boardno) desc";
				ps = conn.prepareStatement(sql);
			} else if (!type.equals("") && subcon.equals("subject")) {
				// 게시 종류 선택 되고 제목 선택했을 때
				sql = "select * from noticeBoard where type=? and subject like '%"
						+ search + "%' order by to_number(boardno) desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, type);
			} else if (!type.equals("") && subcon.equals("content")) {
				// 게시 종류 선택 되고 내용 선택했을 때
				sql = "select * from noticeBoard where type=? and content like '%"
						+ search + "%' order by to_number(boardno) desc";
				ps = conn.prepareStatement(sql);
				ps.setString(1, type);
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				NoticeDTO nd = new NoticeDTO();
				nd.setBoardno(rs.getString("boardno"));
				nd.setContent(rs.getString("content"));
				nd.setSubject(rs.getString("subject"));
				nd.setType(rs.getString("type"));
				nd.setReadcount(rs.getInt("readcount"));
				nd.setRegdate(rs.getString("regdate"));
				li.add(nd);
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
		return li;
	}

	public int getMax() throws SQLException {
		int max = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select max(to_number(boardno)) mx from noticeBoard";

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

	public int plusReadCnt(NoticeDTO notice) throws SQLException {
		// 조회수 증가시키고 받아오는 매소드
		int readcount = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		// 증가시키고 받아오는 쿼리
		String sql1 = "update noticeboard set readcount = (select readcount+1 from noticeboard where boardno = ?) where boardno = ?";
		String sql2 = "select readcount from noticeboard where boardno = ?";
		try {
			ps = conn.prepareStatement(sql1);
			ps.setString(1, notice.getBoardno());
			ps.setString(2, notice.getBoardno());
			if (ps.executeUpdate() > 0) {
				ps.close();
				ps = conn.prepareStatement(sql2);
				ps.setString(1, notice.getBoardno());
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

	public NoticeDTO getPage(int boardno) throws SQLException {
		// 페이지 정보 받아오기 (이전,현재,다음)
		NoticeDTO notice = new NoticeDTO();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from noticeboard where boardno = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, boardno);
			rs = ps.executeQuery();
			if (rs.next()) {
				notice.setBoardno(rs.getString("boardno"));
				notice.setContent(rs.getString("content"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setRegdate(rs.getString("regdate"));
				notice.setSubject(rs.getString("subject"));
				notice.setType(rs.getString("type"));
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
		return notice;
	}

	public int insertBoard(NoticeDTO board) {
		// 공지사항 게시물 삽입하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "insert into noticeboard values(sysdate, notice_seq.nextval,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, board.getType());
			ps.setString(2, board.getSubject());
			ps.setString(3, board.getContent());
			ps.setInt(4, 0);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteBoard(String boardNo, String regDate) throws SQLException {
		// 공지사항 게시물 삭제하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "delete from noticeboard where boardno = ? and regdate = ?";
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

	public int updateBoard(String type, String boardno, String subject,
			String content) {
		// 영양 게시물 수정하기
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "update noticeboard set type= ?, subject = ?, content = ? where boardno = ?";
		try {
			ps = conn.prepareStatement(sql);
			System.out.println("ffg" + boardno);
			ps.setString(1, type);
			ps.setString(2, subject);
			ps.setString(3, content);
			ps.setString(4, boardno);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
