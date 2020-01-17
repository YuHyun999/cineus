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
}
