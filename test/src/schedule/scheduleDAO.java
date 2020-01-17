package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import Theater.TheaterDTO;

public class scheduleDAO {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql;
	
	private void getConnection(){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/CineUs");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void close(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<scheduleDTO> getScheduleListByScreen(int s_idx, int t_idx, int l_idx, int year, int week){
		//넘겨받은 값은 검색시작년도(year, 예를 들어 2020), 검색할 주(week, 1부터 시작함)
		List<scheduleDTO> list=new ArrayList<>();
		/*sql="select * from schedule where screen_ID=?, theater_ID=?";*/
		/*전달받은 값은 아이디와 반드시 일치하지는 않는다.
		theater_ID의 경우 83번부터 시작함. 그러므로 index에 대응하는 id를 찾으려면 
		sql문이 길어진다.*/
		sql="select schedule_ID, schedule_date, "
			+"date_format(start_at, '%H%i'), date_format(end_at, '%H%i'), "
			+"movie_ID, screen_ID, theater_ID from schedule "
			+"where screen_ID=? and theater_ID=("
		   +"select theater_ID from theater where code=("
		   +"select code from locations where group_num=?"
		   +")"
		   +"order by " 
		   +"if(ascii(substring(name,1))<128,9,1) asc, name asc " 
		   +"limit ?,1"
		   +") and week(schedule_date,0)=? and year(schedule_date)=?;";
		try{
			getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,s_idx);
			pstmt.setInt(2,l_idx);
			pstmt.setInt(3,t_idx-1);
			pstmt.setInt(4, week-1);
			pstmt.setInt(5, year);
			System.out.println(pstmt.toString());
			rs=pstmt.executeQuery();
			while(rs.next()){
				scheduleDTO dto=new scheduleDTO(
						rs.getInt(1),
						rs.getDate(2),
						rs.getString(3),
						rs.getString(4),
						rs.getInt(5),
						rs.getInt(6),
						rs.getInt(7)
				);
				
				list.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			close();
		}
		
		return list;
	}
	
}
