package CONTROLLERS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QnaCommentsDAO;
import DTO.QnaCommentsDTO;


@WebServlet("*.comments")
public class QnaCommentsController extends HttpServlet {
	

       



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		request.setCharacterEncoding("utf8");
		
		try {
			
			if(uri.equals("/write.comments")) {
				
				
				QnaCommentsDAO dao = QnaCommentsDAO.getInstance();
				
				String qnaCms_contents = request.getParameter("comments");
				
				String qnaCms_writer = (String)(request.getSession().getAttribute("loginID"));
				String qnaCms_nickname = (String)(request.getSession().getAttribute("loginNickname"));
				int qnaCms_parent_seq = Integer.parseInt(request.getParameter("qna_seq"));
				
				QnaCommentsDTO dto = new QnaCommentsDTO(0,qnaCms_parent_seq,qnaCms_writer,qnaCms_contents,qnaCms_nickname,null);
				
				dao.write(dto);
				
				
				request.getRequestDispatcher("/detail.qna?qna_seq="+qnaCms_parent_seq).forward(request, response);
				
				
			}else if(uri.equals("/delete.comments")) {
				int qnaCms_seq = Integer.parseInt(request.getParameter("qnaCms_seq"));
				
				int result = QnaCommentsDAO.getInstance().delete(qnaCms_seq);
				response.sendRedirect("/detail.qna?qna_seq=");
				
			}else if(uri.equals("/update.comments")) {
				try {
					
					String qnaCms_writer = (String)(request.getSession().getAttribute("loginID"));
					int qnaCms_seq = Integer.parseInt(request.getParameter("qnaCms_seq"));
					String qnaCms_contents = request.getParameter("contentsComments");

					int result = QnaCommentsDAO.getInstance().update(qnaCms_contents, qnaCms_seq);

					response.sendRedirect("/detail.qna");
				}catch (Exception e) {
					e.printStackTrace();
					
				}
		
			}
			
			
		}catch(Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
