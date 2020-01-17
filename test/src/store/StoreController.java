package store;

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

@WebServlet("/stores/*")
public class StoreController extends HttpServlet {

	StoreService storeService;
	StoreBean storeBean;
	CartBean cartBean;
	
	@Override
	public void init() throws ServletException {
		storeService = new StoreService();
		storeBean = new StoreBean();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nextPage = "";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();
		
		System.out.println("action: " + action);
		System.out.println("contextPath: " + contextPath);
		
		try {
			if (action == null) {
				nextPage = "";
			
			} else if (action.equals("/storeList.do")) {//스토어 메인화면
				List<StoreBean> storeList1 = storeService.listStore1();//씨네티켓
				List<StoreBean> storeList2 = storeService.listStore2();//씨네찬스
				List<StoreBean> storeList3 = storeService.listStore3();//씨네푸드
				
				request.setAttribute("storeList1", storeList1);
				request.setAttribute("storeList2", storeList2);
				request.setAttribute("storeList3", storeList3);
				nextPage = "/store/storeList.jsp";
			
			} else if (action.equals("/viewStore.do")) {//상품 상세보기
				Integer itemCode = Integer.parseInt(request.getParameter("item_code"));
				System.out.println(itemCode);
				
				storeBean = storeService.viewStore(itemCode);
				
				request.setAttribute("storeBean", storeBean);
				nextPage = "/store/storeDetail.jsp";
			} else if (action.equals("/insertCart.do")) {//장바구니 넣기
				//회원아이디로 작업해야함~~!!!
				
				nextPage = "/store/storeCart.jsp";
			}
			
			
			
			//각각 포워딩시키기
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
		} catch (Exception e) {
			System.out.println("doHandle()메서드에서 오류 : " + e);
		}
		
		
		
		
		
		
	}//doHandle()
	
}//StoreController
