package gall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RecoListDao {
	private static RecoListDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/gall";
	
	private RecoListDao() {
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
	
	public static RecoListDao getInstance() {
		if (instance == null)
			instance = new RecoListDao();
		return instance;
	}
	
	public int insert(RecoList recoList) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into reco_list values(?,?,?,?)");
			pstmt.setInt(1, recoList.getPost_idx());
			pstmt.setString(2, recoList.getUser_ip());
			pstmt.setString(3, recoList.getDate());
			pstmt.setBoolean(4, recoList.isReco());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean isReco(RecoList recoList) {
		boolean isReco = false;
		try {
			pstmt = conn.prepareStatement("SELECT user_ip FROM reco_list where post_idx=? and date=? and isReco=?");
			pstmt.setInt(1, recoList.getPost_idx());
			pstmt.setString(2, recoList.getDate());
			pstmt.setBoolean(3, recoList.isReco());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isReco = true;
				return isReco;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isReco;
	}
}
