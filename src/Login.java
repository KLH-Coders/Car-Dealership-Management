

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String role = request.getParameter("role");
		PasswordEncode pp = new PasswordEncode();
		System.out.println(email+" "+pass+" "+" "+role);
		pass=pp.PasswordEncoder(pass);
		boolean status = false;
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289");   
			PreparedStatement ps=con.prepareStatement(  
			"select * from users where email=? and password=? and role=?");  
			ps.setString(1,email);  
			ps.setString(2,pass);  
			ps.setString(3, role);	      
			ResultSet rs=ps.executeQuery();  
			status=rs.next(); 
			if(status){
				HttpSession s = request.getSession();
				s.setAttribute("fname",rs.getString("first_name"));
				s.setAttribute("email",rs.getString("email"));
				s.setAttribute("ph",rs.getString("phone"));
				if(role.equals("customer"))
				response.sendRedirect("viewcarsc.jsp");
				if(role.equals("dealer")) 
				response.sendRedirect("Dealer.jsp");
			
			}
			else {
				response.sendRedirect("loginfail.html");
			}
			          
			}catch(Exception e){System.out.println(e);
			response.sendRedirect("except.html");} 
		
		
	}

}
