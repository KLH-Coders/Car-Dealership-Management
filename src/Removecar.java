

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Removecar
 */
@WebServlet("/Removecar")
public class Removecar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Removecar() {
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
		String regdno = request.getParameter("regdno");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289"); 
			String sql = "Delete from cars where regdno='"+regdno+"'";
			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			int i= ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("cardelsuc.html");
			}
			else {
				response.sendRedirect("cardelfail.html");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			response.sendRedirect("except.html");
		}
	}

}
