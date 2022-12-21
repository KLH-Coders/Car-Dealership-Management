

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fname = request.getParameter("first_name");
		String lname = request.getParameter("last_name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String role = request.getParameter("role");
		String phone = request.getParameter("phone");
		
		try{  
			PasswordEncode pe = new PasswordEncode();
			password = pe.PasswordEncoder(password);
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289");  
			PreparedStatement ps = con.prepareStatement("INSERT INTO USERS(EMAIL,"
					+ "PASSWORD,FIRST_NAME,LAST_NAME,ROLE,PHONE) VALUES(?,?,?,?,?,?)");
			ps.setString(1, email);
			ps.setString(2, password);
			ps.setString(3, fname);
			ps.setString(4, lname);
			ps.setString(5, role);
			ps.setString(6, phone);
			
			int i = ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("regsuccess.html");
			}
			else {
				response.sendRedirect("regfail.html");
			}
			  
		}
		catch (Exception e) {
			response.sendRedirect("regfail.html");
			
			// TODO: handle exception
		}
	}

}
