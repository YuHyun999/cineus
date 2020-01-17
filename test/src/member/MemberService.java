package member;

public class MemberService {

	MemberDAO memberDAO;
	
	public MemberService(){
		memberDAO = new MemberDAO();
	}

	public int servinsertMember(MemberBean memberBean) { //회원가입 insert
		return memberDAO.insertMember(memberBean);		
	}

	public int servuserCheck(String customer_id, String customer_pw) { //로그인
		return memberDAO.userCheck(customer_id, customer_pw);
	}

	
	
	
	
	
	
}// MemberService end
