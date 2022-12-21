

import java.io.IOException;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addcars
 */
@WebServlet("/Addcars")
public class Addcars extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcars() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String regdno = request.getParameter("regdno");
		String car_brand = request.getParameter("car_brand");
		String car_name = request.getParameter("car_name");
		String year = request.getParameter("year");
		String price = (request.getParameter("price"));
		String sale= "for sale";
		String img = request.getParameter("img");
		String mileage = (request.getParameter("mileage"));
		String condition = request.getParameter("condition");
		String color = request.getParameter("color");
		String transmission = request.getParameter("transmission");
		String type = request.getParameter("type");
		String seats = (request.getParameter("seats"));
		String fuel = request.getParameter("fuel");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/dealswheels","root","1289");  
			String sql = "INSERT INTO CARS VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, regdno);
			ps.setString(2, car_brand);
			ps.setString(3, car_name);
			ps.setString(4, year);
			ps.setString(8, price);
			ps.setString(13, sale);
			ps.setString(14, img);
			ps.setString(6, mileage);
			ps.setString(7, condition);
			ps.setString(12, color);
			ps.setString(10, transmission);
			ps.setString(5, type);
			ps.setString(9, seats);
			ps.setString(11, fuel);
			
			int i=ps.executeUpdate();
			if(i>0) {
				response.sendRedirect("caraddsuc.html");
			}
			else {
				response.sendRedirect("caraddfail.html");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("except.html");
			e.printStackTrace();
		}
	}

}
