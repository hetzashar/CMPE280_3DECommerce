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
 * Servlet implementation class ProductDetailServlet
 */
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		int productId = Integer.parseInt(request.getParameter("productId"));
		String modifiedColor = request.getParameter("newColor");
		System.out.println("ModifiedColor:: "+modifiedColor);
		String page=request.getParameter("page");
		HttpSession session= request.getSession();
		Products prod = ProductDao.getProductBeanFromId(productId);
		Users user = (Users)session.getAttribute("loggedInUser");
		ShoppingCartDao.saveToCart(productId, 1, user.getUserId(), prod.getPrice(), modifiedColor);
		List<ShoppingCart> cartList = ShoppingCartDao.fetchShoppingCart(user.getUserId());
		session.setAttribute("itemsInCart", cartList);
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
