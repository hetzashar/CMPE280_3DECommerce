package com.fashion3d.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;


public class UserDao {
	public static boolean validates(String uname) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;

		try {  
			conn=ConnectionPool.getConnectionFromPool();
			System.out.println(uname);

			pst = conn.prepareStatement("select * from userlog where username=?");  

			pst.setString(1, uname);  

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

	public static int register(String username,String fname,String lname,String email,String password,String enabled) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		int i=0;
		try {  
			conn=ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("INSERT into userlog(username, fname, lname, email, password, enabled, lastlogin) values (?,?,?,?,?,?,?)");  
			
			pst.setString(1,username);  
			pst.setString(2,fname);        
			pst.setString(3,lname);
			pst.setString(4,email);
			pst.setString(5,password);
			pst.setString(6,enabled);
			pst.setTimestamp(7, new Timestamp(new Date().getTime()));

			i = pst.executeUpdate();
			return i;
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
		return i;  
	}  
}
