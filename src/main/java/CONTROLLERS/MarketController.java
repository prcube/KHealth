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
import DAO.ProductReviewDAO;
import DTO.ImagesDTO;
import DTO.MemberDTO;
import DTO.ProductDTO;
import DTO.ProductReviewDTO;



@WebServlet("*.market")
public class MarketController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		try {
			if(uri.equals("/list.market")) {


				MarketDAO dao = MarketDAO.getInstance();
				String id = (String) request.getSession().getAttribute("loginId");
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String navi = dao.getPageNavi(cpage);
				//				List<BoardDTO> list = dao.selctAll(new BoardDTO(id)); 이제 이거 안 씀

				List<ProductDTO> list = dao.selectByRange(cpage*9-8,cpage*9);

				List<ImagesDTO> imagesList = ImagesDAO.getInstance().selectByRange(cpage*9-8,cpage*9);

				request.setAttribute("imagelist", imagesList);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);


				request.getRequestDispatcher("/market/MarketDummy.jsp").forward(request, response);
				System.out.println("b");

			}




			if(uri.equals("/detail.market")) {
				
				try {
					int product_seq = Integer.parseInt(request.getParameter("product_seq"));
					
					String id = (String) request.getSession().getAttribute("loginID");
					
					List<ProductReviewDTO> list = ProductReviewDAO.getInstance().selectAll(product_seq);


					ProductDTO dto = MarketDAO.getInstance().detail(product_seq);

					
					MembersDAO dao2 = MembersDAO.getInstance();
					MemberDTO review = dao2.selectById(id); 

					request.setAttribute("review", review);
					request.setAttribute("dto", dto);
					request.setAttribute("list", list); // added
				
					request.getRequestDispatcher("/product/ProductView.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("/error.jsp");
				}
				
				



			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
