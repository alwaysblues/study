package ex.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MembersAllService implements Service {

	@Override
	public ArrayList<MemberVO> execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDAO dao = MemberDAO.getInstance();
		return dao.getMembersAll();
		
	}
	
		
	

}
