package QNACONTROLLERS;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import QNADAO.QnaDAO;



@WebServlet("*.qna")
public class QnaController extends HttpServlet {

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String uri = request.getRequestURI();
      
      request.setCharacterEncoding("utf8");
      
      try {
         if(uri.equals("/write.qna")) {
            
            String qna_writer = (String)request.getSession().getAttribute("loginId");
            String qna_title = request.getParameter("qna_title");
            String qna_contents = request.getParameter("qna_contents");
            String qna_nickname = request.getParemeter("qna_nickname");
            
            QnaDAO.getInstance().write(qna_writer, qna_title, qna_contents, qna_nickname);
            
            response.sendRedirect();
         }else if(uri.equals("/insert.qna")) {
            
         }else if(uri.equals("/de.qna"))
         
         
      }catch (Exception e) {
         
      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      doGet(request, response);
   }

}