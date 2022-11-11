package CONTROLLERS;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DAO.MypageAjaxDAO;
import DTO.QnaCommentsDTO;
import DTO.QnaDTO;


@WebServlet("*.ajax")
public class MypageAjaxController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI();
		
		try {
			
		//mypage list up
		if(uri.equals("/mypageComments.ajax")) {
			JsonObject total = new JsonObject();
			
			int cpage = Integer.parseInt(request.getParameter("cpage"));
			String loginID = (String)request.getSession().getAttribute("loginID");

			List<QnaCommentsDTO> list = MypageAjaxDAO.getInstance().selectByRange(loginID,cpage*10-9,cpage*10);
			List<QnaDTO> list2 = MypageAjaxDAO.getInstance().selectByRange2(loginID,cpage*10-9,cpage*10);
			String navi = MypageAjaxDAO.getInstance().getPageNavi(cpage);

			
			total.addProperty("navi",new Gson().toJson(navi));
			total.addProperty("list",new Gson().toJson(list));
			total.addProperty("list2",new Gson().toJson(list2));
			
			response.setContentType("text/html;charset=utf8");
			
			response.getWriter().append(total.toString());
			
		}
		
		if(uri.equals("/wishlist.ajax")) {
			
			Gson g = new Gson();
			String amount = request.getParameter("amount");
			String price = request.getParameter("price");
			
			System.out.println(amount);
			System.out.println(price);
//			System.out.println(amount);
//			System.out.println(price);
//
//			amount = amount.replace("\"", "");
//			amount = amount.replace("[", "");
//			amount = amount.replace("]", "");
//			System.out.println(amount);
//			
//			List<String> amountList = new ArrayList<String>(Arrays.asList(amount.split(",")));
//			
//			System.out.println(amountList);  
			
//			Gson g = new Gson();
//			JsonParser parser = new JsonParser();
//
//			
//			JsonArray arr = (JsonArray) parser.parse(amount);
//			System.out.println(arr.get);	
			response.getWriter().append("clear");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	
	
	
	
	
	
	
	
	
	
	
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
