package friend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FriendDao {
	private static FriendDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/gall";
	
	private FriendDao() {
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
	
	public static FriendDao getInstance() {
		if (instance == null)
			instance = new FriendDao();
		return instance;
	}
	
	public Friend select(String code) {
		Friend friend = new Friend();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user where code=?");
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				friend.setCode(rs.getString("code"));
				friend.setPw(rs.getString("pw"));
				friend.setNick(rs.getString("nick"));
				friend.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return friend;
	}
	
	public List<Friend> selectAll() {
		List<Friend> list = new ArrayList<Friend>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM user");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Friend friend = new Friend();
				friend.setCode(rs.getString("code"));
				friend.setPw(rs.getString("pw"));
				friend.setNick(rs.getString("nick"));
				friend.setEmail(rs.getString("email"));
				list.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Friend friend) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into user values(?,?,?,?)");
			pstmt.setString(1, friend.getCode());
			pstmt.setString(2, friend.getPw());
			pstmt.setString(3, friend.getNick());
			pstmt.setString(4, friend.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(Friend friend) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update user set pw = ? where id = ?");
			pstmt.setString(1, friend.getPw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from user where id = ?");
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
			pstmt = conn.prepareStatement("SELECT * FROM user where id=?");
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