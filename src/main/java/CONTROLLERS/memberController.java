package CONTROLLERS;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				MembersDAO dao = MembersDAO.getInstance();
				PasswdSha sha = new PasswdSha();
				String cryptopw = sha.encrypt(passwd);
				System.out.println(cryptopw);
				int result = dao.insert(id, cryptopw, name, launch_date, nickname, 0, mail, number, zipcode, post1,
						post2);
				response.sendRedirect("/");
			} else if (uri.equals("/login.mem")) {
	
				String id = request.getParameter("ID");
				String pwd = request.getParameter("passwd");
				String name = request.getParameter("nama");
				MembersDAO dao = MembersDAO.getInstance();
				LoginManager logmanager = LoginManager.getInstance();
				System.out.println(id + ":" + pwd);
				PasswdSha sha = new PasswdSha();
				String cryptopw = sha.encrypt(pwd);
				boolean result = dao.login(id, pwd);
				HttpSession session = request.getSession();
				boolean checklog = logmanager.isUsing(id);
				System.out.println(cryptopw);

				if (checklog == true) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('이미 사용중인 아이디 입니다.'); location.href='/login/LoginDummy.jsp'; </script>");
					out.flush();
					response.flushBuffer();
					out.close();
				}
				else if (result) {
					System.out.println("로그인 성공!");
					String nickName = MembersDAO.getInstance().getNickname(id);
					request.getSession().setAttribute("loginID", id);
					request.getSession().setAttribute("loginname", name);
					request.getSession().setAttribute("loginNickname", nickName);

					logmanager.setSession(session, id);

					response.sendRedirect("/");
				}

				else {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('아이디 및 패스워드를 확인해 주세요.'); history.go(-1);</script>");
					out.flush();
					response.flushBuffer();
					out.close();
				}
				
			} else if (uri.equals("/login/duplCheck.mem")) {
				String id = request.getParameter("id");
				MembersDAO dao = MembersDAO.getInstance();
				boolean result = dao.isIDExist(id);
				System.out.println(id);
				response.getWriter().append(String.valueOf(result));

			} else if (uri.equals("/login/nickCheck.mem")) {
				String nick = request.getParameter("nickname");
				MembersDAO dao = MembersDAO.getInstance();
				boolean result = dao.isNickExist(nick);
				System.out.println(nick);
				response.getWriter().append(String.valueOf(result));
			}

			else if (uri.equals("/logout.mem")) {
				request.getSession().invalidate();
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('로그아웃 되었습니다.'); location.href='/index.jsp'; </script>");
				out.flush();
				response.flushBuffer();
				out.close();

			} else if (uri.equals("/mypage.mem")) {
				String id = (String) request.getSession().getAttribute("loginID");
				// String nickname = (String)(request.getSession().getAttribute("nickname"));

				MemberDTO dto = MembersDAO.getInstance().selectById(id);
				boolean member_role = MembersDAO.getInstance().isYouAdmin(id);

				request.setAttribute("dto", dto);
				request.setAttribute("member_role", member_role);

				request.getRequestDispatcher("/mypage/MypageDummy.jsp").forward(request, response);

			} else if (uri.equals("/update.mem")) {
				String loginID = (String) request.getSession().getAttribute("loginID");
				String nickname = request.getParameter("modify_nickname");
				String mail = request.getParameter("modify_mail");
				String number = request.getParameter("modify_number");
				String address1 = request.getParameter("modify_address1");
				System.out.println(nickname);
				MemberDTO dto = new MemberDTO(0, null, null, nickname, mail, number, null, address1, null, null, 0);

				int result = MembersDAO.getInstance().mypageUpdate(dto, loginID);

				System.out.println(result);

				if (result > 0) {
					response.sendRedirect("/mypage.mem");
				}
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
