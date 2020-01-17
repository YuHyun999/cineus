package movie;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/movie/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	MovieDAO movie_dao;
	MovieLikeDAO movie_like_dao;
	
	HttpServletRequest request;
	HttpServletResponse response;
	
	String next_page;	//initial value : null
	
	@Override
	public void init() throws ServletException {
		movie_dao=new MovieDAO();
		movie_like_dao=new MovieLikeDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	public void doHandle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("ProductController의 doHandle 안");
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		System.out.println(action);
		
		switch(action){
		case "getMoviesList.do":
			getMoviesList();
			break;
		case "getMovieInfo.do":
			getMovieInfo();
		case "movieLikeToggle.do": //ajax
			movieLikeToggle();
		}//switch-case 끝
	}//doHandle 끝

	/****************************************************************************/

	private void getMoviesList() {
		
		/*List<MovieDTO> list=movie_dao.getMoviesList(); */
		int start=0;
		int length=12; //12개 기본
		int condition=1;
		int option=1;
		if(request.getParameter("h_condition")!=null){
			condition=Integer.parseInt((String) request.getParameter("h_condition"));
		}
		if(request.getParameter("h_option")!=null){
			option=Integer.parseInt((String) request.getParameter("h_option"));
		}
		
		List<MovieDTO> list=movie_dao.getMoviesListLimit(start,length,condition,option);
		request.setAttribute("list", list);
		request.setAttribute("list_condition", condition);
		request.setAttribute("list_option", option);
		next_page="/views/main.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//getMoviesList() 끝
	
	private void getMovieInfo(){
		int movie_ID=Integer.parseInt(request.getParameter("movie_ID"));
		String customer_ID=null;
		HttpSession session = request.getSession(true);
		if(session.getAttribute ("id")==null){
		}
		else{ //널이 아니면 읽는다
			customer_ID= (String)session.getAttribute ("id");//get user id
		}
		MovieDTO dto=movie_dao.getMovieDTO(movie_ID);
		
		System.out.println("customer_ID는 "+customer_ID);
		
		request.setAttribute("m", dto);
		request.setAttribute("m_like", movie_like_dao.getMoiveLikeTotal(movie_ID));
		if(customer_ID!=null){
			request.setAttribute("m_like_ison",movie_like_dao.movieLikeExists(movie_ID, customer_ID));
		}
		next_page="/views/movie/movieInfo.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//해당 영화에 좋아요를 한 상태라면 movie_like를 없애고==]
	//좋아요를 하지 않은 상태라면 movie_like를 생성한다.
	private void movieLikeToggle(){ //ajax
		System.out.println("토글 함수 안");
		if(request.getParameter("m_id")==null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('보고싶어를 누르려면 먼저 로그인하세요')</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		int m_id=Integer.parseInt(request.getParameter("m_id")); //오류나는데 작동은 잘함
																//일단 넘어가자
		String c_id=request.getParameter("c_id");
		boolean result=movie_like_dao.movieLikeToggle(m_id, c_id);
		
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	

}
