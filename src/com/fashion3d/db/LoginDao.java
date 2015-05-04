package com.fashion3d.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

	public static boolean validate(String name, String pass) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;

		try {  
			conn=ConnectionPool.getConnectionFromPool();
			System.out.println(name+pass);

			pst = conn.prepareStatement("select * from userlog where username=? and password=?");  

			pst.setString(1, name);  
			pst.setString(2, pass); 

			rs = pst.executeQuery(); 

			status = rs.next();  
			System.out.println("status o/p" +status);
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
		return status;  
	}  
}  
