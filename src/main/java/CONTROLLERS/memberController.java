package CONTROLLERS;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MembersDAO;
import DTO.MemberDTO;

@WebServlet("*.mem")
public class memberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF8");

		String uri = request.getRequestURI();
		System.out.println(uri);
		try {
			if (uri.equals("/login/complete.mem")) {
				String id = request.getParameter("ID");
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("nama");
				String nickname = request.getParameter("nickname");
				String number = request.getParameter("number");
				String mail = request.getParameter("mail");
				String zipcode = request.getParameter("zipcode");
				String post1 = request.getParameter("address1");
				String post2 = request.getParameter("address2");
				SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
				String launch_date = format.format(System.currentTimeMillis());
				System.out.println(launch_date);
				MembersDAO dao = MembersDAO.getInstance();
				int result = dao.insert(id, passwd, name, launch_date, nickname, 0, mail, number, zipcode, post1,
						post2);
				response.sendRedirect("/");
			} else if (uri.equals("/login/login.mem")) {
				String id = request.getParameter("ID");
				String pwd = request.getParameter("passwd");
				
				MembersDAO dao = MembersDAO.getInstance();
				
				System.out.println(id + pwd);
				boolean result = dao.login(id, pwd);
				
				if (result) {
					System.out.println("로그인 성공!");
					request.getSession().setAttribute("loginID", id);

					response.sendRedirect("/");
				}
			} else if (uri.equals("/login/duplCheck.mem")) {
				String id = request.getParameter("ID");
				MembersDAO dao = MembersDAO.getInstance();
				boolean result = dao.isIDExist(id);
				response.getWriter().append(String.valueOf(result));

			} else if (uri.equals("/logout.mem")) {
				request.getSession().invalidate();
				response.sendRedirect("/");
				
			}else if(uri.equals("/mypage.mem")) {
				MembersDAO dao = MembersDAO.getInstance();
				//nickname을 어떻게 받을지 ...세션에 넣을까..
				String nickname = (String)(request.getSession().getAttribute("nickname"));
				List<MemberDTO> list = dao.mynickname(nickname);
				request.setAttribute("list", list);
				
				request.getRequestDispatcher("/member/mypage.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
