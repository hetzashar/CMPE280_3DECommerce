package com.fashion3d.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.fashion3d.beans.Users;

public class LoginDao {

	public static Users validate(String name, String pass) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		Users user=null;
		try {  
			conn=ConnectionPool.getConnectionFromPool();
			System.out.println(name+pass);

			pst = conn.prepareStatement("select * from userlog where username=? and password=?");  

			pst.setString(1, name);  
			pst.setString(2, pass); 

			rs = pst.executeQuery(); 
			
			if(rs.next()){
				user=new Users();
				user.setEmail(rs.getString("email"));
				user.setFname(rs.getString("fname"));
				user.setLname(rs.getString("lname"));
				user.setUsername(rs.getString("username"));
				user.setLastLoggedIn(rs.getTimestamp("lastlogin"));
				user.setUserId(rs.getInt("Id"));
			}
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
		return user;  
	}
	
	public static int update(int userId) {          
		boolean status = false;  
		PreparedStatement pst = null;  
		ResultSet rs = null;  
		Connection conn=null;
		int i=0;
		try {  
			conn=ConnectionPool.getConnectionFromPool();

			pst = conn.prepareStatement("UPDATE USERLOG SET LASTLOGIN=? WHERE ID=?");  
			
			pst.setTimestamp(1, new Timestamp(new Date().getTime()));
			pst.setInt(2,userId);  

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
