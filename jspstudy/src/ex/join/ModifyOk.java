package ex.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyOk
 */
@WebServlet("/ModifyOk")
public class ModifyOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private Statement stmt;
	HttpSession httpsession;
	
	private String name, id, phone1, phone2, phone3, gender, pw;
	
    public ModifyOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" Call DoGET");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(" Call DoPOST");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		
		httpsession = request.getSession();
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		gender = request.getParameter("gender");
		String sql = "update members set name='" + name 
				+ "',phone1 = '" +phone1 
				+ "',phone2 = '" + phone2 
				+ "',phone3 = '" + phone3 
				+ "',gender= '" + gender 
				+ "' where id='" + id + "'";
		System.out.println(sql);
		
		if(pwConfirm()==true) {
			try {
				
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","mysql");
				stmt = con.createStatement();
				int i = stmt.executeUpdate(sql);
				if( i == 1) {
					System.out.println("Update Success");
					httpsession.setAttribute("name", name);
					response.sendRedirect("modifyResult.jsp");
				} else {
					System.out.println("Update Fail");
					response.sendRedirect("modify.jsp");
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
					try {
						if(stmt!= null)	stmt.close();
						if(con!= null) con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			
		} else {
			System.out.println("incorrect password");
			response.sendRedirect("modify.jsp");
		}
		
	}
	
	protected boolean pwConfirm() {
//		boolean rs = false;
		
		String sessionPw = httpsession.getAttribute("pw").toString();
		
		if(sessionPw.equals(pw)) {
			return true;
		} else {
			return false;
		}

		
	}
	
}
