package faqboard;

import java.util.List;

public class BoardService {

	BoardDAO boardDAO;
	

	public BoardService() {
		boardDAO = new BoardDAO();
	}
	
	public int getCount() {
		int count = boardDAO.getBoardCount();
		return count;
	}
	
	public List<BoardBean> getFAQList(List<BoardBean> boardList, int startRow) {
		
		boardList = boardDAO.getFQABoard(boardList, startRow);		
		
		return boardList;
		
	}
	
	public List<BoardBean> getsearchList(List<BoardBean> boardList, int startRow, String searchVal, String selectVal) {
		
		boardList = boardDAO.getsearchList(boardList, startRow, searchVal, selectVal);		
		
		return boardList;
		
	}
	
	public int getsearchCount(String searchVal, String selectVal) {
		int count = boardDAO.getCountsearchList(searchVal, selectVal);
		return count;
	}
	
	public List<NoticeBean> getNoticeListTop5(List<NoticeBean> noticeList) {
		noticeList = boardDAO.getNoticeListTop5(noticeList);
		
		return noticeList;
	}
	
	public List<NoticeBean> getNoticeList(List<NoticeBean> noticeList, int startRow) {
		noticeList = boardDAO.getNoticeList(noticeList, startRow);
		
		return noticeList;
	}
	
	public int getNoticeCount() {
		int count = boardDAO.getNoticeCount();
		return count;
	}
	
	public int getLocationCount() {
		int locationCount = boardDAO.getLocationCount();
		return locationCount;
	}
	
	public List<NoticeBean> getLocationList(List<NoticeBean> locationList, int startRow) {
		locationList = boardDAO.getLocationList(locationList, startRow);
		
		return locationList;
	}
	
	public List<NoticeBean> getAllSearchList(List<NoticeBean> noticeList, int startRow, String searchVal) {
		noticeList = boardDAO.getAllSearchList(noticeList, startRow, searchVal);
		
		return noticeList;
	}
	
	public int getAllSearchCount(String searchVal) {
		int count = boardDAO.getAllSearchCount(searchVal);
		return count;
	}
	
	public int getLocationSearchCount(String searchVal, String selectVal, String cinemaSelectVal) {
		int locationCount = boardDAO.getLocationSearchCount(searchVal, selectVal, cinemaSelectVal);
		return locationCount;
	}
	
	public List<NoticeBean> getLocationSearch(List<NoticeBean> locationList, int startRow, String searchVal, String selectVal, String cinemaSelectVal) {
		locationList = boardDAO.getLocationSearch(locationList, startRow, searchVal, selectVal, cinemaSelectVal);
		
		return locationList;
	}
	
	public NoticeBean getNoticeContent(NoticeBean noticeContent, int num) {
		
		noticeContent = boardDAO.getNoticeContent(noticeContent, num);
		
		return noticeContent;
	}
	
	public NoticeBean getNextNoticeContent(NoticeBean nextNoticeContent, int num, String location) {
		nextNoticeContent = boardDAO.getNextNoticeContent(nextNoticeContent, num, location);
		
		return nextNoticeContent;
	}
	
	public NoticeBean getPrevNoticeContent(NoticeBean prevNoticeContent, int num, String location) {
		prevNoticeContent = boardDAO.getPrevNoticeContent(prevNoticeContent, num, location);
		
		return prevNoticeContent;
	}
	

	
}
