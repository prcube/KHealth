package CONTROLLERS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.QnaDAO;
import DTO.QnaDTO;


@WebServlet("*.qna")
public class QnaController extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		
		request.setCharacterEncoding("utf8");
		try {
			
			if(uri.equals("/write.qna")) {
				QnaDAO dao = QnaDAO.getInstance();
				
//				로그인 기능 완료후 파라미터 이름 맞는지 확인.
				String qna_writer =(String)(request.getSession().getAttribute("loginID")); 
				String qna_title = request.getParameter("qna_title");
				String qna_contents = request.getParameter("qna_contents");
				String qna_nickname = //닉네임은 member에서 불러옴 . 로그인 기능 완성 후 
				
				QnaDTO dto = new QnaDTO(qna_seq,qna_title,qna_writer,qna_contents,null,0,qna_nickname);
			}
			
		}catch (Exception e) {
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
