package mall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	private static MemberDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/mall";
	
	private MemberDao() {
		try {
			Class.forName(driver);
			System.out.println("MySQL 드라이버 검색 성공...");
			
			conn = DriverManager.getConnection(dbURL, user, pass);
			System.out.println("MySQL 연결 성공...\n");
		}
		catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버 검색 오류");
		}
		catch (SQLException e) {
			System.out.println("MySQL 연결 객체 생성 실패" + e);
		}
	}
	
	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}
	
	public Member selectOne(String id) {
		Member member = new Member();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				member.setRegist_day(rs.getString("regist_day"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int insert(Member member) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into member values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getBirth());
			pstmt.setString(6, member.getEmail());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getRegist_day());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(Member member) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update member set pw=?,name=?,gender=?,birth=?,email=?,phone=?,address=? where id = ?");
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getBirth());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from member where id = ?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean idCheck(String id) {
		boolean useable = true;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM member where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				useable = false;
				return useable;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return useable;
	}
}
