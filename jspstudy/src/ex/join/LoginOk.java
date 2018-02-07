package ex.join;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/LoginOk")
public class LoginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Connection con;
	private Statement stmt;
	private ResultSet resultSet;
	private String driver = "com.mysql.jdbc.Driver";
	private String name, id, pw, phone1, phone2, phone3, gender;
	
	
	
	
	public LoginOk() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--------------------------------------- Call doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--------------------------------------- Call doPost");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		System.out.println(id + " : " + pw);
		String sql = "select * from members where id='" + id + "' and pw ='" + pw+ "'";
		
		System.out.println(sql);
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","mysql");
			stmt = con.createStatement();
			resultSet = stmt.executeQuery(sql);
			
			while(resultSet.next()) {
				name = resultSet.getString("name");
				id = resultSet.getString("id");
				pw = resultSet.getString("pw");
				phone1 = resultSet.getString("phone1");
				phone2 = resultSet.getString("phone2");
				phone3 = resultSet.getString("phone3");
				gender = resultSet.getString("gender");
				
			}
			
			
			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("name", name);
			httpsession.setAttribute("id", id);
			httpsession.setAttribute("pw", pw);
			httpsession.setAttribute("phone1", phone1);
			httpsession.setAttribute("phone2", phone2);
			httpsession.setAttribute("phone3", phone3);
			httpsession.setAttribute("gender", gender);
			
			response.sendRedirect("loginResult.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if(resultSet != null) resultSet.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		
		
	}
	
	
}
