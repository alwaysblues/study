package ex.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteOk
 */
@WebServlet("/DeleteOk")
public class DeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Connection con;
	Statement stmt;	
	String id, pw;
	HttpSession session;
			
    public DeleteOk() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		session = request.getSession();
		String result;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		String sql = "delete from members where id = '" + id + "' and pw ='" + pw + "'"; 
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","mysql");
			stmt = con.createStatement();
			int i = stmt.executeUpdate(sql);
			
			if( i == 1) {
				System.out.println("delete success");
				response.sendRedirect("login.html");
				session.setAttribute("result", null);
				
			} else {
				
//				System.out.println("delete fail");
				session.setAttribute("result", "false");
				response.sendRedirect("deleteId.jsp");
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				
				if(stmt != null) stmt.close();
				if(stmt != null) con.close();
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
	}
}
