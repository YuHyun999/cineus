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
	
	// 커넥?�� ??로�??�� 커넥?��?�� ?��기위?�� 메소?��
	private Connection getConnection() throws Exception{
		con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
		con = ds.getConnection();
		
		return con;
	} // getConnection() 메소?�� ?��
	
	 public void disconnect() throws SQLException {
		    if(rs != null) {
		      rs.close();
		    }
		    if(pstmt != null) pstmt.close();
		    if(con != null) con.close();
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
				System.out.println("getBoardCount()메소?��?��?�� 발생?�� ?��?��" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getCountsearchList()메소?��?�� ?��
	 
	 
	 
	 public List<BoardBean> getsearchList(List<BoardBean> list, int startRow, String searchVal, String selectVal) {
		 
		 
		 
		 try {
				// 커넥?��??�? �??�� 커넥?�� ?���?(DB?��?��)
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
				System.out.println("getBoardCount()메소?��?��?�� 발생?�� ?��?��" + e);
			}finally {
				try {
					disconnect();
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			}

			return count;
		}// getBoardCount()메소?��?�� ?��
	 
	 public List<BoardBean> getFQABoard(List<BoardBean> list, int startRow) {
		 
		 
		 
		 try {
				// 커넥?��??�? �??�� 커넥?�� ?���?(DB?��?��)
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
