package ex.mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoTest
 */
@WebServlet("*.to")
public class DoTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoTest() {
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

	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("-------------------------Activate actionDo()--------------------");
		
		String uri = request.getRequestURI();
		System.out.println("uri : " + uri);
		String conPath = request.getContextPath();
		System.out.println("conPath : " + conPath);
		String command = uri.substring(conPath.length());
		
		if(command.equals("/insert.to")) {
			System.out.println("insert");
		} else if(command.equals("/update.to")) {
			System.out.println("update");
		} else if(command.equals("/delete.to")) {
			System.out.println("delete");
		} else if(command.equals("/select.to")) {
			System.out.println("select");
		} else if(command.equals("/membersAll.to")) {
			System.out.println("================================================================Call membersAll.do");
			
		}
			
		
	}
	
	
}
