package mall;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
	private static ProductDao instance;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	String driver = "com.mysql.cj.jdbc.Driver";
	String user = "root";
	String pass = "1111";
	String dbURL = "jdbc:mysql://localhost:3306/mall";
	
	private ProductDao() {
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
	
	public static ProductDao getInstance() {
		if (instance == null)
			instance = new ProductDao();
		return instance;
	}
	
	public List<Product> selectAll() {
		List<Product> list = new ArrayList<Product>();
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM products");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				product.setMaker(rs.getString("maker"));
				product.setCategory(rs.getString("category"));
				product.setCondition(rs.getString("state"));
				product.setImage(rs.getString("image"));
				product.setStock(rs.getInt("stock"));
				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Product selectOne(String id) {
		Product product = new Product();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM products where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				product.setMaker(rs.getString("maker"));
				product.setCategory(rs.getString("category"));
				product.setCondition(rs.getString("state"));
				product.setImage(rs.getString("image"));
				product.setStock(rs.getInt("stock"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public int insert(Product product) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insert into products values(?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, product.getId());
			pstmt.setString(2, product.getName());
			pstmt.setInt(3, product.getPrice());
			pstmt.setString(4, product.getDescription());
			pstmt.setString(5, product.getMaker());
			pstmt.setString(6, product.getCategory());
			pstmt.setInt(7, product.getStock());
			pstmt.setString(8, product.getCondition());
			pstmt.setString(9, product.getImage());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int update(Product product) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("update products set name=?,price=?,description=?,maker=?,category=?,stock=?,state=? where id = ?");
			pstmt.setString(1, product.getName());
			pstmt.setInt(2, product.getPrice());
			pstmt.setString(3, product.getDescription());
			pstmt.setString(4, product.getMaker());
			pstmt.setString(5, product.getCategory());
			pstmt.setInt(6, product.getStock());
			pstmt.setString(7, product.getCondition());
			pstmt.setString(8, product.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int result = 0;
		try {
			pstmt = conn.prepareStatement("delete from products where id = ?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
