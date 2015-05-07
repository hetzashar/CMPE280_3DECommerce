package com.fashion3d.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
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
		String modifiedColor = request.getParameter("newColor");
		String page=request.getParameter("page");
		String itemCount = "itemCount"+cartId+"";
		System.out.println(itemCount);
		System.out.println("Parameter:: "+request.getParameter(itemCount)+request.getAttribute(itemCount));
		int noOfItems=Integer.parseInt(request.getParameter(itemCount));
		float pricePerItem=Float.parseFloat(request.getParameter("pricePerItem"));
		String isComplete=request.getParameter("isComplete");
		HttpSession session= request.getSession();
		Users user = (Users)session.getAttribute("loggedInUser");
		float totalPrice = pricePerItem*noOfItems;
		ShoppingCartDao.updateShoppingCart(isComplete, noOfItems, totalPrice, modifiedColor, cartId);
		List<ShoppingCart> cartList = ShoppingCartDao.fetchShoppingCart(user.getUserId());
		session.setAttribute("itemsInCart", cartList);
		RequestDispatcher rd=request.getRequestDispatcher(page);
		rd.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");  
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		System.out.println("Parameter:: "+request.getParameter("itemCount11")+request.getAttribute("itemCount11"));
		List<ShoppingCart> cartList = (ArrayList<ShoppingCart>)session.getAttribute("itemsInCart");
		for(ShoppingCart cart:cartList){
			ShoppingCartDao.updateShoppingCart("Y", cart.getTotalItems(), cart.getPriceOfTotalItems(), cart.getModifiedColor(), cart.getCartId());
		}
		session.removeAttribute("itemsInCart");
		RequestDispatcher rd=request.getRequestDispatcher("thankyou.jsp");
		rd.forward(request,response);
	
	}

}
