package CONTROLLERS;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.AdminDAO;
import DAO.ImagesDAO;
import DTO.AdminDTO;
import DTO.ImagesDTO;
import DTO.ProductDTO;


@WebServlet("*.admin")
public class AdminController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		
		String uri = request.getRequestURI();
		
		if(uri.equals("write.admin")) {
			
			try {
				int maxSize = 1024*1024*10; 

				String savePath = request.getServletContext().getRealPath("/image");
				String writer = (String) request.getSession().getAttribute("loginId");
				File imageSavePath = new File(savePath);  

				if(!imageSavePath.exists()) {
					imageSavePath.mkdir();
				}

				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());

				
				String product_name = multi.getParameter("product_name");
				String product_price = multi.getParameter("product_price");
				String product_count = multi.getParameter("product_count");
				String product_review = multi.getParameter("product_review");
				
				
				int seq = AdminDAO.getInstance().getnextval();
				
				 AdminDAO.getInstance().insertProduct(new ProductDTO(seq, product_name, product_price, product_count, product_review ));
				
				Enumeration<String> e = multi.getFileNames();
				
				while(e.hasMoreElements()) { //rs.next()와 유사
					String name = e.nextElement();
					System.out.println(name);

					String oriName = multi.getOriginalFileName(name);
					if(oriName == null) {continue;}
					String sysName = multi.getFilesystemName(name);
					ImagesDAO.getInstance().insert(new ImagesDTO(0,oriName, sysName, seq));
				}
				
				
				
				System.out.println("여기까진 완료");
				response.sendRedirect("/list.board?cpage=1");
				
			
			}
			catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
