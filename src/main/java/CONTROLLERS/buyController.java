package CONTROLLERS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MarketDAO;
import DAO.MembersDAO;
import DTO.MemberDTO;
import DTO.ProductDTO;

@WebServlet("*.buy")
public class buyController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		System.out.println(uri);

		try {
			if (uri.equals("/item.buy")) {
				int product_seq = Integer.parseInt(request.getParameter("product_seq"));
				int result = Integer.parseInt(request.getParameter("amount"));
				String id = (String) request.getSession().getAttribute("loginID");
				System.out.println(product_seq);
				System.out.println(result);
				
				ProductDTO dto = MarketDAO.getInstance().detail(product_seq);
				MarketDAO dao = MarketDAO.getInstance()
				request.setAttribute("dto", dto);
				request.setAttribute("amount", result);
				request.setAttribute("buyer", id);
//				request.setAttribute("price", price * result);
				request.getRequestDispatcher("/order/orderpay.jsp").forward(request, response);

			}else if (uri.equals("/completed.buy")) {
				request.getRequestDispatcher("/order/ordercompleted.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		doGet(request, response);
	}

}
