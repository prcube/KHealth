package CONTROLLERS;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
			
			try(ServletOutputStream sos = response.getOutputStream();
					FileInputStream fis = new FileInputStream(target);
//					사용하기 편하게 업그레이드 시킴.
					DataInputStream dis = new DataInputStream(fis);){
//					파일이 모두 byte배열로 넘어온다.
					dis.readFully(fileContents);
					sos.write(fileContents);
					sos.flush();
			}
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
