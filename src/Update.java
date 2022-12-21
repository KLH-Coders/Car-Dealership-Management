

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
		String price = (request.getParameter("price"));
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289");  
//			String sql = "Update cars set price='"+price+"',mileage='"+mileage+"',condition='"+condition+"' where regdno='"+regdno+"'";
//			System.out.println(sql);
			PreparedStatement ps = con.prepareStatement("Update cars set price=? where regdno=?");			
			ps.setString(1, price);
			ps.setString(2, regdno);
//			ps.setString(3, condition);
//			System.out.println(sql);
			int i=ps.executeUpdate();
//			con.commit();
			if(i>0) {
				response.sendRedirect("upsuc.html");
			}
			else {
				response.sendRedirect("upfail.html");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("except.html");
			e.printStackTrace();
		}
	}

}
