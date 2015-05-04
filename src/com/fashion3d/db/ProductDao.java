package com.fashion3d.db;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.fashion3d.beans.Products;

public class ProductDao {

	public static Products getProductBeanFromId(int productId) {

		ResultSet rs=null;
		java.sql.Connection con=null;
		java.sql.PreparedStatement ps=null;
		Products bean=new Products();
		try {
			con = ConnectionPool.getConnectionFromPool();

			ps = con.prepareStatement("SELECT * FROM PRODUCTS WHERE product_id=?");
			ps.setInt(1, productId);
			rs = ps.executeQuery();

			while (rs.next()) {
				String category=rs.getString("CATEGORY");
				bean = new Products();
				bean.setProductId(rs.getInt("PRODUCT_ID"));
				bean.setCategory(category);
				bean.setProductName(rs.getString("PRODUCT_NAME"));
				bean.setProductCount(rs.getInt("PRODUCT_COUNT"));
				bean.setBuyersCount(rs.getInt("BUYERS_COUNT"));
				bean.setTnImagePath(rs.getString("TN_IMAGE_PATH"));
				bean.setInitialColor(rs.getString("INITIAL_COLOR"));
				bean.setAddedBy(rs.getInt("ADDED_BY"));
				bean.setProductDescription(rs.getString("PRODUCT_DESCRIPTION"));
				bean.setPrice(rs.getFloat("PRICE"));
				bean.setImagePath(rs.getString("BIG_IMAGE_PATH"));
				bean.setTitle(rs.getString("TITLE"));
			}
			

		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally{
			if(rs!=null)
			{
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
	 			}
			}
			if(ps!=null)
			{
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null)
			{
				try {
					ConnectionPool.addConnectionBackToPool(con);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return bean;
	
	}
}
