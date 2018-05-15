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

public class SearchDAO {
	private static final char HANGUL_BEGIN_UNICODE = 44032; // 한글 유니코드 시작 값
	private static final char HANGUL_BASE_UNIT = 588; // 자음 마다 가지는 글자수

	private static final char[] INITIAL_SOUND = { 'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ',
			'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ' };

	private static char getInitialSound(char c) {
		int hanBegin = (c - HANGUL_BEGIN_UNICODE);
		int index = hanBegin / HANGUL_BASE_UNIT;
		System.out.println("index---" + index);
		return INITIAL_SOUND[index];
	}

	private static SearchDAO instance;

	private SearchDAO() {
	}

	public static SearchDAO getInstance() {
		if (instance == null) {
			instance = new SearchDAO();
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

	// 선호도쪽 의사번호로 의과번호 찾기
	public DocDTO docSearch(String docNo) throws SQLException {
		DocDTO doctor = new DocDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select*from doctor where docNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				doctor.setDocNo(rs.getString(1));
				doctor.setDocName(rs.getString(2));
				doctor.setDeptNo(rs.getString(3));
			}
		} catch (Exception e) {
			System.out.println("선호도 서비스=>" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return doctor;
	}

	// 선호도가 높은 의사를 출력
	public List<DocADTO> docFavSelect() throws SQLException {
		List<DocADTO> list = new ArrayList<DocADTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs2 = null;

		// 그날의 선호도가 가장 높은 의사의 정보를 가져온다
		String sql1 = "select f.docno, count(f.docno) cnt, f.docreg_date,d.docname, d.deptno from favor f, doctor d where "
				+ "d.docno=f.docno and f.docreg_date = to_char(sysdate) group by f.docreg_date, f.docno, d.docname, d.deptno order by cnt desc";
		// 치료분야
		String sql5 = "select cureName from(select rownum rn,a.* from (select * from cure where docNo=?) a) "
				+ "where rn between 1 and 5 ";

		try {
			// 선호도가 큰 의사
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DocADTO doctor = new DocADTO();
				doctor.setDocNo(rs.getString(1));
				doctor.setFavor(rs.getString(2));
				doctor.setDocName(rs.getString(4));
				doctor.setDeptNo(rs.getString(5));
				pstmt2 = conn.prepareStatement(sql5);
				pstmt2.setString(1, doctor.getDocNo());
				rs2 = pstmt2.executeQuery();
				String cure = "";
				while (rs2.next()) {
					cure += rs2.getString(1) + " ";
					doctor.setCureName(cure);
				}
				if (list.size() < 2) {
					list.add(doctor);
				}
				rs2.close();
				pstmt2.close();

			}

		} catch (Exception e) {
			System.out.println("선호도 의료진 dao----->" + e.getMessage());
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

	// 선택한 의사의 정보를 가져온다.
	public DocADTO docList(String docNo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DocADTO doctor = new DocADTO();
		// 선택한 의사의 정보를 가져온다.
		String sql = "select * from doctor where docNo=?";

		// 선호도 카운트
		String sql2 = "SELECT COUNT(*) FROM favor where docno= ?";

		// 치료분야
		String sql3 = "select CURENAME from cure where docNo=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				doctor.setDocNo(rs.getString(1));
				doctor.setDocName(rs.getString(2));
				doctor.setDeptNo(rs.getString(3));
			}
			rs.close();
			pstmt.close();
			// 선호도 카운트
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				doctor.setFavor(rs.getString(1));
			}
			rs.close();
			pstmt.close();
			// 치료분야
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			String cure = "";
			while (rs.next()) {
				cure += rs.getString(1) + " ";
			}
			doctor.setCureName(cure);
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
		return doctor;
	}

	public List<String> institute(String docNo) throws SQLException {
		List<String> institute = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select docinstitute from institute where docNo=?";
		// 학회
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				institute.add(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("학회 dao=" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return institute;
	}

	public List<String> career(String docNo) throws SQLException {
		List<String> career = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select DOCCAREER from career where docNo=?";
		// 경력
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				career.add(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("경력 dao=" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		// 경력
		return career;
	}

	public List<DocADTO> docListA(String deptNo, String docField)
			throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		List<DocADTO> list = new ArrayList<DocADTO>();
		// 의사의 이름이나 질병으로 검색했을시에 해당하는 의사의 정보를 가져온다.
		String sql = "select * from doctor where docname like '%"
				+ docField
				+ "%' or docNo in(select docNo from cure where cureName like '%"
				+ docField + "%')";
		// 의과번호로 검색했을시에 해당하는 의사의 정보를 가져온다.
		String sql1 = "select * from doctor where deptNo=?";
		// 선호도 카운트
		String sql3 = "SELECT docno, COUNT(*) AS order_count FROM favor where "
				+ "docreg_date =(select to_char(sysdate,'YY/MM/DD') from dual) GROUP BY favor.docno having favor.docno= ?";
		// 치료분야
		String sql5 = "select cureName from(select rownum rn,a.* from (select * from cure where docNo=?) a) "
				+ "where rn between 1 and 5 ";
		String str = "";
		try {
			conn = getConnection();
			if (deptNo != null) {
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, deptNo);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					do {
						DocADTO doctor = new DocADTO();
						doctor.setDocNo(rs.getString(1));
						doctor.setDocName(rs.getString(2));
						doctor.setDeptNo(rs.getString(3));
						pstmt2 = conn.prepareStatement(sql5);
						pstmt2.setString(1, doctor.getDocNo());
						rs2 = pstmt2.executeQuery();
						str = "";
						while (rs2.next()) {
							str += rs2.getString(1) + " ";
							doctor.setCureName(str);
						}
						list.add(doctor);
						rs2.close();
						pstmt2.close();
					} while (rs.next());
					rs.close();
					pstmt.close();
				}
				// 진료분야가 공백이 아닐시에 조건문 실행
				if (!(docField.equals(""))) {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						do {
							DocADTO doctor = new DocADTO();
							doctor.setDocNo(rs.getString(1));
							doctor.setDocName(rs.getString(2));
							doctor.setDeptNo(rs.getString(3));
							pstmt2 = conn.prepareStatement(sql5);
							pstmt2.setString(1, doctor.getDocNo());
							rs2 = pstmt2.executeQuery();
							str = "";
							while (rs2.next()) {
								str += rs2.getString(1) + " ";
								doctor.setCureName(str);
							}
							list.add(doctor);
							rs2.close();
							pstmt2.close();
						} while (rs.next());
					}
				}
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

	public int Favor(String docNo, String memNo) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into favor values(?,to_char(sysdate,'YY/MM/DD'),?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docNo);
			pstmt.setString(2, memNo);
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

	public List<DeptDTO> deptListA() throws SQLException {

		List<DeptDTO> list = new ArrayList<DeptDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select deptno, deptname from DEPARTMENT";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DeptDTO dept = new DeptDTO();
				dept.setDeptNo(rs.getString(1));
				dept.setDeptName(rs.getString(2));
				list.add(dept);
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

	public List<DeptDTO> deptList(char c) throws SQLException {
		List<DeptDTO> list = new ArrayList<DeptDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select deptno, deptname from DEPARTMENT";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				DeptDTO dept = new DeptDTO();
				dept.setDeptNo(rs.getString("deptno"));
				dept.setDeptName(rs.getString("deptname"));
				char check = getInitialSound(dept.getDeptName().charAt(0));
				if (c == check) {
					list.add(dept);
				}
			}
		} catch (Exception e) {
			System.out.println("진료과 초성검색---" + e.getMessage());
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

	public DeptDTO deptInfo(String deptNo) throws SQLException {
		DeptDTO dept = new DeptDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select dept.deptNo,dept.deptname, f.deptforte from department dept, forte f where dept.deptno=? "
				+ "and f.deptno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptNo);
			pstmt.setString(2, deptNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dept.setDeptNo(rs.getString(1));
				dept.setDeptName(rs.getString(2));
				dept.setForte(rs.getString(3));
			}

		} catch (Exception e) {
			System.out.println("진료과 정보출력 ---->" + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return dept;
	}

	public List<DocDTO> docSelect(String docName, String deptNo, String cureName)
			throws SQLException {
		List<DocDTO> docList = new ArrayList<DocDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * " + "FROM "
				+ "(SELECT doc.docNo, docName, doc.deptNo, deptName, cureName "
				+ "FROM doctor doc, department dept, cure "
				+ "WHERE doc.deptno=dept.deptno "
				+ "AND doc.docNo=cure.docNo(+)) " + "WHERE docName LIKE '%"
				+ docName + "%' " + "OR deptNo=? " + "OR cureName LIKE '%"
				+ cureName + "%'";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptNo);
			rs = pstmt.executeQuery();
			int docNoEven = 0;
			int docNoOdd = 0;
			DocDTO docDTO = null;
			int count = 0;
			while (rs.next()) {
				if (count % 2 == 0) {
					docNoEven = Integer.parseInt(rs.getString("docNo")
							.substring(3));
				} else {
					docNoOdd = Integer.parseInt(rs.getString("docNo")
							.substring(3));
				}
				if (docNoEven == docNoOdd) {
					docDTO.accCureName(rs.getString("cureName"));
				} else {
					docDTO = new DocDTO();
					docDTO.setDocNo(rs.getString("docNo"));
					docDTO.setDocName(rs.getString("docName"));
					docDTO.setDeptNo(rs.getString("deptNo"));
					docDTO.setDeptName(rs.getString("deptName"));
					docDTO.setCureName(rs.getString("cureName"));
					docList.add(docDTO);
				}
				/*
				 * docDTO.setDocJSON("{\"docNo\":" + "\"" + docDTO.getDocNo() +
				 * "\"" + ",\"docName\":" + "\"" + docDTO.getDocName() + "\"" +
				 * ",\"deptNo\":" + "\"" + docDTO.getDeptNo() + "\"" + "}");
				 */
				count++;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return docList;
	}

	public List<DeptDTO> deptListSort() throws SQLException {

		List<DeptDTO> list = new ArrayList<DeptDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT deptno, deptname FROM department ORDER BY deptname";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DeptDTO dept = new DeptDTO();
				dept.setDeptNo(rs.getString(1));
				dept.setDeptName(rs.getString(2));
				list.add(dept);
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

	public List<String> timeSelect(String memNo, String docName, String deptNo,
			String appDate) throws SQLException {
		List<String> takenTimeList = new ArrayList<String>();
		String appTime = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT appTime " + "FROM appointment "
				+ "WHERE docNo=" + "(SELECT docNo " + "FROM doctor "
				+ "WHERE docName=? " + "AND deptNo=?) " + "AND appDate=? "
				+ "ORDER BY appTime";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, docName);
			pstmt.setString(2, deptNo);
			pstmt.setString(3, appDate);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				appTime = rs.getString("appTime");
				takenTimeList.add(appTime);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return takenTimeList;
	}

	public int appInsert(String memNo, String docName, String deptNo,
			String date, String time, String appRes) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO appointment "
				+ "VALUES(?,(SELECT docNo FROM doctor WHERE docName=? AND deptNo=?),?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			pstmt.setString(2, docName);
			pstmt.setString(3, deptNo);
			pstmt.setString(4, date);
			pstmt.setString(5, time);
			pstmt.setString(6, appRes);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return result;
	}

	public MemberDTO selectMemInfo(String memNo) throws SQLException {
		MemberDTO memberDTO = new MemberDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT name, tel, email " + "FROM member "
				+ "WHERE memNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				memberDTO.setName(rs.getString("name"));
				memberDTO.setTel(rs.getString("tel"));
				memberDTO.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return memberDTO;
	}

	public String selectDeptInfo(String deptNo) throws SQLException {
		String deptName = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT deptName " + "FROM department " + "WHERE deptNo=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, deptNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				deptName = rs.getString("deptName");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return deptName;
	}

	/*
	 * public List<String> selectDeptNameList(String deptNo) throws
	 * SQLException{ List<String> deptNameList = new ArrayList<String>();
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; String sql = "SELECT deptName " + "FROM department " +
	 * "WHERE deptNo=?"; try { conn = getConnection(); pstmt =
	 * conn.prepareStatement(sql); pstmt.setString(1, deptNo); rs =
	 * pstmt.executeQuery(); if(rs.next()){ deptName = rs.getString("deptName");
	 * } } catch (SQLException e) { System.out.println(e.getMessage()); }
	 * finally { if(rs != null){ rs.close(); } if(pstmt != null){ pstmt.close();
	 * } if(conn != null){ conn.close(); } } return deptNameList; }
	 */

	public int getTotalCnt(String memNo) throws SQLException {
		Connection conn = null;
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from appointment "
				+ "where to_char(sysdate, 'yy/MM/dd') <= appdate "
				+ "and memNo = ?";
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

	public int getTotalCnt2(String memNo) throws SQLException {
		Connection conn = null;
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from appointment "
				+ "where to_char(sysdate, 'yy/MM/dd') > appdate "
				+ "and memNo = ?";
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

	// 예약 정보 조회
	public List<AppointmentDTO2> checklist(String memNo, int startRow,
			int endRow) throws SQLException {
		List<AppointmentDTO2> checklist = new ArrayList<AppointmentDTO2>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rownum rn, a.* from "
				+ "(select distinct app.memno, app.appdate, app.apptime, app.appres, "
				+ "app.docno, doc.docname, doc.deptno, dep.deptname "
				+ "from appointment app, doctor doc, department dep "
				+ "where app.docno = doc.docno "
				+ "and doc.deptno = dep.deptno and app.memno = ? "
				+ "and to_char(sysdate, 'yy/MM/dd') <= appdate "
				+ "order by appdate desc, apptime desc) a)"
				+ "where rn between ? and ?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AppointmentDTO2 appdto = new AppointmentDTO2();
				appdto.setDeptName(rs.getString("deptname"));
				appdto.setDocName(rs.getString("docname"));
				appdto.setAppDate(rs.getString("appdate"));
				appdto.setAppTime(rs.getString("apptime"));
				appdto.setAppRes(rs.getString("appres"));
				checklist.add(appdto);
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
		return checklist;
	}

	// 예약 취소
	public int delete(String memNo, String appdate, String apptime)
			throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete appointment where memno=? and appdate=? and apptime=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			pstmt.setString(2, appdate);
			pstmt.setString(3, apptime);
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

	public int update(AppointmentDTO2 appdto) throws SQLException {
		int result1 = 0;
		int result2 = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql1 = "update appointment set docno=? appdate=?, apptime=?, appres=? where memno=?";
		/*
		 * String sql2 = "update department set deptname=? where deptno=" +
		 * "(select deptno from doctor where docno =" +
		 * "(select docno from appointment where memno = ?))"; String sql3 =
		 * "update doctor set docname=? where docno=" +
		 * "(select docno from appointment where memno = ?)";
		 */
		String sql4 = "select apptime from appointment where docno=?";
		// 예약 수정 시 의료진, 예약 날짜는 모두 중복되도 상관 없지만 시간까지 겹치면 예약 중복으로 수정이 불가능해짐

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, appdto.getDocNo());
			pstmt.setString(2, appdto.getAppDate());
			pstmt.setString(3, appdto.getAppTime());
			pstmt.setString(4, appdto.getAppRes());
			pstmt.setString(5, appdto.getMemNo());
			result1 = pstmt.executeUpdate();
			/*
			 * pstmt.close(); pstmt = conn.prepareStatement(sql2);
			 * pstmt.setString(1, appdto.getDeptname()); pstmt.setString(2,
			 * appdto.getMemno()); result1 = pstmt.executeUpdate();
			 * pstmt.close(); pstmt = conn.prepareStatement(sql3);
			 * pstmt.setString(1, appdto.getDocname()); pstmt.setString(2,
			 * appdto.getMemno()); result1 = pstmt.executeUpdate();
			 */
			pstmt = conn.prepareStatement(sql4);
			pstmt.setString(1, appdto.getDocNo());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if (appdto.getAppTime().equals(rs.getString("apptime"))) {
					result2 = 1;
				} else {
					result2 = 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result2;
	}

	// 과거 진료 내역
	public List<AppointmentDTO2> history(String memNo, int startRow, int endRow)
			throws SQLException {
		List<AppointmentDTO2> history = new ArrayList<AppointmentDTO2>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ( select rownum rn, a.* from "
				+ "(select distinct app.memno, app.appdate, app.apptime, app.appres, "
				+ "app.docno, doc.docname, doc.deptno, dep.deptname "
				+ "from appointment app, doctor doc, department dep "
				+ "where app.docno = doc.docno "
				+ "and doc.deptno = dep.deptno and app.memno = ? "
				+ "and to_char(sysdate, 'yy/MM/dd') > appdate "
				+ "order by appdate desc, apptime desc) a)"
				+ "where rn between ? and ?";
		// 과거 진료 내역 조회에 필요한 정보 끌어오기 : 진료과, 의료진, 진료 날짜, 진료 시간, 진료예약 사유
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AppointmentDTO2 appdto = new AppointmentDTO2();

				appdto.setDeptName(rs.getString("deptname"));
				appdto.setDocName(rs.getString("docname"));
				appdto.setAppDate(rs.getString("appdate"));
				appdto.setAppTime(rs.getString("apptime"));
				appdto.setAppRes(rs.getString("appres"));
				history.add(appdto);
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
		return history;
	}// 기간별 과거 진료 내역 조회하기(선택한 두 날짜 사이에 존재하는 진료 내역 조회)

	public List<AppointmentDTO2> datesearch(String memNo, int startRow,
			int endRow, String date1, String date2) throws SQLException {
		List<AppointmentDTO2> datesearch = new ArrayList<AppointmentDTO2>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from ( select rownum rn, a.* from "
				+ "(select distinct app.memno, app.appdate, app.apptime, app.appres, "
				+ "app.docno, doc.docname, doc.deptno, dep.deptname "
				+ "from appointment app, doctor doc, department dep "
				+ "where app.docno = doc.docno "
				+ "and doc.deptno = dep.deptno and app.memno = ? "
				+ "and appdate between ? and ? "
				+ "order by appdate desc, apptime desc) a)"
				+ "where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
			pstmt.setString(2, date1);
			pstmt.setString(3, date2);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AppointmentDTO2 appdto = new AppointmentDTO2();
				appdto.setDeptName(rs.getString("deptname"));
				appdto.setDocName(rs.getString("docname"));
				appdto.setAppDate(rs.getString("appdate"));
				appdto.setAppTime(rs.getString("apptime"));
				appdto.setAppRes(rs.getString("appres"));
				datesearch.add(appdto);
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
		return datesearch;
	}
}
