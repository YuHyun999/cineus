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
		cartBean = new CartBean();
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
	
			} else if (action.equals("/insertCart.do")) {//장바구니 담기
				String customer_id = (String)session.getAttribute("id");
				int item_code = Integer.parseInt(request.getParameter("item_code"));
				int cart_qty = Integer.parseInt(request.getParameter("cart_qty"));
				String item_name = request.getParameter("item_name");
				String item_image = request.getParameter("item_image");
				int sale_price = Integer.parseInt(request.getParameter("sale_price"));
				
				CartBean cartBean  = new CartBean();
				cartBean.setCustomer_id(customer_id);
				cartBean.setItem_code(item_code);
				cartBean.setCart_qty(cart_qty);
				cartBean.setItem_name(item_name);
				cartBean.setItem_image(item_image);
				cartBean.setSale_price(sale_price);
				
				int cartCheck = storeService.listCart(customer_id, item_code);//장바구니 DB에 동일한 제품이 담겼는지 확인
				
				if (cartCheck > 0) {//동일한 제품이 존재한다면
					out.println("<script>" + " alert('이미 담겨있는 상품입니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
					out.flush();					
					return;
					
				} else {//동일한 제품이 없다면
					
					int cartCount = storeService.countCart(customer_id);//장바구니 담긴 개수
					
					if (cartCount > 4) {//담긴 개수 5개 초과일 때
						out.println("<script>" + " alert('장바구니는 최대 5개 담을 수 있습니다.');" + " location.href='" + contextPath + "/stores/viewCart.do';" + "</script>");
						out.flush();
						return;
					} else {
						storeService.insertCart(cartBean);//장바구니 DB에 저장
						
						List<CartBean> cartList = storeService.viewCart(customer_id);//장바구니 목록 보기
						
						request.setAttribute("cartList", cartList);
						
						nextPage = "/store/storeCart.jsp";
					}				
				}

			} else if (action.equals("/viewCart.do")) {//장바구니 목록 보기
				String customer_id = (String)session.getAttribute("id");
				
				if (customer_id == null) {//로그아웃 상태인 경우
					out.println("<script>" + " alert('로그인 후 이용가능한 서비스입니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
					out.flush();
					return;
					
				} else {//로그인 상태인 경우
					List<CartBean> cartList = storeService.viewCart(customer_id);//장바구니 목록 보기
					
					request.setAttribute("cartList", cartList);
					
					nextPage = "/store/storeCart.jsp";
				}
				
			} else if (action.equals("/openPay.do")) {//결제창 열기
				out.print("<script>" + " window.open('" + contextPath +"/store/storePayment.jsp', '결제하기', 'width=600, height=685, top=175, left=680');" + "</script>");
				out.flush();
				return;
			}
			
			//각각 포워딩시키기
			RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			System.out.println("doHandle()메서드에서 오류 : " + e);
		}
		
		
		
		
		
		
	}//doHandle()
	
}//StoreController
