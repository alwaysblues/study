package ex.join;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Connection con;
	private Statement stmt;
	
	private String name, id, pw, gender, phone1, phone2, phone3;
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/jspdb";
	private String uid = "root";
	private String upw = "mysql";
	private ResultSet resultSet;
	
	
    public JoinOk() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("-----------------------------------------Call Get Method");
    	actionDo(request, response);
    
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("-----------------------------------------Call Post Method");
    	actionDo(request, response);
    
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	name = request.getParameter("name");
    	id = request.getParameter("id");
    	pw = request.getParameter("pw");
    	phone1 = request.getParameter("phone1");
    	phone2 = request.getParameter("phone2");
    	phone3 = request.getParameter("phone3");
    	gender = request.getParameter("gender");
    	
    	String sql = "insert into members (name, id ,pw, gender, phone1, phone2, phone3)" + 
    	" values('" + name + "','" + id + "','" + pw + "','" + gender + "','" + phone1 + "','" + phone2 + "','" + phone3 + "')";
    	
    	System.out.println(sql);
    	
    	String driver = "com.mysql.jdbc.Driver";
    	
    	try{
    		
    		// 	server url / database
    		Class.forName(driver);
    		con = DriverManager.getConnection(url,uid,upw);
    		stmt = con.createStatement();
    		int i = stmt.executeUpdate(sql);
    		
    		// 성공했을시 1을 리턴
    		if(i == 1){
    			System.out.println("insert success");
    			response.sendRedirect("joinResult.jsp");
    		} else {
    			System.out.println("insert fail");
    			response.sendRedirect("join.html");
    		}
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println(e.getMessage());
    		
    	} finally {
    		
    		try{
    			if(resultSet != null) resultSet.close();
    			if(stmt != null) stmt.close();
    			if(con != null) con.close();
    		
    		}catch(Exception e){
    			
    		}
    			
    		
    	}
    	
    }
}
