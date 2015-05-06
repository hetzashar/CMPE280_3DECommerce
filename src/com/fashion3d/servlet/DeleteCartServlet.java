package com.fashion3d.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fashion3d.beans.Products;
import com.fashion3d.beans.ShoppingCart;
import com.fashion3d.beans.Users;
import com.fashion3d.db.ProductDao;
import com.fashion3d.db.ShoppingCartDao;

/**
 * Servlet implementation class DeleteCartServlet
 */
@WebServlet("/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		HttpSession session= request.getSession();
		Users user = (Users)session.getAttribute("loggedInUser");
		ShoppingCartDao.deleteShoppingCart(cartId);
		List<ShoppingCart> cartList = ShoppingCartDao.fetchShoppingCart(user.getUserId());
		session.setAttribute("itemsInCart", cartList);
		RequestDispatcher rd=request.getRequestDispatcher("cartcheckout.jsp");
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
