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
				
				int qnaCms_parent_seq = Integer.parseInt(request.getParameter("qna_seq"));
				
				QnaCommentsDTO dto = new QnaCommentsDTO(0,qnaCms_parent_seq,"",qnaCms_contents,"",null);
				
				dao.write(dto);
				
				
				request.getRequestDispatcher("/detail.qna?qna_seq="+qnaCms_parent_seq).forward(request, response);
				
				
			}
			
			
		}catch(Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
