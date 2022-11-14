package CONTROLLERS;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import DAO.MypageAjaxDAO;
import DAO.WishlistDAO;
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
			String id = (String) request.getSession().getAttribute("loginID");
			String amount = request.getParameter("amount");
			String price = request.getParameter("price");
			String name = request.getParameter("name");
			
			@SuppressWarnings("unchecked")
			List<String> amountarr = (List<String>)g.fromJson(amount, ArrayList.class);
			
			@SuppressWarnings("unchecked")
			List<Integer> pricearr = (List<Integer>)g.fromJson(price, ArrayList.class);
			
			@SuppressWarnings("unchecked")
			List<String> namearr = (List<String>)g.fromJson(name, ArrayList.class);
			
			System.out.println(namearr);
			System.out.println(amountarr);
			System.out.println(pricearr);
			
			WishlistDAO.getInstance().updateByWishlist(amountarr, namearr, id);
		
			String json_amountarr = g.toJson(amountarr);
			String json_pricearr = g.toJson(pricearr);

			JsonObject total = new JsonObject();
			
			total.addProperty("amountarr", json_amountarr);
			total.addProperty("pricearr", json_pricearr);
			
			response.setContentType("text/html;charset+utf8");
			
			response.getWriter().append(total.toString());
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
