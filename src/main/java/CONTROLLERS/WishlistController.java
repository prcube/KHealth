package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.WishlistDAO;
import DTO.WishlistDTO;


@WebServlet("*.wish")
public class WishlistController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();

		if(uri.equals("list.wish")) {
			try {

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String navi = WishlistDAO.getInstance().getPageNavi(cpage);
				
				List<WishlistDTO> wishlist = WishlistDAO.getInstance().selectByRange(cpage*4-3, cpage*4);
				
				request.setAttribute("wishlist", wishlist);
				
				request.getRequestDispatcher("/market/wishlist.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}
		}

		if(uri.equals("/add.wish")) {

			try {
				int wishlist_seq = WishlistDAO.getInstance().getnextval();

				String id = (String) request.getSession().getAttribute("loginID");
				int amount = Integer.parseInt(request.getParameter("amount"));

				String product_name = request.getParameter("product_nameForWishlist");
				String product_price = request.getParameter("product_priceForWishlist");
				
				boolean result = WishlistDAO.getInstance().isProductExist(id, product_name);
				
				if(result) {
					WishlistDAO.getInstance().addupdate(amount, product_name, id);
				}else {
					WishlistDAO.getInstance().insert(wishlist_seq,product_name,product_price,amount,id);
				}
				

				response.sendRedirect("/list.wish?cpage=1");

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
