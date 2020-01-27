package store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//커넥션풀로부터 커넥션을 얻기 위한 메서드
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		
		//커넥션풀 얻기
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		
		//커넥션풀로부터 커넥션 객체 얻기
		con = ds.getConnection();
		
		return con;
		
	}//getConnection()
	
	//자원 해제 하기 위한 메서드
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch (Exception e) {
			System.out.println("freeResource()메서드에서 오류" + e);
		}
	}//freeResource()

//-----------------------------------------------------------------------------------------

	//장바구니 DB에 저장
	public void insertCart(CartBean cartBean) {
		try {
			con = getConnection();
			sql = "INSERT INTO cart(customer_id, item_code, cart_qty) VALUES (?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartBean.getCustomer_id());
			pstmt.setInt(2, cartBean.getItem_code());
			pstmt.setInt(3, cartBean.getCart_qty());
			
			System.out.println(sql);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}

	}//insertCart()

	//장바구니 중복확인
	public int listCart(String customer_id, int item_code) {
		int cartCheck = 0;//1 : 중복 0 : 중복아님
		
		try {
			con = getConnection();
			sql = "SELECT * FROM cart WHERE customer_id = ? AND item_code = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			pstmt.setInt(2, item_code);
			
			System.out.println(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				cartCheck = 1;
			} else {
				cartCheck = 0;
			}
			
		} catch (Exception e) {
			System.out.println("listCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return cartCheck;
	}//listCart()

	//장바구니 목록 보기
	public List<CartBean> viewCart(String customer_id) {
		List<CartBean> cartList = new ArrayList<CartBean>();
		
		try {
			con = getConnection();
			sql = "SELECT c.cart_code, c.customer_id, c.item_code, c.cart_qty, c.cart_status, i.item_name, i.item_image, i.sale_price "
					+ "FROM cart c JOIN item i "
					+ "ON c.item_code = i.item_code "
					+ "WHERE c.customer_id = ? AND c.cart_status = 0";//미결제상태 조회
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			
			System.out.println(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int cart_code = rs.getInt("cart_code");
			//	String customer_id = rs.getString("customer_id");//중복이라서
				int item_code = rs.getInt("item_code");
				int cart_qty = rs.getInt("cart_qty");
				int cart_status = rs.getInt("cart_status");
				String item_name = rs.getString("item_name");
				String item_image = rs.getString("item_image");
				int sale_price = rs.getInt("sale_price");
				
				CartBean cartBean = new CartBean();
				
				cartBean.setCart_code(cart_code);
				cartBean.setCustomer_id(customer_id);
				cartBean.setItem_code(item_code);
				cartBean.setCart_qty(cart_qty);
				cartBean.setCart_status(cart_status);
				cartBean.setItem_name(item_name);
				cartBean.setItem_image(item_image);
				cartBean.setSale_price(sale_price);
				
				cartList.add(cartBean);				
			}	
								
		} catch (Exception e) {
			System.out.println("viewCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}

		return cartList;
	}//viewCart()

	//장바구니 담긴 개수 확인
	public int countCart(String customer_id) {
		int cartCount = 0;
		
		try {
			con = getConnection();
			sql = "SELECT count(*) as 'cartCount' FROM cart WHERE customer_id = ? AND cart_status = 0";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, customer_id);
			
			System.out.println(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();

			cartCount = rs.getInt("cartCount");
			
			System.out.println(cartCount);
			
		} catch (Exception e) {
			System.out.println("countCart()메서드에서 오류" + e);
		} finally {
			freeResource();
		}
		
		return cartCount;
	}//countCart()
	
	
	
}//CartDAO
