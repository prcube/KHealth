package CONTROLLERS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MembersDAO;
import DAO.ProductReviewDAO;
import DTO.MemberDTO;
import DTO.ProductReviewDTO;



@WebServlet("*.review")
public class ProductReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		request.setCharacterEncoding("utf8");
		
		try {
			
			if(uri.equals("/list.review")) {
//				String id = (String) request.getSession().getAttribute("loginID");
//				int pr_seq = request.getParameter("")
				
				
				
				
				
			}
			
			else if(uri.equals("/insert.review")) {
				System.out.println("테스트입니다.");
				ProductReviewDAO dao = ProductReviewDAO.getInstance();
				MembersDAO dao2 = MembersDAO.getInstance();
				
				String contents = request.getParameter("productreview_contents");
				String writerid = (String) request.getSession().getAttribute("loginID");
				
				int productseq = Integer.parseInt(request.getParameter("productreview_seq"));
				String writercharacter = request.getParameter("review_nickname");
				
				
				
				MemberDTO dto = dao2.selectById(writerid); 
				ProductReviewDTO dto2 = new ProductReviewDTO(0,productseq,contents,writercharacter,writerid);
				dao.insert(dto2);
//				request.getRequestDispatcher("/detail.market?cpage=1&product_seq="+productseq).forward(request, response);
				request.getRequestDispatcher("/detail.market").forward(request, response);

				
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
