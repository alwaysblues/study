package ex.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	public static final int MEMBER_NONEXISTENT = 0;
	public static final int MEMBER_EXISTENT= 1;
	public static final int MEMBER_JOIN_FAIL= 0;
	public static final int MEMBER_JOIN_SUCCESS= 1;
	public static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	public static final int MEMBER_LOGIN_SUCCESS = 1;
	public static final int MEMBER_LOGIN_IS_NOT= -1;
	private static MemberDAO instance = new MemberDAO();
	private Connection con = null;
	
	private MemberDAO() {
		
	}
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection getConnection(){
		Context context = null;
		DataSource ds = null;
		
		try {
			// 커넥션풀에서 커넥션 객체를 가져와서 리턴
			context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/Mysql");
			con = ds.getConnection();
			
			
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return con;
		
	}
	
	public int insertMember(MemberVO vo) {
		System.out.println("insert문 실행");
		int ri = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member (id,pw,name,email,address) values (?,?,?,?,?)";
		/**
		String sql = "insert into member "
				+ "(id,pw,name,email.address)"
				+" values (?,?,?,?,?)";
		**/
		try {
		con = getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getId());
		pstmt.setString(2, vo.getPw());
		pstmt.setString(3, vo.getName());
		pstmt.setString(4, vo.getEmail());
		pstmt.setString(5, vo.getAddress());
		pstmt.executeUpdate();
		ri = MEMBER_JOIN_SUCCESS;
		
		} catch (Exception e) {
		
			e.printStackTrace();
			
		} finally {
			try {
				
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();

			} catch (Exception e) {
			
				e.printStackTrace();
				
			}
		
		
		return ri;
		
	}
	
		
		
	}
	public int checkId(String id) {
		System.out.println("check id");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ri = 0;
		String sql = "select id from member where id = ?";
		
		try {
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ri = MemberDAO.MEMBER_EXISTENT;
				
			} else {
				
				ri = MemberDAO.MEMBER_NONEXISTENT;
			}
			
			
		} catch (Exception e) {

			e.printStackTrace();
			
		} finally {
			try {
				
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();

			} catch (Exception e) {
			
				e.printStackTrace();
				
			}
		
		}
		
				
		return ri;
	}
	
	
	public int userCheck(String id,String pw) {
		System.out.println("check id");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ri = 0;
		String dbpw; 
		String sql = "select pw from member where id = ?";
		
		try {
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)) {
					ri = MemberDAO.MEMBER_LOGIN_SUCCESS;
				} else {
					ri = MemberDAO.MEMBER_LOGIN_PW_NO_GOOD;
					
				}
				
			} else {
				ri = MemberDAO.MEMBER_LOGIN_SUCCESS;
				ri = MemberDAO.MEMBER_EXISTENT;
			}
				
			} catch (Exception e) {

			e.printStackTrace();
			
			} finally {
				try {
					
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
	
				} catch (Exception e) {
				
					e.printStackTrace();
					
				}
		
			}
	
			return ri;
		}
	

	
	public MemberVO selectUser(String id, String pw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO vo = new MemberVO();
		String id1,pw2,name,email,address;
		String sql = "select id,pw,name,email,address from member where id = ? and pw = ?";
		
		try {
			
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				id1 = rs.getString("id");
				pw2 = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				address = rs.getString("address");
				vo.setId(id1);
				vo.setPw(pw2);
				vo.setName(name);
				vo.setEmail(email);
				vo.setAddress(address);
				
			} else {
				// 비밀번호 틀렸을때 처리
			}
				
		} catch (Exception e) {

			e.printStackTrace();
			
		} finally {
			try {
					
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
	
				} catch (Exception e) {
				
					e.printStackTrace();
					
				}
		}
	
		return vo;
			
	}


}
