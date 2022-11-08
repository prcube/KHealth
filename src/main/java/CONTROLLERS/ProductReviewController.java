package CONTROLLERS;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;

import DAO.ProductReviewDAO;



@WebServlet("*.review")
public class ProductReviewController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		request.setCharacterEncoding("uft8");
		
		try {
			
			if(uri.equals("/list.review")) {
				
//				ProductReviewDAO dao = ProductReviewDAO.getInstance();
//				int product seq = request.getParameter("seq")
//				
//				
//				int parentseq = Integer.parseInt(request.getParameter("seq"));
//				List<CommentsDTO> list2 = dao.output();
//				System.out.println(list2);
//				request.setAttribute("list2", list2);
//				request.getRequestDispatcher("/detail.board").forward(request, response);
				
				
				
			}
			
			else if(uri.equals("/insert.review")) {
				
				
				ProductReviewDAO dao = ProductReviewDAO.getInstance();
				String pr_contents = request.getParameter("productreview_contents");
				String pr_writerid = (String) request.getSession().getAttribute("loginID");
				int pr_productseq = Integer.parseInt(request.getParameter("productreview_seq"));
				
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
