package movie;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
		case "getMoviesListMore.do": //ajax
			getMoviesListMore();
			break;
		case "getMovieInfo.do":
			getMovieInfo();
			break;
		case "movieLikeToggle.do": //ajax
			movieLikeToggle();
			break;
		case "getMoviePictures.do": //ajax
			getMoviePictures();
			break;
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
	
	/****************************************************************************/

	private void getMoviesListMore() { //ajax
		
		/*List<MovieDTO> list=movie_dao.getMoviesList(); */
		int start=Integer.parseInt(request.getParameter("curr_list_len"));
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
		try {
			PrintWriter out = response.getWriter();
			/*Gson gson = new Gson();*/
			Gson gson =  new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			out.print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//getMoviesListMore() 끝
	
	
	
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
	
	//전달받은 영화 ID에 해당하는  영화 사진들을 돌려준다.
	private void getMoviePictures() { 	//ajax
		//response.setContentType("image/jpeg");
		response.setContentType("application/json;charset=utf-8");

		String path=request.getParameter("path");
        String pathToWeb = getServletContext().getRealPath(path);
        File f = new File(pathToWeb);

       // List<File> resultList = new ArrayList<File>(); //이미지 파일을 저장할 리스트 생성
        List<String> resultList = new ArrayList<>();
        //지정한 이미지폴더가 존재 할지 않을경우 빈 리스트 반환.
       //System.out.println("파일존재 여부: "+file.exists());
       if(!f.exists()){
    	   return;
       }
       
       File[] list = f.listFiles(new FileFilter() { //원하는 파일만 가져오기 위해 FileFilter정의
           
           String strImgExt = "jpg|jpeg|png|gif|bmp"; //허용할 이미지타입
           
           @Override
           public boolean accept(File pathname) {                            
               
               //System.out.println(pathname);
               boolean chkResult = false;
               if(pathname.isFile()) {
                   String ext = pathname.getName().substring(pathname.getName().lastIndexOf(".")+1);
                   //System.out.println("확장자:"+ext);
                   chkResult = strImgExt.contains(ext.toLowerCase());        
                   //System.out.println(chkResult +" "+ext.toLowerCase());
               } else {
                   chkResult = true;
               }
               return chkResult;
           }
       });        
       
       for(File i : list) {            
           if(i.isDirectory()) {
               //폴더이면 이미지목록을 가져오는 현재메서드를 재귀호출
               /*resultList.addAll(getImgFileList(i));   */  
           }else {            
               //폴더가 아니고 파일이면 리스트(resultList)에 추가
               /*resultList.add(i);*/
        	   resultList.add(i.getName());
           }
       }            
       try {
			PrintWriter out = response.getWriter();
			Gson gson = new Gson();
			out.print(gson.toJson(resultList));
		} catch (IOException e) {
			e.printStackTrace();
		}
        
    }//getMoviePictures() 메서드 끝
	
	
	
	//해당 영화에 좋아요를 한 상태라면 movie_like를 없애고==]
	//좋아요를 하지 않은 상태라면 movie_like를 생성한다.
	private void movieLikeToggle(){ //ajax
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
