/*
 * package QNACONTROLLERS;
 * 
 * import java.io.IOException; import java.util.List;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse;
 * 
 * import DAO.QnaDAO; import DTO.QnaDTO;
 * 
 * 
 * 
 * 
 * 
 * @WebServlet("*.qna") public class QnaController extends HttpServlet {
 * 
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * String uri = request.getRequestURI();
 * 
 * request.setCharacterEncoding("utf8");
 * 
 * try { if(uri.equals("/list.qna")) {
 * 
 * 
 * QnaDAO dao = QnaDAO.getInstance(); List<QnaDTO> list = dao.selectAll();
 * System.out.println(list);
 * 
 * 
 * 
 * request.setAttribute("list", list);
 * 
 * 
 * request.getRequestDispatcher("/qna/QnaDummy.jsp").forward(request, response);
 * 
 * 
 * }else if(uri.equals("/write.qna")) { QnaDAO dao = QnaDAO.getInstance();
 * 
 * 
 * String qna_title = request.getParameter("qna_title"); String qna_contents =
 * request.getParameter("qna_contents");
 * 
 * 
 * QnaDTO dto = new QnaDTO(0, qna_title, "", qna_contents, null, 0,"");
 * dao.write(dto);
 * 
 * 
 * response.sendRedirect("/list.qna"); //게시판 1페이지로 이동
 * 
 * }else if(uri.equals("/detail.qna")) { QnaDAO dao = QnaDAO.getInstance(); int
 * seq = Integer.parseInt(request.getParameter("qna_seq"));
 * 
 * QnaDTO dto = dao.selectBySeq(seq); request.setAttribute("dto", dto);
 * 
 * request.getRequestDispatcher("/qna/QnadetailView.jsp").forward(request,
 * response);
 * 
 * // }else if(uri.equals("/update.qna")) { // int qna_seq =
 * Integer.parseInt(request.getParameter("qna_seq")); // String qna_title =
 * request.getParameter("qna_title"); // String qna_contents =
 * request.getParameter("qna_contents"); // // int resilt =
 * QnaDAO.getInstance().updateBySeq(qna_title, qna_contents, qna_seq); // //
 * response.sendRedirect("/detail.qna?seq="+qna_seq); // }else
 * if(uri.equals("/delete.qna")) {
 * 
 * int qna_seq = Integer.parseInt(request.getParameter("qna_seq")); QnaDAO dao =
 * QnaDAO.getInstance(); int result = dao.deleteBySeq(qna_seq);
 * response.sendRedirect("/list.qna");
 * 
 * // }else if(uri.equals("/detail.board")) { // // int qna_seq =
 * Integer.parseInt(request.getParameter("qna_seq")); // QnaDTO dto =
 * QnaDAO.getInstance().selectBySeq(qna_seq); // //
 * QnaDAO.getInstance().addViewCount(qna_seq); // //조회수를 증가시키는 기능 // ////
 * List<CommentsDTO> list =
 * CommentsDAO.getInstance().selectByParentSeq(qna_seq); // //DB에서 comments 데이터를
 * 가져오는 것 // //댓글이 여러개 일 수 있으니 List를 사용하자 // // request.setAttribute("dto",
 * dto); //// request.setAttribute("comments", list); //
 * request.getRequestDispatcher("/qna/detailView.jsp").forward(request,
 * response); } }catch (Exception e) { e.printStackTrace();
 * response.sendRedirect("/error.jsp"); } }
 * 
 * 
 * protected void doPost(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * 
 * doGet(request, response); }
 * 
 * }
 */
      