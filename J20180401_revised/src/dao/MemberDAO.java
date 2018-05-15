package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private static MemberDAO instance;

	private MemberDAO() {
	}

	public static MemberDAO getInstance() {
		// Singleton Pattern
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	private Connection getConnection() {
		// DB 연결 DBCP
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

	// 로그인 체크 함수
	public int memLogin(String id, String pw) throws SQLException {
		int result = 0; // 결과 받는 변수
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select pw from member where id=? and memDel='N'";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				if (pw.equals(rs.getString("pw"))) {
					result = 1; // id pw 일치
				} else {
					result = 0; // pw 불일치
				}
			} else {
				result = -1; // id 없음
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
		return result;
	}

	public MemberDTO getMemInfo(String id) throws SQLException {
		// 회원번호 찾기 매소드
		MemberDTO memInfo = new MemberDTO(); // 회원 정보 받을 변수
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select memno,manage from member where id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				memInfo.setMemno(rs.getString("memno")); // 회원 아이디가 있으면 회원 번호 받음
				memInfo.setManage(rs.getString("manage")); // 회원의 관리자 여부 받음
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
		return memInfo;
	}

	public MemberDTO getMember(String memNo) throws SQLException {
		// 회원 정보 가져오기 매소드
		MemberDTO member = new MemberDTO();
		Connection conn = getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from member where memno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memNo);
			rs = ps.executeQuery();
			if (rs.next()) {
				// 있을 경우 회원 정보 가져오기
				member.setId(rs.getString("id"));
				member.setMemno(rs.getString("memno"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setTel(rs.getString("tel"));
				member.setAddr(rs.getString("addr"));
				member.setEmail(rs.getString("email"));
				member.setRegdate(rs.getDate("regdate"));
				member.setManage(rs.getString("manage"));
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
		return member;
	}

	public int memUpdate(MemberDTO member) throws SQLException {
		// 회원 정보 변경 = 비밀번호, 전화, 주소, 이메일
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "update member set pw=?,tel=?,addr=?,email=? where memno=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, member.getPw());
			ps.setString(2, member.getTel());
			ps.setString(3, member.getAddr());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getMemno());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int memDelete(String memNo) throws SQLException {
		// 회원 탈퇴시 memDel = Y로 변경
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement ps = null;
		String sql = "update member set memdel='Y' where memno = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memNo);
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	// /////////////////준형 소스
	public int confirmId(String id) throws SQLException {
		// 아이디 중복확인
		int result = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id from member where id = ?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 1;
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
		return result;
	}

	public int memInsert(MemberDTO member, String authcheck, String idcheck)
			throws SQLException {
		// 회원가입 메소드
		int result = 0;
		if (authcheck.equals("false") || idcheck.equals("false")) {
			return result = 0;// 본인인증하지 않았을 경우 0을 반환
		}
		String maxnum = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql2 = "select to_char(max(TO_NUMBER(memno))+1) mx from member";
		String sql = "insert into member(memno,id,pw,name,tel,addr,email,regdate,manage,memdel) values(?,?,?,?,?,?,?,sysdate,?,?)";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql2);
			rs = ps.executeQuery();
			if (rs.next()) {
				maxnum = rs.getString("mx");
			}
			rs.close();
			ps.close();
			ps = conn.prepareStatement(sql);
			ps.setString(1, maxnum);
			ps.setString(2, member.getId());
			ps.setString(3, member.getPw());
			ps.setString(4, member.getName());
			ps.setString(5, member.getTel());
			ps.setString(6, member.getAddr());
			ps.setString(7, member.getEmail());
			ps.setString(8, "P");
			ps.setString(9, "N");
			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int findId(String email, String tel) throws SQLException {
		// 아이디 찾기 시 존재여부 확인 메소드
		int result = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id from member where email=? and tel=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, tel);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 1; // 아이디 찾기 성공
			} else {
				result = 0; // 아이디 찾기 실패(존재하지 않음)
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public String getId(String email, String tel) throws SQLException {
		// 요청한 아이디를 알려주는 메소드
		String id = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id from member where email=? and tel=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, tel);
			rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return id;
	}

	public int findPw(String email, String id) throws SQLException {
		// 비밀번호 찾기시 존재여부 확인 매소드
		int result = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select pw from member where email=? and id=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				result = 2;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public String getPw(String email, String id) throws SQLException {
		// 요청한 비밀번호를 알려주는 메소드
		String pw = "";
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select pw from member where email=? and id=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				pw = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		}
		return pw;
	}
}
