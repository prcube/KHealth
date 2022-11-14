package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ImagesDAO;
import DAO.MarketDAO;
import DAO.MembersDAO;
import DAO.WishlistDAO;
import DTO.MemberDTO;
import DTO.ProductDTO;
import DTO.WishlistDTO;


@WebServlet("*.wish")
public class WishlistController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();

		if(uri.equals("/list.wish")) {
			try {
				String id = (String) request.getSession().getAttribute("loginID");
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String navi = WishlistDAO.getInstance().getPageNavi(cpage);
				
				List<WishlistDTO> wishlist = WishlistDAO.getInstance().selectById(id);
				
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
				int product_seq = Integer.parseInt(request.getParameter("product_seqForWishlist"));
				String product_name = request.getParameter("product_nameForWishlist");
				String product_price = request.getParameter("product_priceForWishlist");
				
				String oriName = ImagesDAO.getInstance().getImageOriName(product_seq);
				System.out.println(product_seq);
				boolean result = WishlistDAO.getInstance().isProductExist(id, product_name);
				
				if(result) {
					WishlistDAO.getInstance().addupdate(amount, product_name, id);
				}else {
					WishlistDAO.getInstance().insert(wishlist_seq, product_name, product_seq, product_price,amount,id, oriName);
				}
				
				System.out.println("삽입 완료");
				
				response.sendRedirect("/list.wish?cpage=1");

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}

		}
		
		if(uri.equals("/deleteall.wish")) {
			String id = (String) request.getSession().getAttribute("loginID");
			
			try {
				WishlistDAO.getInstance().deleteById(id);
				response.sendRedirect("/list.wish?cpage=1");
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		if(uri.equals("/buy.wish")) {
			String id = (String) request.getSession().getAttribute("loginID");
			
			try {
				List<WishlistDTO> list = WishlistDAO.getInstance().selectById(id);
				
				MemberDTO dao = MembersDAO.getInstance().selectById(id);
				
				String totalPrice = request.getParameter("totalPrice");
				
				request.setAttribute("totalPrice", totalPrice);
				request.setAttribute("dao", dao);
				request.setAttribute("list", list);
				System.out.println(id);
				System.out.println(totalPrice);
				
				request.getRequestDispatcher("/order/orderpaywishlist.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
