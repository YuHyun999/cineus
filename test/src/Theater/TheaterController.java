package Theater;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class TheaterController
 */
@WebServlet("/theater/*")
public class TheaterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	TheaterDAO dao;
	List<TheaterDTO> theaters_list;
	List<Integer> theaters_num_list_by_group; //1 - group_num이 1인 극장의 개수
									 //2-  group_num이 2인 극장의 개수...
	String next_page;
	HttpServletRequest request;
	HttpServletResponse response;
	
	@Override
	public void init() throws ServletException {
		dao=new TheaterDAO();
		theaters_list=dao.getTheatersList();
		theaters_num_list_by_group=dao.getTheatersNumListByGroup();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	public void doHandle(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("TheaterController의 doHandle 안");
		this.request=req;
		this.response=resp;
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action=request.getPathInfo().substring(1);
		System.out.println(action);
		
		switch(action){
		case "getTheatersList.do":
			getTheatersList();
			break;
		case "getTheatersListByGroup.do":	/*ajax*/
			getTheatersListByGroup();
			break;
		}
	}/*doHandle 끝*/
	
	public void getTheatersListByGroup(){  /*ajax*/
		if(request.getParameter("groupNum") == null) {
		    System.out.println("TheaterController getDepth1Info에서 오류 발생 : 상품의 id가 없습니다.");
		    return;						
		} 
		else {
		    int groupNum = Integer.parseInt(request.getParameter("groupNum"));
		    System.out.println("TheaterController로 전달된 group_num은 :"+groupNum);
		    List<TheaterDTO> selected_list=dao.getTheatersListByGroup(groupNum);
		    JSONArray ja=new JSONArray();
		    for(int i=0;i<selected_list.size();i++){
		    	TheaterDTO dto=selected_list.get(i);
				JSONObject tmp=new JSONObject();
				tmp.put("name", dto.getName());
				tmp.put("address",dto.getAddress());
				tmp.put("x",dto.getX());
				tmp.put("y",dto.getY());
				ja.add(tmp);
			}
		   
			try {
				response.getWriter().print(ja);
			} catch (IOException e) {
				System.out.println("TheaterController getDepth1Info() 예외 발생2");
				e.printStackTrace();
			}
		}
	} /*getDepth1Info() 끝*/
	
	public void getTheatersList(){
		/*System.out.println("getTheatersList 안");*/
		request.setAttribute("list", theaters_list);
		request.setAttribute("group_size", dao.group_size);
		request.setAttribute("theaters_num_list_by_group", dao.theaters_num_list_by_group);
		next_page="/views/theater/theaters.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(next_page);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			System.out.println("TheaterController 의 getTheatersList()에서 예외 발생1");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("TheaterController 의 getTheatersList()에서 예외 발생2");
			e.printStackTrace();
		}
	}
	
}
