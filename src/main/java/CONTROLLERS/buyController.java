package CONTROLLERS;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MarketDAO;
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
				String name = request.getParameter("nama");
				System.out.println(product_seq);
				System.out.println(result);
				System.out.println(name);
				
				ProductDTO dto = MarketDAO.getInstance().detail(product_seq);
				request.setAttribute("dto", dto);
				request.setAttribute("amount", result);
				request.setAttribute("name", name);
//				request.setAttribute("price", price * result);
				request.getRequestDispatcher("/order/orderpay.jsp").forward(request, response);

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
