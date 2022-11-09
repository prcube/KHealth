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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.FilesDAO;
import DAO.MembersDAO;
import DAO.QnaCommentsDAO;
import DAO.QnaDAO;
import DTO.FilesDTO;
import DTO.QnaCommentsDTO;
import DTO.QnaDTO;










@WebServlet("*.qna")
public class QnaController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf8");

		try {
			if(uri.equals("/list.qna")) {


				int cpage = Integer.parseInt(request.getParameter("cpage"));

				String navi = QnaDAO.getInstance().getPageNavi(cpage);
				
				QnaDAO dao = QnaDAO.getInstance();
				//List<QnaDTO> list = dao.selectAll();
				List<QnaDTO> list = QnaDAO.getInstance().selectByRange(cpage*10-9,cpage*10);
				System.out.println(list);
				
				String id = (String) request.getSession().getAttribute("loginID");
				boolean isInBlacklist = MembersDAO.getInstance().isInBlacklist(id);

				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				request.setAttribute("isInBlacklist", isInBlacklist);

				request.getRequestDispatcher("/qna/QnaDummy.jsp").forward(request, response);


			}else if(uri.equals("/write.qna")) {

				try {
					
					
					int maxSize = 1024*1024*10;
					
					String savePath = request.getServletContext().getRealPath("/files");
					System.out.println(savePath);
					
					File fileSavePath = new File(savePath);
//					경로안에없으면 디렉토리 생성
					if(!fileSavePath.exists()) {
						fileSavePath.mkdir();
					}
					
					
					MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,"UTF8",new DefaultFileRenamePolicy());
					int seq = QnaDAO.getInstance().getnextval();
					Enumeration<String> e =  multi.getFileNames();
//					ResultSet의 rs.next랑 비슷. 다음 데이터가 있으면 true가 되어서 꺼낼수 있음.
					while(e.hasMoreElements()) {
					String name = e.nextElement();
//					클라이언트가 업로드하는 원본 파일 이름.
					String oriName = multi.getOriginalFileName(name);
//		      	서버측에 저장되는 시스템 파일 이름.
					String sysName = multi.getFilesystemName(name);
//					파일목록을 추가하고 파일을 안올리고 글작성을 누르는경우 . 
					if(oriName ==null) {continue;}
					FilesDTO dto1 = new FilesDTO(0,oriName,sysName,seq);
					FilesDAO.getInstacne().insert(dto1);
					}
					
					String qna_writer = (String)request.getSession().getAttribute("loginID");
					String qna_title = multi.getParameter("qna_title");
					String qna_contents = multi.getParameter("qna_contents");
					

					QnaDAO dao = QnaDAO.getInstance();
					QnaDTO dto = new QnaDTO(0, qna_title, qna_writer, qna_contents, null, 0,"");
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
				List<FilesDTO> filelist = FilesDAO.getInstacne().selectAll(seq);
				
				QnaDTO dto = dao.selectBySeq(seq);
				QnaDAO.getInstance().addViewCount(seq);
				
				boolean member_role = MembersDAO.getInstance().isInBlacklist(id);
				
				request.setAttribute("list", list);
				request.setAttribute("filelist", filelist);
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
