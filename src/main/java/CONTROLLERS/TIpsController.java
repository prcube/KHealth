package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MembersDAO;
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
				String tips_bullet = request.getParameter("tips_bullet");
				
				TipsDTO dto = new TipsDTO(0,tips_title,tips_writer,tips_contents,null,0,"",0,tips_bullet,0);
				
				
				dao.insert(dto);
				//request.setAttribute("list", list);
				response.sendRedirect("/list.tips?cpage=1");
				//request.getRequestDispatcher("/tips/TipsDummy.jsp").forward(request, response);
			}
			else if(uri.equals("/list.tips")) {
				
				TipsDAO dao = TipsDAO.getInstance();
				int cpage =Integer.parseInt(request.getParameter("cpage"));
				//List<TipsDTO> list = dao.selectAll();
				String id = (String) request.getSession().getAttribute("loginID");
				boolean member_role = MembersDAO.getInstance().isYouTeacher(id);
				
				List<TipsDTO> list = TipsDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
				List<TipsDTO> list1 = TipsDAO.getInstance().selectBybullet1(cpage*10-9,cpage*10, null);
				List<TipsDTO> list2 = TipsDAO.getInstance().selectBybullet2(cpage*10-9,cpage*10, null);
				List<TipsDTO> list3 = TipsDAO.getInstance().selectBybullet3(cpage*10-9,cpage*10, null);
				List<TipsDTO> list4 = TipsDAO.getInstance().selectBybullet4(cpage*10-9,cpage*10, null);
				
				
				String navi = TipsDAO.getInstance().getPageNavi(cpage);
				request.setAttribute("navi", navi);
				request.setAttribute("list", list);
				request.setAttribute("list1", list1);
				request.setAttribute("list2", list2);
				request.setAttribute("list3", list3);
				request.setAttribute("list4", list4);
				request.setAttribute("member_role", member_role);
				
				request.getRequestDispatcher("/tips/Tips.jsp").forward(request, response);
			}
			
			else if(uri.equals("/detail.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				//숨긴 tips_seq를 가져와서 TipsDTO dto = dao.detail(tips_seq) 이렇게 넣어야함
				
				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				
				TipsDTO dto = dao.detail(tips_seq);
				TipsDAO.getInstance().addViewCount(tips_seq);
				boolean member_role = MembersDAO.getInstance().isYouAdmin(id);
				request.setAttribute("dto", dto);
				request.setAttribute("loginID", id);
				request.setAttribute("member_role", member_role);
				request.getRequestDispatcher("/tips/tipsDetail.jsp").forward(request, response);
			}
			else if (uri.equals("/thumbsup.tips")) {
				TipsDAO dao = TipsDAO.getInstance();
				
				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				
				TipsDAO.getInstance().addthumbsupCount(tips_seq);
				
				request.getRequestDispatcher("/list.tips").forward(request, response);
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
				//please
				//please
				
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
