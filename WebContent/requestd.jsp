<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@page import="javax.servlet.RequestDispatcher,
javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,
javax.servlet.http.HttpSession,java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="index.css" type="text/css">
    <!-- Tailwind CSS -->
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <title>DealsOnWheels</title>
</head>

<body class="bgg">    
   
            <nav id="nav-bar">

                <ul>
                    <li><a class="nav-link" href="Dealer.jsp">Home</a></li>
                    <li><a class="nav-link" href="addcars.jsp">Add Car</a></li>
                    <li><a class="nav-link" href="viewcars.jsp">View cars</a></li>
                    <li><a class="nav-link" href="removecars.jsp">Remove car</a></li>
                    <li><a href="update.jsp" class="nav-link">Update Car</a></li>
                     <li><a class="nav-link" href="requestd.jsp">View Requests</a></li>
                     <li><a href="logout.jsp" class="nav-link">Log Out</a></li>
                </ul>
               
            </nav>
        </div>
    <table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">Regdno</th>
      <th scope="col">Car Name</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
    </tr>
  </thead>
  <tbody>
  <%try{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/dealswheels","root","1289"); 
		String sql = "SELECT * FROM requests";
		Statement statement = con.createStatement();
		ResultSet rs = statement.executeQuery(sql);
	while(rs.next()){%>
    <tr>
      <td><%= rs.getString("regdno") %></td>
      <td><%= rs.getString("car_name") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getString("email") %></td>
      <td><%= rs.getString("phone") %></td>
    </tr>
  </tbody>
  <%}}catch(Exception e){
  e.printStackTrace();
  }%>
</table>

</body>
</html>