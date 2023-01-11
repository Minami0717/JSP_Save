package mall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
	private static PostDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/mall";
	
	private PostDao() {
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
	
	public static PostDao getInstance() {
		if (instance == null)
			instance = new PostDao();
		return instance;
	}
	
	public List<Post> selectAll() {
		List<Post> list = new ArrayList<Post>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM post");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Post post = new Post();
				post.setIdx(rs.getInt("idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setWriter(rs.getString("writer"));
				post.setDate(rs.getString("date"));
				post.setHits(rs.getInt("hits"));
				list.add(post);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Post select(Integer idx) {
		Post post = new Post();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM post where idx=?");
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				post.setIdx(rs.getInt("idx"));
				post.setTitle(rs.getString("title"));
				post.setContent(rs.getString("content"));
				post.setWriter(rs.getString("writer"));
				post.setDate(rs.getString("date"));
				post.setHits(rs.getInt("hits"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public int updateReply(Integer idx) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update post set replyNum=replyNum+1 where idx=?");
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int insert(Post post) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into post(title,content,writer,date) values(?,?,?,?)");
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getWriter());
			pstmt.setString(4, post.getDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(Post post) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update post set hits=hits+1 where idx = ?");
			pstmt.setInt(1, post.getIdx());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
