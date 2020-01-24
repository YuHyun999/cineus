package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/members/*")
public class MemberController extends HttpServlet {
	
	MemberService memberService;
	MemberBean memberBean;
	
	@Override
	public void init() throws ServletException {
		memberService = new MemberService();
		memberBean = new MemberBean();
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();	
		HttpSession session = request.getSession();
		System.out.println("action : " + action);
		System.out.println("contextPath : " + request.getContextPath());
		
		try {
			if(action == null){
				nextPage = "";
			}else if(action.equals("/login.me")){	//로그인 페이지로 이동
				
				nextPage = "/member/login.jsp";
				
			}else if(action.equals("/SignUp.me")){	//회원가입 페이지로 이동
				
				nextPage = "/member/SignUp.jsp";
				
			}else if(action.equals("/MemberSignUp.me")){	//회원가입
				
				//입력한 새 회원 정보 얻기
				String customer_id = request.getParameter("userid");
				String customer_pw = request.getParameter("userpwd");
				String customer_name = request.getParameter("username");
				String customer_email = request.getParameter("useremail");
				String customer_tel = request.getParameter("usertel");
				String customer_postcode = request.getParameter("postcode");
				String customer_address = request.getParameter("address");
				String customer_detailAddress = request.getParameter("detailAddress");
				String customer_extraAddress = request.getParameter("extraAddress");
				String customer_grade = request.getParameter("grade");
				String customer_delete = request.getParameter("delete");
				
				//입력한 새로운 회원정보를 MemberBean에 저장
				memberBean.setCustomer_id(customer_id);
				memberBean.setCustomer_pw(customer_pw);
				memberBean.setCustomer_name(customer_name);
				memberBean.setCustomer_email(customer_email);
				memberBean.setCustomer_tel(customer_tel);
				memberBean.setCustomer_postcode(customer_postcode);
				memberBean.setCustomer_address(customer_address);
				memberBean.setCustomer_detailAddress(customer_detailAddress);
				memberBean.setCustomer_extraAddress(customer_extraAddress);
				memberBean.setCustomer_grade(customer_grade);
				memberBean.setCustomer_delete(customer_delete);
				
				int check = memberService.servinsertMember(memberBean);
				
				if(check == 0){System.out.println("가입 X");}else{System.out.println("가입 O");}				
				
				out.println("<script>" + " alert('회원가입을 축하드립니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
				out.flush();
			

			}else if(action.equals("/memberCheck.me")){	//아이디 중복체크

				String customer_id = (String)request.getParameter("uid");				
				if(customer_id.length() >= 3){
						
													
						int check = memberService.servidCheck(customer_id);
						System.out.println(check);
						
						if(check == 1){ //중복
							out.print("not_usable");
						}else if(check == 0){//중복아님 사용가능
							out.print("usable");									
						}
					}
						return;
						
						
			}else if(action.equals("/Memberlogin.me")){ //로그인
				
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				
				int check = memberService.servuserCheck(id, pwd);
				System.out.println(check);
				
				try {
					if(check == 1){//입력한 아이디, 비밀번호 일치
						session.setAttribute("id", id);

						response.sendRedirect(contextPath + "/main.jsp");
						
					}else{
						out.println("<script>" + " alert('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');" + " location.href='" + contextPath + "/members/login.me';" + "</script>");
						out.flush();
					}				
					
				} catch (Exception e) {
					System.out.println("Memberlogin.me에서 에러 : " + e);
				}
				
				
			}else if(action.equals("/logout.me")){ //로그아웃
				
				try {
					session.invalidate();
					response.sendRedirect(contextPath + "/main.jsp");
					
				} catch (Exception e) {
					System.out.println("logout.me에서 에러 : " + e);
				}
				
			}else if(action.equals("/userFind.me")){ //ID/PW 찾기 페이지로 이동
				
				nextPage = "/member/userFind.jsp";
				
			}else if(action.equals("/authMail.me")){
				
				nextPage = "/member/authMail.jsp";
				
				
			}else if(action.equals("/idFind.me")){ //아이디 찾기 버튼 클릭				
				
				String findName = request.getParameter("findName");
			    String findTel = request.getParameter("findTel");
			    String findEmail = request.getParameter("findEmail");

			    String findId = memberService.servfindId(findName, findTel, findEmail);
			    System.out.println(findId);
			    out.print(findId);
			    return;
				
				
			}else if(action.equals("/pwFind.me")){ //비밀번호 찾기 버튼 클릭
				
				
				String findpwName = request.getParameter("findpwName");
			    String findpwId = request.getParameter("findpwId");
			    String findpwEmail = request.getParameter("findpwEmail");
			    
			    String findPw = memberService.servfindPw(findpwName, findpwId, findpwEmail);
			    
			    if(findPw != null){
			    	memberService.servsendpwEmail(findpwEmail, findPw);
			    }		    
			    
			    System.out.println(findPw);
			    out.print(findPw);
			    return;
			    
				
			}else if(action.equals("/membertelCheck.me")){	//연락처 중복체크

				String customer_tel = (String)request.getParameter("utel");				
						
				if(customer_tel.length() == 11){									
						int check = memberService.servtelCheck(customer_tel);
						System.out.println(check);
						
						if(check == 1){ //중복
							out.print("not_usable");
						}else if(check == 0){//중복아님 사용가능
							out.print("usable");									
						}
				}
						return;
						
			}else if(action.equals("/fa_1.me")) { //마이페이지로 이동
				
				nextPage = "/intro/fa_1.jsp";
			
			}else if(action.equals("/EditMember.me")){ // 회원정보 수정 페이지로 이동
				
				nextPage = "/member/Edit.jsp";
				
			}
			
			
			
			
			
			
			
			
			
			
			if(action != null){				
				RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
				dispatch.forward(request, response);
			}					
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
