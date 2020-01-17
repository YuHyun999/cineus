package faqboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/customerboard/*")
public class BoardController extends HttpServlet{
	
	BoardBean boardBean;
	BoardService boardService;
	BoardDAO boardDAO;
	
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		boardBean = new BoardBean();
		boardDAO = new BoardDAO();
		
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getPathInfo();
		System.out.println("action:" + action);
		
		try {
			List<BoardBean> boardList = new ArrayList<BoardBean>();
			
			
			if(action == null){
				nextPage = "/customer/customcenter.jsp";
			}else if(action.equals("/customcenter.do")) {
				nextPage = "/customer/customcenter.jsp";
			}else if(action.equals("/FAQcenter.do")) {
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getCount();
				int pageSize = 10;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				boardList = boardService.getFAQList(boardList, startRow);
				request.setAttribute("boardList", boardList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customer/FAQcenter.jsp";
			}else if(action.equals("/searchList.do")) {
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String selectVal = request.getParameter("selectVal"); // FAQcenter.jsp 페이지에서 검색 카테고리 선택값
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int pageSize = 10;
				int startRow = (pageNum - 1) * pageSize;
				boardList = boardService.getsearchList(boardList, startRow, searchVal, selectVal);
				int count = boardService.getsearchCount(searchVal, selectVal);
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				request.setAttribute("boardList", boardList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customer/FAQcenter.jsp";
			}
			
			if(action != null) {
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
