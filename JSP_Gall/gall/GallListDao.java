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
	
	public GallList selectOne(Integer idx) {
		GallList gall = new GallList();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM gall_list where idx=?");
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				gall.setName(rs.getString("name"));
				gall.setType(rs.getString("type"));
				gall.setDesc(rs.getString("desc"));
				gall.setCategory(rs.getString("category"));
				gall.setAdmin(rs.getString("admin"));
				gall.setSub_admin(rs.getString("sub_admin"));
				gall.setDate(rs.getString("date"));
				gall.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return gall;
	}
	
	public int selectIdx(String name) {
		int idx = 0;
		try {
			pstmt = conn.prepareStatement("SELECT idx FROM gall_list where name=?");
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if (rs.next())
				idx = rs.getInt("idx");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idx;
	}
	
	public int insert(GallList gall) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into gall_list(name,type,`desc`,category,admin,date,image) values(?,?,?,?,?,?,?)");
			pstmt.setString(1, gall.getName());
			pstmt.setString(2, gall.getType());
			pstmt.setString(3, gall.getDesc());
			pstmt.setString(4, gall.getCategory());
			pstmt.setString(5, gall.getAdmin());
			pstmt.setString(6, gall.getDate());
			pstmt.setString(7, gall.getImage());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
