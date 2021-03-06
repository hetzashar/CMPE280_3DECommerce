package com.fashion3d.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashion3d.beans.ShoppingCart;
import com.fashion3d.beans.Users;
import com.fashion3d.db.ConnectionPool;
import com.fashion3d.db.LoginDao;
import com.fashion3d.db.ShoppingCartDao;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	//@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();    
		String username=request.getParameter("username");    
		String password=request.getParameter("password"); 
		HttpSession session = request.getSession(false); 
		try{

			Users user=LoginDao.validate(username, password);
			if(user!=null){    
				List<ShoppingCart> cartList = ShoppingCartDao.fetchShoppingCart(user.getUserId());
				session.setAttribute("itemsInCart", cartList);
				LoginDao.update(user.getUserId());
				session.setAttribute("loggedInUser", user);
				RequestDispatcher rd=null;
				rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request,response);    
			}
			else{   
				out.println("<script type=\"text/javascript\">");
				out.print("alert('Invalid username or password error');");   
				out.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");    
				rd.include(request,response); 
			}
			out.close();

}
		catch(Exception e){
			e.printStackTrace();
		}

	}
}
