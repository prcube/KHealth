package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MypageDAO;
import DTO.MypageDTO;


@WebServlet("*.mypage")
public class MypageController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		System.out.println(uri);
		
		try {
			if (uri.equals("/orderhistory.mypage")) {
				String id = (String) request.getSession().getAttribute("loginID");
				MypageDAO dao = MypageDAO.getInstance();
				System.out.println(id);
				List<MypageDTO> list = MypageDAO.getInstance().selectAll(id);
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				List<MypageDTO> list2 = MypageDAO.getInstance().selectByRange(cpage * 5 - 4, cpage * 5, id);
				String navi = MypageDAO.getInstance().getPageNavi(cpage);
				

				request.setAttribute("list2", list2);
				request.setAttribute("navi", navi);
				request.setAttribute("list", list);
				request.setAttribute("id", id);
				request.getRequestDispatcher("/mypage/MypageOrderlist.jsp").forward(request, response);

			}
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>alert('에러!'); history.go(-1);</script>");
		    out.flush();
		    response.flushBuffer();
		    out.close();
		}
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		doGet(request, response);
	}

}
