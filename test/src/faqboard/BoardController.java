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
	
	/**
	 * 
	 */
	NoticeBean noticeBean;
	BoardBean boardBean;
	BoardService boardService;
	BoardDAO boardDAO;
	
	public void init(ServletConfig config) throws ServletException {
		boardService = new BoardService();
		boardBean = new BoardBean();
		boardDAO = new BoardDAO();
		noticeBean = new NoticeBean();
		
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
			List<NoticeBean> noticeList = new ArrayList<NoticeBean>();
			List<NoticeBean> locationList = new ArrayList<NoticeBean>();
			
			if(action == null){
				int startRow = 0;
				boardList = boardService.getFAQList(boardList, startRow);
				noticeList = boardService.getNoticeListTop5(noticeList);
				request.setAttribute("boardList", boardList);
				request.setAttribute("noticeList", noticeList);
				nextPage = "/customboard/customcenter.jsp";
			}else if(action.equals("/customcenter.do")) { // 고객센터 메인페이지 이동
				int startRow = 0;
				boardList = boardService.getFAQList(boardList, startRow);
				noticeList = boardService.getNoticeListTop5(noticeList);
				request.setAttribute("boardList", boardList);
				request.setAttribute("noticeList", noticeList);
				nextPage = "/customboard/customcenter.jsp";
			}else if(action.equals("/FAQcenter.do")) { //FAQ게시판으로 이
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
				nextPage = "/customboard/FAQcenter.jsp";
			}else if(action.equals("/searchList.do")) { // FAQ게시판 검색 이동
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
				nextPage = "/customboard/FAQcenter.jsp";
			}else if(action.equals("/noticecenter.do")) { // 공지사항 게시판의 전체 영화관 공지게시판으로 이동하는 주소
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getNoticeCount();
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getNoticeList(noticeList, startRow);
				locationList = boardService.getLocationList(locationList, startRow);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/locationnotice.do")) { // 공지사항 게시판의 영화관별 공지로 가는 주소
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getNoticeCount();
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getNoticeList(noticeList, startRow);
				locationList = boardService.getLocationList(locationList, startRow);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/allNoticeSearch.do")) { // 공지사항 전체공지에 대한 검색이동
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getAllSearchCount(searchVal);
				int locationCount = boardService.getLocationCount();
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				noticeList = boardService.getAllSearchList(noticeList, startRow, searchVal);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
				
			}else if(action.equals("/locationSearch.do")) { // 공지사항 게시판 지역 및 영화관 검색 이동
				String searchVal = request.getParameter("searchVal"); // FAQcenter.jsp 페이지에서 검색한 값
				String selectVal = request.getParameter("selectVal"); // FAQcenter.jsp 페이지에서 검색 카테고리 선택값
				String cinemaSelectVal = request.getParameter("cinemaSelectVal");
				String _pageNum = request.getParameter("pageNum");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int count = boardService.getAllSearchCount(searchVal);
				int locationCount = boardService.getLocationSearchCount(searchVal, selectVal, cinemaSelectVal);
				int pageSize = 10;
				int pageBlock = 10;
				int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1:0) * pageBlock + 1);
				int endPage = startPage + pageBlock - 1;
				int locationEndPage = startPage + pageBlock - 1;
				int startRow = (pageNum - 1) * pageSize;
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				int locationPageCount = locationCount / pageSize + (locationCount % pageSize == 0 ? 0 : 1);
				if(locationEndPage > locationPageCount) {
					locationEndPage = locationPageCount;
				}
				locationList = boardService.getLocationSearch(locationList, startRow, searchVal, selectVal, cinemaSelectVal);
				request.setAttribute("noticeList", noticeList);
				request.setAttribute("pageCount", pageCount);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("loactionList", locationList);
				request.setAttribute("locationPageCount", locationPageCount);
				request.setAttribute("locationEndPage", locationEndPage);
				nextPage = "/customboard/noticecenter.jsp";
			}else if(action.equals("/readNotice.do")) { // 공지사항게시판 상세보기
				String _pageNum = request.getParameter("pageNum");
				String _num = request.getParameter("num");
				String location = request.getParameter("location");
				int pageNum = Integer.parseInt(((_pageNum==null)? "1":_pageNum));
				int num = Integer.parseInt(_num);
				System.out.println("location : " + location);
				NoticeBean noticeContent = new NoticeBean();
				NoticeBean nextNoticeContent = new NoticeBean();
				NoticeBean prevNoticeContent = new NoticeBean();
				noticeContent = boardService.getNoticeContent(noticeContent, num);
				nextNoticeContent = boardService.getNextNoticeContent(nextNoticeContent, num, location);
				prevNoticeContent = boardService.getPrevNoticeContent(prevNoticeContent, num, location);
				request.setAttribute("noticeContent", noticeContent);
				request.setAttribute("nextNoticeContent", nextNoticeContent);
				request.setAttribute("prevNoticeContent", prevNoticeContent);
				request.setAttribute("pageNum", pageNum);
				nextPage = "/customboard/readNotice.jsp";
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
