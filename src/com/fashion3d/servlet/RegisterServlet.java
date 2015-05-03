package com.fashion3d.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fashion3d.db.UserDao;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String username = request.getParameter("username");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try{


			if(UserDao.validates(username)){    
				RequestDispatcher rd=null;
				rd=request.getRequestDispatcher("signup.jsp");
				out.print("<p style=\"color:red\">Invalid ID</p>");  
				rd.forward(request,response);    
			}
			else{    

				int i = UserDao.register(username, fname, lname, email, password, "Y");
				String msg="";

				if(i!=0){  
					msg="Record has been inserted";
					out.println("<font size='6' color=blue>" + msg + "</font>");  
					response.sendRedirect("login.jsp");
				}  
				else{  
					msg="failed to insert the data";
					out.println("<font size='6' color=blue>" + msg + "</font>");
				}  
			}

		}  
		catch (Exception e){  
			out.println(e);  
		}  


	}

}
