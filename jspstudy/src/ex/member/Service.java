package ex.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	
	public ArrayList<MemberVO> execute(HttpServletRequest request, HttpServletResponse response);

}
