package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;

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
				
				ProductReviewDAO dao = ProductReviewDAO.getInstance();
				MembersDAO dao2 = MembersDAO.getInstance();
				
				String contents = request.getParameter("productreview_contents");
				String writerid = (String) request.getSession().getAttribute("loginID");
				
				int productseq = Integer.parseInt(request.getParameter("product_seq"));
				
				Boolean isCommentAlreadyExist = dao.selectBySeqAndId(productseq, writerid);
				
				if(isCommentAlreadyExist) {
					
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('상품에 대한 리뷰는 1번만 작성할 수 있습니다.'); history.go(-1);</script>");
					out.flush();
					response.flushBuffer();
					out.close();
					
				}else {

					MemberDTO dto = dao2.selectById(writerid); 
					String writercharacter = dto.getNickname();
					
					
					ProductReviewDTO dto2 = new ProductReviewDTO(0,productseq,contents,writercharacter,writerid);
					dao.insert(dto2);
					
					int cpage = Integer.parseInt(request.getParameter("cpage"));
					request.setAttribute("product_seq", productseq);
					request.setAttribute("cpage", cpage);
					
					
					request.getRequestDispatcher("/detail.market").forward(request, response);
				}
				

				


				
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
