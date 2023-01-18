package mall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
	private static OrderDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/mall";
	
	private OrderDao() {
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
	
	public static OrderDao getInstance() {
		if (instance == null)
			instance = new OrderDao();
		return instance;
	}
	
	public List<Order> selectAll(String m_id) {
		List<Order> list = new ArrayList<Order>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM order_list where member_id=?");
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Order order = new Order();
				order.setIdx(rs.getInt("idx"));
				order.setDate(rs.getString("date"));
				order.setProduct(rs.getString("product"));
				order.setPrice(rs.getInt("price"));
				order.setCount(rs.getInt("count"));
				list.add(order);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(Order order) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into order_list(date,product,price,count,member_id) values(?,?,?,?,?)");
			pstmt.setString(1, order.getDate());
			pstmt.setString(2, order.getProduct());
			pstmt.setInt(3, order.getPrice());
			pstmt.setInt(4, order.getCount());
			pstmt.setString(5, order.getMember_id());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(int idx) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from order_list where idx=?");
			pstmt.setInt(1, idx);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
