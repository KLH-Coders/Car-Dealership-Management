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
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <link href="viewcar.css" rel="stylesheet">
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

    <!-- Included from https://bootsnipp.com/snippets/BEdDE -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="index.css" type="text/css">
<meta charset="UTF-8">
<title>DealsonWheels</title>
<style>
.card-body{
	height:150px;
	width:400px;
}
</style>
</head>
<body class="bgg">        
            <nav id="nav-bar">

                <ul>

                   <li><a class="nav-link" href="viewcarsc.jsp">View cars</a></li>
                     <li><a href="logout.jsp" class="nav-link">Log Out</a></li>
                </ul>
               
            </nav>

    <!-- Cars -->
    <%try{
    	Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/dealswheels","root","1289"); 
		String sql = "SELECT * FROM CARS where sale='for sale'";
		Statement statement = con.createStatement();
		ResultSet result = statement.executeQuery(sql);%>
		
      
            <div class="container">
                            
            <div class="abc">
                <div class="row">
                
                <% int i=0;
                while(result.next()){ %>
                    <div class="col-md-4">
                    
                        <div class="card mb-4 shadow-sm">
                        <form action="check.jsp" method="POST">
                           <img src=<%= result.getString("img") %> alt="...." width="350" height="200">
                            <div class="card-body">
                                 <h4 class="headinn">Car Brand :<%= result.getString("car_brand") %></h4>
                                <p class="card-text">Car Name : <%= result.getString("car_name") %></p>
                        
                                <p hidden><% session.setAttribute("regdno"+i,result.getString("regdno")); %></p>
                                <input type="hidden" name="i" value=<%=i %><%i++; %>>
								<center><button type="submit" class="btn btn-sm btn-outline-success mx-3">View Car</button></center>
                                  </form> 
                            </div>
                            
                        </div>
                    </div><%}}catch(Exception e){
                    	response.sendRedirect("except.html");
    	}%>

    	</div>
    	</div>
    	</div>
    	        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>
    	</body>
    	</html>