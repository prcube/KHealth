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

import DAO.MembersDAO;
import DAO.TipsDAO;
import DAO.Tips_imagesDAO;
import DTO.TipsDTO;
import DTO.Tips_imagesDTO;

@WebServlet("*.tips")
public class TIpsController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();

		request.setCharacterEncoding("utf8");

		try {

			if (uri.equals("/insert.tips")) {
				
				int maxSize = 1024 * 1024 * 10; // 업로드 하는 파일의 최대 사이즈

				// 파일을 저장하는 경로는 절대경로인 getRealPath에 tips_images 라는 곳에다 저장하겠다 라는 것
				String savePath = request.getServletContext().getRealPath("/tips_images"); // (webapp) 웹 앱 폴더를 말하는 것이다.

				// 파일을 저장히기 위한 디렉토리(폴더)를 만드는 코드
				File fileSavePath = new File(savePath);
				System.out.println(savePath);
				if (!fileSavePath.exists()) {
					fileSavePath.mkdir(); // mkdir = make directory 파일을 만드는 명령어
				}

				// 멀티파트 폼 데이터로 넘어온 파일을 MultipartRequest로 업그레이드 시켜주는 코드
				// 멀티 파트로 업그레이트 시킨다음에는 request.getparameter로 값을 꺼내는것이 아니라 multi.getparameter로
				// 꺼내야한다.

				// 바로 순서대로 저장한다는 코드
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8",
						new DefaultFileRenamePolicy());
				
				// 여기부터가 원래 있던 코드
				TipsDAO dao = TipsDAO.getInstance();

				// List<TipsDTO> list = dao.selectAll();
				// System.out.println(list);

				String tips_writer = (String) (request.getSession().getAttribute("loginID"));
				String tips_title = multi.getParameter("tips_title");
				System.out.println(tips_title);
				String tips_contents = multi.getParameter("tips_contents");
				String tips_bullet = multi.getParameter("tips_bullet");

				int seq = TipsDAO.getInstance().getnextval();
				
				TipsDTO dto = new TipsDTO(seq, tips_title, tips_writer, tips_contents, null, 0, "", 0, tips_bullet, 0, null);

				dao.insert(dto);

				// 여기부터 파일 업로드 하는 코드
				

				Enumeration<String> e = multi.getFileNames();

				while (e.hasMoreElements()) { // rs.next()와 유사
					String name = e.nextElement();
					System.out.println(name);

					String oriName = multi.getOriginalFileName(name);
					if (oriName == null) {
						continue;
					}
					String sysName = multi.getFilesystemName(name);
					int seq1 = Tips_imagesDAO.getInstance().getnextval();
					Tips_imagesDAO.getInstance().insert(new Tips_imagesDTO(seq1, oriName, sysName, seq));
				}
				// request.setAttribute("list", list);
				response.sendRedirect("/list.tips?cpage=1");
				// request.getRequestDispatcher("/tips/TipsDummy.jsp").forward(request,
				// response);
			} else if (uri.equals("/list.tips")) {

				TipsDAO dao = TipsDAO.getInstance();
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				// List<TipsDTO> list = dao.selectAll();
				String id = (String) request.getSession().getAttribute("loginID");
				boolean member_role = MembersDAO.getInstance().isYouTeacher(id);

				List<TipsDTO> list = TipsDAO.getInstance().selectByRange(cpage * 21 - 20, cpage * 21);
				List<TipsDTO> list1 = TipsDAO.getInstance().selectBybullet1(cpage * 21 - 20, cpage * 21, null);
				List<TipsDTO> list2 = TipsDAO.getInstance().selectBybullet2(cpage * 21 - 20, cpage * 21, null);
				List<TipsDTO> list3 = TipsDAO.getInstance().selectBybullet3(cpage * 21 - 20, cpage * 21, null);
				List<TipsDTO> list4 = TipsDAO.getInstance().selectBybullet4(cpage * 21 - 20, cpage * 21, null);

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

			else if (uri.equals("/detail.tips")) {

				TipsDAO dao = TipsDAO.getInstance();
				Tips_imagesDAO dao1 = Tips_imagesDAO.getInstance();
				// 숨긴 tips_seq를 가져와서 TipsDTO dto = dao.detail(tips_seq) 이렇게 넣어야함

				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));

				TipsDTO dto = dao.detail(tips_seq);
				TipsDAO.getInstance().addViewCount(tips_seq);
				boolean member_role = MembersDAO.getInstance().isYouAdmin(id);
				request.setAttribute("oriName", dao1.getImageOriName(tips_seq));
				request.setAttribute("dto", dto);
				request.setAttribute("loginID", id);
				request.setAttribute("member_role", member_role);
				request.getRequestDispatcher("/tips/tipsDetail.jsp").forward(request, response);

			} else if (uri.equals("/thumbsup.tips")) {
				TipsDAO dao = TipsDAO.getInstance();

				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));

				TipsDAO.getInstance().addthumbsupCount(tips_seq);

				request.getRequestDispatcher("/list.tips").forward(request, response);
			}

			else if (uri.equals("/delete.tips")) {
				TipsDAO dao = TipsDAO.getInstance();

				String id = (String) (request.getSession().getAttribute("loginID"));
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));

				dao.delete(tips_seq);

				request.getRequestDispatcher("/list.tips").forward(request, response);
			}

			else if (uri.equals("/gomodify.tips")) {
				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));

				request.setAttribute("tips_seq", tips_seq);

				request.getRequestDispatcher("/tips/tipsModify.jsp").forward(request, response);
			}

			else if (uri.equals("/update.tips")) {
				TipsDAO dao = TipsDAO.getInstance();

				int tips_seq = Integer.parseInt(request.getParameter("tips_seq"));
				String tips_title = request.getParameter("tips_title");
				String tips_contents = request.getParameter("tips_contents");

				dao.update(tips_title, tips_contents, tips_seq);

				request.getRequestDispatcher("/detail.tips?tips_seq=" + tips_seq).forward(request, response);
				// response.sendRedirect("/detail.jsp?tips_seq="+tips_seq);
				// please
				// please

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
