

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class reqin
 */
@WebServlet("/reqin")
public class reqin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reqin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		HttpSession s = request.getSession();
		String i = (String)s.getAttribute("j");
		String reg = (String)s.getAttribute("regdno"+i);
		String name = (String)s.getAttribute("fname");
		String email = (String)s.getAttribute("email");
		String ph = (String)s.getAttribute("ph");
		System.out.println(reg+" "+name+" "+email+" "+ph);
		try{  
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289");  
			PreparedStatement ps = con.prepareStatement("INSERT INTO requests(EMAIL,NAME,PHONE,REGDNO,CAR_NAME) VALUES(?,?,?,?,?)");
			String sql = "SELECT * FROM CARS where regdno='"+reg+"'";
			Statement statement = con.createStatement();
			ResultSet result = statement.executeQuery(sql);
			result.next();
			String car = result.getString("car_name");
			ps.setString(1, email);
			ps.setString(2, name);
			ps.setString(3, ph);
			ps.setString(4, reg);
			ps.setString(5, car);
			
			int g = ps.executeUpdate();
			if(g>0) {
				response.sendRedirect("reqs.html");
			}
			else {
				response.sendRedirect("reqf.html");
			}
		}
		catch (Exception e) {
			response.sendRedirect("except.html");
			
			// TODO: handle exception
		}
	}

}
