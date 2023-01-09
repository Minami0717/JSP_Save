package gall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GallListDao {
	private static GallListDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/gall";
	
	private GallListDao() {
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
	
	public static GallListDao getInstance() {
		if (instance == null)
			instance = new GallListDao();
		return instance;
	}
	
	public List<GallList> selectAll() {
		List<GallList> list = new ArrayList<GallList>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM gall_list");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GallList gall = new GallList();
				gall.setIdx(rs.getInt("idx"));
				gall.setName(rs.getString("name"));
				list.add(gall);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
