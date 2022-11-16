package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

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
				MemberDTO dao = MembersDAO.getInstance().selectById(id);
				request.setAttribute("dto", dto);
				request.setAttribute("amount", result);
				request.setAttribute("dao", dao);
//				request.setAttribute("price", price * result);
				Random random = new Random ();
				int createNum = 0;
				String ranNum = "";
				int letter = 6;
				String resultNum = "";
				for (int i=0; i < letter; i++) {
				createNum = random.nextInt (9);
				//0부터9까지올수있는1자리난수생성
				ranNum = Integer.toString(createNum);//1자리난수를String으로형변환
				resultNum += ranNum;
				}
				request.setAttribute("ran", resultNum);
				request.getRequestDispatcher("/order/orderpay.jsp").forward(request, response);
			
			}else if (uri.equals("/completed.buy")) {
				
				String id = (String) request.getSession().getAttribute("loginID");
				String productname = request.getParameter("name");
				String userid = request.getParameter("ID");
				String nickname = request.getParameter("nickname");
				String amount = request.getParameter("amount");
				System.out.println(productname + userid + nickname + amount);
			
				MemberDTO dao2 = MembersDAO.getInstance().selectById(id);
				MarketDAO dao = MarketDAO.getInstance();
				int result = dao.insert(productname, userid, nickname, amount);
				request.getRequestDispatcher("/order/ordercompleted.jsp").forward(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//
		doGet(request, response);
	}

}
