package ex.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class memberController
 */
@WebServlet("*.do")
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		actionDo(request,response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Call ActionDo()--------------------");
		
		String uri =  request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		
		if(command.equals("/membersAll.do")) {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter write = response.getWriter();
			write.println("<html><head></head><body>");
			
			Service service = new MembersAllService();
			list = service.execute(request, response);
			
			for(MemberVO vo : list ) {
				String id = vo.getId();
				String pw = vo.getPw();
				String name = vo.getName();
				String email = vo.getEmail();
				String address = vo.getAddress();
				
				write.println(id + " , " + pw + " , " + name + " , " + email + " , " + address + "<br>"); 
				
				
			}
			write.println("</body></html>");
			
		}
		
		
	}

}
