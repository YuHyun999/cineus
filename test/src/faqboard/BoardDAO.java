package faqboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import faqboard.BoardBean;

public class BoardDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	// 커넥션 풀로부터 커넥션을 얻기위한 메소드
	private Connection getConnection() throws Exception{
		con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		con = ds.getConnection();
		
		return con;
	} // getConnection() 메소드 끝
	
	 public void disconnect() throws SQLException {
		    if(rs != null) {
		      rs.close();
		    }
		    if(pstmt != null) pstmt.close();
		    if(con != null) con.close();
	 }
	 
	 public List<NoticeBean> getNoticeListTop5(List<NoticeBean> noticeList) {
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board order by num desc limit 0, 5";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 public NoticeBean getNextNoticeContent(NoticeBean nextNoticeContent, int num, String location) {
		 
		 try {
			 con = getConnection();
			 if(location.equals("전체")) {
				 sql = "select * from notice_board where num = (select max(num) from notice_board where location = '전체' and num < ?)";
			 }else {
				 sql = "select * from notice_board where num = (select max(num) from notice_board where location != '전체' and num < ?)";
			 }
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			 
			 rs.next();
			 nextNoticeContent.setNum(rs.getInt("num"));
			 nextNoticeContent.setLocation(rs.getString("location"));
			 nextNoticeContent.setSubject(rs.getString("subject"));
			 nextNoticeContent.setContent(rs.getString("content"));
			 nextNoticeContent.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 		 
		 return nextNoticeContent;
	 }
	 
	 public NoticeBean getPrevNoticeContent(NoticeBean prevNoticeContent, int num, String location) {
		 
		 try {
			 con = getConnection();
			 if(location.equals("전체")) {
				 sql = "select * from notice_board where num = (select min(num) from notice_board where location = '전체' and num > ?)";
			 }else {
				 sql = "select * from notice_board where num = (select min(num) from notice_board where location != '전체' and num > ?)";
			 }
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			 rs.next();
			 prevNoticeContent.setNum(rs.getInt("num"));
			 prevNoticeContent.setLocation(rs.getString("location"));
			 prevNoticeContent.setSubject(rs.getString("subject"));
			 prevNoticeContent.setContent(rs.getString("content"));
			 prevNoticeContent.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 
		 return prevNoticeContent;
	 }
	 
	 public NoticeBean getNoticeContent(NoticeBean noticeBean, int num) {
		 
		 try {
			 con = getConnection();
			 sql = "select * from notice_board where num = ?";
			 
			 pstmt = con.prepareStatement(sql);
			 pstmt.setInt(1, num);
			 rs = pstmt.executeQuery();
			
			 rs.next();
			noticeBean.setNum(rs.getInt("num"));
			noticeBean.setLocation(rs.getString("location"));
			noticeBean.setSubject(rs.getString("subject"));
			noticeBean.setContent(rs.getString("content"));
			noticeBean.setWriteDate(rs.getDate("writeDate"));
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
		}
		 
		 return noticeBean;
	 }
	 
	 public int getLocationSearchCount(String searchVal, String selectVal, String cinemaSelectVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location != '전체' AND location like ? AND location like ? AND subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 public List<NoticeBean> getLocationSearch(List<NoticeBean> locationList, int startRow, String searchVal, String selectVal, String cinemaSelectVal) {
		 

		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location != '전체' AND location like ? AND location like ? AND subject like ? order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+selectVal+"%");
				pstmt.setString(2, "%"+cinemaSelectVal+"%");
				pstmt.setString(3, "%"+searchVal+"%");
				pstmt.setInt(4, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					locationList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return locationList;
	 }
	 
	 public int getAllSearchCount(String searchVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location = '전체' AND subject like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 public List<NoticeBean> getAllSearchList(List<NoticeBean> noticeList, int startRow, String searchVal) {
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location = '전체' AND subject like ? order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setInt(2, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 public int getLocationCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location != '전체'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 public List<NoticeBean> getLocationList(List<NoticeBean> locationList, int startRow) {
		 
 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location != '전체' order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					locationList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return locationList;
	 }
	 
	 public int getNoticeCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from notice_board where location = '전체'";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}
	 
	 public List<NoticeBean> getNoticeList(List<NoticeBean> noticeList, int startRow) {
		 
 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from notice_board where location = '전체' order by num desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					NoticeBean bBean = new NoticeBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setLocation(rs.getString("location"));
					bBean.setSubject(rs.getString("subject"));
					bBean.setContent(rs.getString("content"));
					bBean.setWriteDate(rs.getDate("writeDate"));
					
					noticeList.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		 
		 return noticeList;
	 }
	 
	 public int getCountsearchList(String searchVal, String selectVal) {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from faq_board where question like ? AND faq_group like ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setString(2, "%"+selectVal+"%");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getCountsearchList()메소드의 끝
	 
	 
	 
	 public List<BoardBean> getsearchList(List<BoardBean> list, int startRow, String searchVal, String selectVal) {
		 
		 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from faq_board where question like ? AND faq_group like ? order by hit desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+searchVal+"%");
				pstmt.setString(2, "%"+selectVal+"%");
				pstmt.setInt(3, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setFaq_group(rs.getString("faq_group"));
					bBean.setQuestion(rs.getString("question"));
					bBean.setAnswer(rs.getString("answer"));
					bBean.setHit(rs.getInt("hit"));
					
					list.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		return list;
	 }
	 
	 public int getBoardCount() {

			int count = 0;
			
			try {
				con = getConnection();
				sql = "select count(*) from faq_board";
				
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
							
				
			} catch (Exception e) {
				System.out.println("getBoardCount()메소드에서 발생한 예외" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getBoardCount()메소드의 끝
	 
	 public List<BoardBean> getFQABoard(List<BoardBean> list, int startRow) {
		 
		 
		 
		 try {
				// 커넥션풀로 부터 커넥션 얻기(DB접속)
				con = getConnection();
				// SQL SELECT
				sql = "select * from faq_board order by hit desc limit ?, 10";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt("num"));
					bBean.setFaq_group(rs.getString("faq_group"));
					bBean.setQuestion(rs.getString("question"));
					bBean.setAnswer(rs.getString("answer"));
					bBean.setHit(rs.getInt("hit"));
					
					list.add(bBean);
				}
				
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 try{
		 disconnect();
			 }catch(Exception e) {
				 e.printStackTrace();
			 }
		 }
		return list;
	 }

}
