package gall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchDao {
	private static SearchDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/gall";
	
	private SearchDao() {
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
	
	public static SearchDao getInstance() {
		if (instance == null)
			instance = new SearchDao();
		return instance;
	}
	
	public ArrayList<Search> select(String ip) {
		ArrayList<Search> list = new ArrayList<Search>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM search where ip=?");
			pstmt.setString(1, ip);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Search search = new Search();
				search.setIdx(rs.getInt("idx"));
				search.setWord(rs.getString("word"));
				list.add(search);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Search search) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into search(word,ip) values(?,?)");
			pstmt.setString(1, search.getWord());
			pstmt.setString(2, search.getIp());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(int idx) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from search where idx = ?");
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteAll(String ip) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from search where ip = ?");
			pstmt.setString(1, ip);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int wordCheck(Search search) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM search where ip=? and word=?");
			pstmt.setString(1, search.getIp());
			pstmt.setString(2, search.getWord());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pstmt = conn.prepareStatement("delete from search where ip=? and word=?");
				pstmt.setString(1, search.getIp());
				pstmt.setString(2, search.getWord());
				result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
