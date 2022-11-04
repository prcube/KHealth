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
import DTO.ImagesDTO;
import DTO.ProductDTO;



@WebServlet("*.market")
public class MarketController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		
		if(uri.equals("/list.market")) {
			try {
				MarketDAO dao = MarketDAO.getInstance();
				String id = (String) request.getSession().getAttribute("loginId");
				int cpage = Integer.parseInt(request.getParameter("cpage"));

				String navi = dao.getPageNavi(cpage);


				//				List<BoardDTO> list = dao.selctAll(new BoardDTO(id)); 이제 이거 안 씀

				List<ProductDTO> list = dao.selectByRange(cpage*9-8,cpage*9);
				
				List<ImagesDTO> imagesList = ImagesDAO.getInstance().selectByRange(cpage*9-8,cpage*9);
				
				request.setAttribute("image", imagesList);
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/market/MarketDummy.jsp").forward(request, response);

			}
			catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}
		
		}
		
		if(uri.equals("/detail.market")) {
			
			int product_seq = Integer.parseInt(request.getParameter("product_seq"));
			
			try {ProductDTO dto = MarketDAO.getInstance().detail(product_seq);
				
			request.setAttribute("dto", dto);
			request.getRequestDispatcher("").forward(request, response);
			
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
