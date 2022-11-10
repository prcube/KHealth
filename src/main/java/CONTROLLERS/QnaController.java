package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MembersDAO;
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
				//List<QnaDTO> list = dao.selectAll();
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
					QnaDTO dto = new QnaDTO(0, qna_title, qna_writer, qna_contents, null, 0, qna_nickname,0);
					dao.write(dto);

					response.sendRedirect("/list.qna?cpage=1");
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("/error.jsp");
				}

				//게시판 1페이지로 이동

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

				//         }else if(uri.equals("/detail.board")) {
				//
				//            int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				//            QnaDTO dto = QnaDAO.getInstance().selectBySeq(qna_seq);
				//
				//            QnaDAO.getInstance().addViewCount(qna_seq);
				//            //조회수를 증가시키는 기능
				//            
				////            List<CommentsDTO> list = CommentsDAO.getInstance().selectByParentSeq(qna_seq);
				//            //DB에서 comments 데이터를 가져오는 것
				//            //댓글이 여러개 일 수 있으니 List를 사용하자
				//            
				//            request.setAttribute("dto", dto);
				////            request.setAttribute("comments", list);
				//            request.getRequestDispatcher("/qna/detailView.jsp").forward(request, response);   
			}else if(uri.equals("/search.qna")) {
				
				String qna_title = request.getParameter("qna_title");
				System.out.println(qna_title);
				List<QnaDTO> list = QnaDAO.getInstance().search(qna_title);
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/qna/QnaSearch.jsp").forward(request, response);
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
