package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.TipsDAO;
import DTO.TipsDTO;

@WebServlet("*.tips")
public class TIpsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		

		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf8");

		try {
			
			if(uri.equals("/insert.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				
				//List<TipsDTO> list = dao.selectAll();
				//System.out.println(list);
				
				String tips_writer =(String)(request.getSession().getAttribute("loginID")); 
				String tips_title = request.getParameter("tips_title");
				String tips_contents = request.getParameter("tips_contents");
				
				TipsDTO dto = new TipsDTO(0,tips_title,tips_writer,tips_contents,null,0,"");
				
				
				dao.insert(dto);
				//request.setAttribute("list", list);
				response.sendRedirect("/list.tips");
				//request.getRequestDispatcher("/tips/TipsDummy.jsp").forward(request, response);
			}
			else if(uri.equals("/list.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				List<TipsDTO> list = dao.selectAll();
				
				System.out.println(list);
				
				request.setAttribute("list", list);
				request.getRequestDispatcher("/tips/tipsDummy.jsp").forward(request, response);
			}
			
			else if(uri.equals("/detail.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				//숨긴 tips_seq를 가져와서 TipsDTO dto = dao.detail(tips_seq) 이렇게 넣어야함
				
				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				
				TipsDTO dto = dao.detail(tips_seq);
				TipsDAO.getInstance().addViewCount(tips_seq);
				request.setAttribute("dto", dto);
				request.setAttribute("loginID", id);
				
				request.getRequestDispatcher("/tips/tipsDetail.jsp").forward(request, response);
			}

			else if(uri.equals("/delete.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				
				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				
				dao.delete(tips_seq);
				
				request.getRequestDispatcher("/list.tips").forward(request, response);
			}
			
			else if(uri.equals("/gomodify.tips")) {
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				
				request.setAttribute("tips_seq", tips_seq);
				
				request.getRequestDispatcher("/tips/tipsModify.jsp").forward(request, response);
			}
			
			
			else if(uri.equals("/update.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				String tips_title = request.getParameter("tips_title");
				String tips_contents = request.getParameter("tips_contents");
				
				dao.update(tips_title, tips_contents, tips_seq);
				
				request.getRequestDispatcher("/detail.tips?tips_seq="+tips_seq).forward(request, response);
				//response.sendRedirect("/detail.jsp?tips_seq="+tips_seq);
				
				
			}
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
