<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.servlet.RequestDispatcher,
javax.servlet.ServletException,
javax.servlet.annotation.WebServlet,
javax.servlet.http.HttpServlet,
javax.servlet.http.HttpServletRequest,
javax.servlet.http.HttpServletResponse,
javax.servlet.http.HttpSession,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.carz{
font-size:15px;
font:italic;
}
</style>

    <link rel="stylesheet" href="checkout.css" type="text/css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
    <title>DealsonWheels</title>
</head>

<body class="mnb">

<header class="text-gray-700 body-font">
        <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
            <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round"
                    stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full"
                    viewBox="0 0 24 24">
                    <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
                </svg>
                <span class="txt">DealsOnWheels</span>
            </a>
            <nav class="md:ml-auto md:mr-auto flex flex-wrap items-center text-base justify-center">
                <a href="customer.jsp" class="mr-5 hover:text-gray-900">Home</a>
                <a href="viewcars.jsp" class="mr-5 hover:text-gray-900">View Cars</a>
                <a href="logout.jsp" class="mr-5 hover:text-gray-900">Log Out</a>
            </nav>
        </div>
    </header>

    <!--view Car -->
    <div class="container">
          <%try{
    	 Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/dealswheels","root","1289");
		String i = request.getParameter("i");
		String s = (String)session.getAttribute("regdno"+i);
		String sql = "SELECT * FROM CARS where regdno='"+s+"'";
		Statement statement = con.createStatement();
		ResultSet result = statement.executeQuery(sql);
		result.next();%>
        <section class="text-blue-700 body-font overflow-hidden">
            <div class="container px-5 py-24 mx-auto">
                <div class="lg:w-4/5 mx-auto flex flex-wrap">
                    <img  
                        src=<%= result.getString("img") %>>
                    <div class="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0">
                        <h2 class="text-sm title-font text-white-500 tracking-widest">Car Name : <%= result.getString("car_name") %></h2>
                        <h1 class="text-white-900 text-3xl title-font font-medium mb-1">The Catcher in the Rye</h1>
                           
                        </div>
                  
                        <h2 class="headinn">Car Brand :<%= result.getString("car_brand") %></h2>
                                <h3 >Type: <%= result.getString("type") %></h3><br>
                                <h3 >Transmission: <%= result.getString("transmission") %></h3><br>
                                <h3 >Fuel : <%= result.getString("fuel") %></h3><br>
                                <h3 >Price : <%= result.getString("price") %></h3><br>
                                <h3 >Mileage : <%= result.getString("mileage") %></h3><br>
                                <h3 >Condition : <%= result.getString("condition") %></h3><br>
                                <h3 >Color : <%= result.getString("color") %></h3><br>
                                <h3 >Seats : <%= result.getString("seats") %></h3><br>

                                
                        <div class="flex">
                            <span class="title-font font-medium text-2xl text-gray-900"> <%= result.getString("price") %></span>
                            <svg fill="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                class="w-5 h-5" viewBox="0 0 24 24">
                                <path
                                    d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z">
                                </path>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </section>
         <% }catch(Exception e){
                                	response.sendRedirect("except.html");
                                	e.printStackTrace();
                                	
                                }%>
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