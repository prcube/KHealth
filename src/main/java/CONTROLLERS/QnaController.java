package CONTROLLERS;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.FilesDAO;
import DAO.MembersDAO;
import DAO.QnaCommentsDAO;
import DAO.QnaDAO;
import DAO.Qna_imagesDAO;
import DAO.Tips_imagesDAO;
import DTO.FilesDTO;

import DTO.QnaCommentsDTO;
import DTO.QnaDTO;
import DTO.Qna_imagesDTO;
import DTO.Tips_imagesDTO;







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

				List<QnaDTO> list1 = dao.replycount(cpage*10-9,cpage*10);
				
				boolean isInBlacklist = MembersDAO.getInstance().isInBlacklist(id);

				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.setAttribute("isInBlacklist", isInBlacklist);
				request.setAttribute("list1", list1);

				request.getRequestDispatcher("/qna/QnaDummy.jsp").forward(request, response);


			}else if(uri.equals("/write.qna")) {

				try {
					int maxSize = 1024*1024*10;
					// files에 저장한다.
					String savePath=request.getServletContext().getRealPath("/files");
					System.out.println(savePath);
					
					//객체생성
					File fileSavePath = new File(savePath);
					//경로안에 없으면 디렉토리 생성
					if(!fileSavePath.exists()) {
						fileSavePath.mkdir();
					}
					//기존 리퀘스트 객체 업그레이드
					QnaDAO dao = QnaDAO.getInstance();
					MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
					String qna_writer = (String)request.getSession().getAttribute("loginID");
					String qna_nickname = (String)request.getSession().getAttribute("loginNickname");
					String qna_title = multi.getParameter("qna_title");
					String qna_contents = multi.getParameter("qna_contents");
					
					int seq = QnaDAO.getInstance().getnextval();
					QnaDTO dto = new QnaDTO(seq, qna_title, qna_writer, qna_contents, null, 0, qna_nickname,0,0,0);
					dao.write(dto);
					//업로드된 파일들의 이름부터 알아봐야함
					//어레이리스트에 저장했다고 보면됨.
					
					
					Enumeration<String> e = multi.getFileNames();
					//ResultSet의 rs.next랑 비슷.
					
					while(e.hasMoreElements()) {
						String name = e.nextElement();
						//클라이언트가 업로드하는 원본 파일 이름.
						String oriName = multi.getOriginalFileName(name);
						if(oriName ==null) {continue;}
						
						//서버측에 저장되는 시스템 파일 이름.
						String sysName = multi.getFilesystemName(name);
						//파일목록을 추가하고 파일을 안올리고 글작성을 누르는 경우.
						
						int seq1 = Qna_imagesDAO.getInstance().getnextval();
						Qna_imagesDAO.getInstance().insert(new Qna_imagesDTO(seq1, oriName, sysName, seq));
						
					
					}
					
					
					
					
					

					response.sendRedirect("/list.qna?cpage=1");
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("/error.jsp");
				}



			}else if(uri.equals("/detail.qna")) {

				QnaDAO dao = QnaDAO.getInstance();
				Qna_imagesDAO dao1 = Qna_imagesDAO.getInstance();
				
				int seq = Integer.parseInt(request.getParameter("qna_seq"));
			
				String id = (String) request.getSession().getAttribute("loginID");

				
				List<QnaCommentsDTO> list = QnaCommentsDAO.getInstance().selectAll(seq);
				
				QnaDTO dto = dao.selectBySeq(seq);
				QnaDAO.getInstance().addViewCount(seq);
				
				boolean member_role = MembersDAO.getInstance().isInBlacklist(id);
				request.setAttribute("oriName", dao1.getImageOriName(seq));
				System.out.println(dao1.getimage(seq));
				request.setAttribute("list", list);
				request.setAttribute("dto", dto);
				request.setAttribute("member_role", member_role);
				request.getRequestDispatcher("/qna/QnadetailView.jsp").forward(request, response);

			}else if(uri.equals("/update.qna")) {
				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				String qna_title = request.getParameter("qna_title");
				String qna_contents = request.getParameter("qna_contents");
				
				int result = QnaDAO.getInstance().updateBySeq(qna_title, qna_contents, qna_seq);
				
				response.sendRedirect("/list.qna?cpage=1");	

			}else if(uri.equals("/gomodify.qna")) {
				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				System.out.println(qna_seq);
				QnaDTO dto = QnaDAO.getInstance().selectBySeq(qna_seq);
				request.setAttribute("dto", dto);
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
				String loginNickname = (String)request.getSession().getAttribute("loginNickname");
				
				List<QnaDTO> list = QnaDAO.getInstance().search(searchTitle,loginNickname);
				
				total.addProperty("list",new Gson().toJson(list));
				response.setContentType("text/html;charset=utf8");
				
				response.getWriter().append(total.toString());
			}
			else if(uri.equals("/thumbsup.qna")) {
				QnaDAO dao = QnaDAO.getInstance();
				
				String id = (String) (request.getSession().getAttribute("loginID"));
				int qna_seq = Integer.parseInt(request.getParameter("qna_seq"));
				
				QnaDAO.getInstance().addthumbsupCount(qna_seq);
				
				request.getRequestDispatcher("/list.qna").forward(request, response);
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
