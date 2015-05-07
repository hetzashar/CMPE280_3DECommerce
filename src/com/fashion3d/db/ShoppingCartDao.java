package com.fashion3d.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fashion3d.beans.Products;
import com.fashion3d.beans.ShoppingCart;

public class ShoppingCartDao {

	public static int saveToCart(int productId, int noOfItems, int userId, float totalPrice, String modifiedColor) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		int i=0;
		try {  
			conn=ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("INSERT into shopping_cart(product_id, totalItems, user_id, total_price, modified_color, complete_transaction, order_date) values (?,?,?,?,?,?,?)");  
		
			pst.setInt(1,productId);  
			pst.setInt(2,noOfItems);        
			pst.setInt(3,userId);
			pst.setFloat(4,totalPrice);
			pst.setString(5,modifiedColor);
			pst.setString(6,"N");
			pst.setTimestamp(7, new Timestamp(new Date().getTime()));

			pst.executeUpdate();
			//rs = pst.getGeneratedKeys();
			//if (rs.next()) {
			  //  i = rs.getInt(rs.getString("cart_id"));
			//}
			return 0;
		} catch (Exception e) {  
			System.out.println(e);  
		} finally {  
			if(conn!=null){
				ConnectionPool.addConnectionBackToPool(conn);
			}
			if (pst != null) {  
				try {  
					pst.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
			if (rs != null) {  
				try {  
					rs.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
		}  
		return -1;
	}	
	public static void updateShoppingCart(String completeTransaction, int noOfItems, float totalPrice, String modifiedColor, int cartId) {          
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		int i=0;
		try {  
			conn=ConnectionPool.getConnectionFromPool();
			String sql;
			if(completeTransaction.equals("Y")){
				pst = conn.prepareStatement("UPDATE shopping_cart "
						+ "SET complete_transaction=?, order_date=? WHERE CART_ID=?");  
			
				pst.setString(1,completeTransaction);
				pst.setTimestamp(2, new Timestamp(new Date().getTime()));
				pst.setInt(3, cartId);
				System.out.println(pst.toString());
			}else{
				pst = conn.prepareStatement("UPDATE shopping_cart "
						+ "SET totalItems=?, total_price=? WHERE CART_ID=?");  
			
				pst.setInt(1,noOfItems);        
				pst.setFloat(2, totalPrice);
				pst.setInt(3, cartId);
			}

			

			i = pst.executeUpdate();
		} catch (Exception e) {  
			System.out.println(e);  
		} finally {  
			if(conn!=null){
				ConnectionPool.addConnectionBackToPool(conn);
			}
			if (pst != null) {  
				try {  
					pst.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
			if (rs != null) {  
				try {  
					rs.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
		}  
	}
	
	public static void deleteShoppingCart(int cartId) {          
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		try {  
			conn=ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("DELETE FROM SHOPPING_CART WHERE CART_ID=?");  
		
			pst.setInt(1,cartId);  
			System.out.println(pst.toString());
			pst.executeUpdate();
			
		} catch (Exception e) {  
			System.out.println(e);  
		} finally {  
			if(conn!=null){
				ConnectionPool.addConnectionBackToPool(conn);
			}
			if (pst != null) {  
				try {  
					pst.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
			if (rs != null) {  
				try {  
					rs.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
		}  
	}
	
	public static List<ShoppingCart> fetchShoppingCart(int userId) {          
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		List<ShoppingCart> cartList = new ArrayList<ShoppingCart>();
		try {  
			conn=ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("SELECT sc.cart_id cartId, sc.product_id prodId, sc.totalItems totalItems, sc.user_id userId, sc.total_price totalPrice, sc.complete_transaction, "
					+ "sc.modified_color modifiedColor, sc.order_date orderDate, p.product_name PRODUCT_NAME, p.buyers_count BUYERS_COUNT, p.product_description PRODUCT_DESCRIPTION, p.tn_image_path TN_IMAGE_PATH, p.price PRICE, p.title title"
					+ " FROM SHOPPING_CART SC, PRODUCTS P WHERE SC.USER_ID=? "
					+ " AND SC.COMPLETE_TRANSACTION='N' AND SC.PRODUCT_ID=P.PRODUCT_ID");  
		
			pst.setInt(1,userId);  
			System.out.println(pst.toString());
			rs = pst.executeQuery();
			
			while(rs.next()){
				ShoppingCart cart=new ShoppingCart();
				cart.setCartId(rs.getInt("cartId"));
				cart.setUserId(rs.getInt("userId"));
				cart.setProductId(rs.getInt("prodId"));
				cart.setTotalItems(rs.getInt("totalItems"));
				cart.setPriceOfTotalItems(rs.getFloat("totalPrice"));
				cart.setIsCompleteTransaction("N");
				cart.setModifiedColor(rs.getString("modifiedColor"));
				cart.setOrderDate(rs.getTimestamp("orderDate"));

				Products bean=new Products();
				bean.setProductName(rs.getString("PRODUCT_NAME"));
				bean.setBuyersCount(rs.getInt("BUYERS_COUNT"));
				bean.setTnImagePath(rs.getString("TN_IMAGE_PATH"));
				bean.setProductDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getFloat("PRICE"));
				bean.setTitle(rs.getString("title"));
				cart.setProducts(bean);
				cartList.add(cart);
			}
			
		} catch (Exception e) {  
			System.out.println(e);  
		} finally {  
			if(conn!=null){
				ConnectionPool.addConnectionBackToPool(conn);
			}
			if (pst != null) {  
				try {  
					pst.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
			if (rs != null) {  
				try {  
					rs.close();  
				} catch (SQLException e) {  
					e.printStackTrace();  
				}  
			}  
		} 
		return cartList;
	}
	
	
}
