package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import DAO.MembersDAO;
import DAO.MypageAjaxDAO;
import DAO.QnaCommentsDAO;
import DAO.QnaDAO;
import DTO.MemberDTO;
import DTO.QnaCommentsDTO;
import DTO.QnaDTO;







@WebServlet("*.qna")
public class QnaController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf8");

		try {
			if(uri.equals("/list.qna")) {

				String id = (String) request.getSession().getAttribute("loginID");
				String nickname = (String) request.getSession().getAttribute("loginNickname");
				int cpage = Integer.parseInt(request.getParameter("cpage"));

				String navi = QnaDAO.getInstance().getPageNavi(cpage);
				
				QnaDAO dao = QnaDAO.getInstance();

				List<QnaDTO> list = QnaDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
				
				
				boolean isInBlacklist = MembersDAO.getInstance().isInBlacklist(id);

				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.setAttribute("isInBlacklist", isInBlacklist);

				request.getRequestDispatcher("/qna/QnaDummy.jsp").forward(request, response);


			}else if(uri.equals("/write.qna")) {

				try {
					String qna_writer = (String)request.getSession().getAttribute("loginID");
					String qna_nickname = (String)request.getSession().getAttribute("loginNickname");
					String qna_title = request.getParameter("qna_title");
					String qna_contents = request.getParameter("qna_contents");
					QnaDAO dao = QnaDAO.getInstance();
					QnaDTO dto = new QnaDTO(0, qna_title, qna_writer, qna_contents, null, 0, qna_nickname,0,0);
					dao.write(dto);

					response.sendRedirect("/list.qna?cpage=1");
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("/error.jsp");
				}



			}else if(uri.equals("/detail.qna")) {

				QnaDAO dao = QnaDAO.getInstance();
				int seq = Integer.parseInt(request.getParameter("qna_seq"));
				String id = (String) request.getSession().getAttribute("loginID");
				
				List<QnaCommentsDTO> list = QnaCommentsDAO.getInstance().selectAll(seq);
				
				QnaDTO dto = dao.selectBySeq(seq);
				QnaDAO.getInstance().addViewCount(seq);
				
				boolean member_role = MembersDAO.getInstance().isInBlacklist(id);
				
				request.setAttribute("list", list);
				request.setAttribute("dto", dto);
				request.setAttribute("member_role", member_role);
				request.getRequestDispatcher("/qna/QnadetailView.jsp").forward(request, response);

			}else if(uri.equals("/update.qna")) {
				QnaDAO dao = QnaDAO.getInstance();
				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				String qna_title = request.getParameter("qna_title");
				String qna_contents = request.getParameter("qna_contents");

				dao.updateBySeq(qna_title, qna_contents, qna_seq);




				request.getRequestDispatcher("/detail.qna?qna_seq="+qna_seq).forward(request, response);


			}else if(uri.equals("/gomodify.qna")) {
				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				request.setAttribute("qna_seq", qna_seq);
				request.getRequestDispatcher("/qna/QnaModify.jsp").forward(request, response);


			}else if(uri.equals("/delete.qna")) {

				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				QnaDAO dao = QnaDAO.getInstance();
				int result = dao.deleteBySeq(qna_seq);

				response.sendRedirect("/list.qna?cpage=1");	

   
			}else if(uri.equals("/searchAjax.qna")) {
				Gson g = new Gson();
				JsonObject total = new JsonObject();

				String searchTitle = request.getParameter("searchTitle");			
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String loginID = (String)request.getSession().getAttribute("loginID");
				
				List<QnaDTO> list = QnaDAO.getInstance().search(searchTitle);
				
				total.addProperty("list",new Gson().toJson(list));
				response.setContentType("text/html;charset=utf8");
				
				response.getWriter().append(total.toString());
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
