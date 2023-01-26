package gall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	private static UserDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/gall";
	
	private UserDao() {
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
	
	public static UserDao getInstance() {
		if (instance == null)
			instance = new UserDao();
		return instance;
	}
	
	public User select(String code) {
		User user = new User();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user where code=?");
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setCode(rs.getString("code"));
				user.setPw(rs.getString("pw"));
				user.setNick(rs.getString("nick"));
				user.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public List<User> selectAll() {
		List<User> list = new ArrayList<User>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				User user = new User();
				user.setCode(rs.getString("code"));
				user.setPw(rs.getString("pw"));
				user.setNick(rs.getString("nick"));
				user.setEmail(rs.getString("email"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(User user) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into user values(?,?,?,?,?)");
			pstmt.setString(1, user.getCode());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getNick());
			pstmt.setString(4, user.getEmail());
			pstmt.setBoolean(5, user.isFixed());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(User user) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update user set pw = ? where code = ?");
			pstmt.setString(1, user.getPw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String code) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from user where code = ?");
			pstmt.setString(1, code);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean codeCheck(String code) {
		boolean useable = true;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user where code=?");
			pstmt.setString(1, code);
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
	
	public boolean isFixed(String code) {
		boolean isFixed = false;
		try {
			pstmt = conn.prepareStatement("SELECT isFixed FROM user where code=?");
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isFixed = rs.getBoolean("isFixed");
				return isFixed;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isFixed;
	}
}