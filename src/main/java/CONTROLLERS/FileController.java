package CONTROLLERS;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("*.file")
public class FileController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String filePath = request.getServletContext().getRealPath("files");
		
		if (uri.equals("/download.file")) {
			String sysName = request.getParameter("sysname");
			String oriName = request.getParameter("oriname");
			
			File target = new File(filePath + "/" + sysName);
			System.out.println(filePath + "/" + sysName);
			
			byte[] fileContents = new byte[(int)target.length()];
			
			response.reset();
			
			response.setHeader("Content-Disposition","attachment;filename=\""+oriName+"\"");
			
		}else if(uri.equals("/upload.file")) {
			String uploadPath = 
					request.getServletContext().getRealPath("upload");
			File uploadPathF = new File(uploadPath);
			if(!uploadPathF.exists()) {
				uploadPathF.mkdir();
			}
			// 클라이언트가 업로드할 파일의 위치를 지정하는 곳
			System.out.println("저장 경로 : " + uploadPath);
			
			MultipartRequest multi = 
					new MultipartRequest(
							request, // MultipartRequest로 분석할 Request객체
							uploadPath, // 전송되어 온 파일을 보관할 경로
							1024*1024*10, // 전송되어 올 파일의 사이즈를 제한하는 부분
							"utf8", // 전송되어 오는 데이터에 ASCII 범주를 벗어나는 문자를 처리하는 방식
							new DefaultFileRenamePolicy() // 같은 파일 이름이 있을 경우에 대한 조치
							);
			// 클라이언트가 발송하는 multipart/form-data 형태의 데이터를 분석할 수 있는 자료형
			
			String sysName = multi.getFilesystemName("imgFile");
			String oriName = multi.getOriginalFileName("imgFile");
			// files 테이블에 저장
			System.out.println("저장된 이름 : " + sysName);
			System.out.println("원래 이름 : " + oriName);
			response.getWriter().append("upload/"+sysName);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
