<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <body style="background-color:powderblue;">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap');

*{
    box-sizing: border-box;
    padding: 0;
    margin: 0;
    font-family: 'Open Sans', sans-serif;
}
body{
    line-height: 1.5;
}
.card-wrapper{
    max-width: 1180px;
    margin: 0 auto;
}
img{
    width: 100%;
    display: block;
}
.img-display{
    overflow: hidden;
}
.img-showcase{
    display: flex;
    width: 100%;
    transition: all 0.5s ease;
}
.img-showcase img{
    min-width: 100%;
}
.img-select{
    display: flex;
}
.img-item{
    margin: 0.3rem;
}
.img-item:nth-child(1),
.img-item:nth-child(2),
.img-item:nth-child(3){
    margin-right: 0;
}
.img-item:hover{
    opacity: 0.8;
}
.product-content{
    padding: 2rem 1rem;
}
.product-title{
    font-size: 3rem;
    text-transform: capitalize;
    font-weight: 700;
    position: relative;
    color: blueviolet;
    margin: 1rem 0;
}
.product-title::after{
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    height: 4px;
    width: 280px;
    background: blueviolet;
}
.product-link{
    text-decoration: none;
    text-transform: uppercase;
    font-weight: 400;
    font-size: 0.9rem;
    display: inline-block;
    margin-bottom: 0.5rem;
    background: #256eff;
    color: #fff;
    padding: 0 0.3rem;
    transition: all 0.5s ease;
}
.product-link:hover{
    opacity: 0.9;
}
.product-rating{
    color: #ffc107;
}
.product-rating span{
    font-weight: 600;
    color: #252525;
}
.product-price{
    margin: 1rem 0;
    font-size: 1.1rem;
    font-weight: 900;
}
.product-price span{
    font-weight: 900;
}
.last-price span{
    color: #f64749;
    text-decoration: line-through;
}
.new-price span{
    color: #256eff;
}
.product-detail h2{
    text-transform: capitalize;
    color: #12263a;
    padding-bottom: 0.6rem;
}
.product-detail p{
    font-size: 0.9rem;
    padding: 0.3rem;
    opacity: 0.8;
}
.product-detail ul{
    margin: 1rem 0;
    font-size: 0.9rem;
}
.product-detail ul li{
    margin: 0;
    list-style: none;
    background-size: 18px;
    padding-left: 1.7rem;
    margin: 0.4rem 0;
    font-weight: 600;
    opacity: 0.9;
}
.product-detail ul li span{
    font-weight: 400;
}
.purchase-info{
    margin: 1.5rem 0;
}
.purchase-info input,
.purchase-info .btn{
    border: 1.5px solid #ddd;
    border-radius: 25px;
    text-align: center;
    padding: 0.45rem 0.8rem;
    outline: 0;
    margin-right: 0.2rem;
    margin-bottom: 1rem;
}
.purchase-info input{
    width: 90px;
}
.purchase-info .btn{
    cursor: pointer;
    color: #fff;
}
.purchase-info .btn:first-of-type{
    background: #256eff;
}
.purchase-info .btn:last-of-type{
    background: #f64749;
}
.purchase-info .btn:hover{
    opacity: 0.9;
}
.social-links{
    display: flex;
    align-items: center;
}
.social-links a{
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    color: #000;
    border: 1px solid #000;
    margin: 0 0.2rem;
    border-radius: 50%;
    text-decoration: none;
    font-size: 0.8rem;
    transition: all 0.5s ease;
}
.social-links a:hover{
    background: #000;
    border-color: transparent;
    color: #fff;
}
.button1 {width: 200px;}
.button1 {height: 50px;}



@media screen and (min-width: 992px){
    .card{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        grid-gap: 1.5rem;
    }
    .card-wrapper{
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .product-imgs{
        display: flex;
        flex-direction: column;
        justify-content: center;
    }
    .product-content{
        padding-top: 0;
    }
}
    </style>
        <link rel="shortcut icon" type="image/png" href="\dist\images\header\favicon.png" />
    <!-- Google Analytics -->
	<link rel="shortcut icon" type="image/png" href="\dist\images\header\favicon.png" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
  </head>
  <body>
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
    <div class = "card-wrapper">

      
      <div class = "card">
        <!-- card left -->
        <div class = "product-imgs">
          <div class = "img-display">
          </div>
          <div class = "img-select">
            <div class = "img-item">

           
                <img src = <%=result.getString("img") %> width="400" height="500"  alt = "">
               
     
            </div>
          </div>
        </div>
        <!-- card right -->
        <div class = "product-content">
          <h2 class = "product-title" ><%= result.getString("car_name") %></h2>


          <div class = "product-price">
            <p class = "last-price" type = "text" name="Price" >Price: <%=result.getString("price") %><span></span></p>
           
          </div>
          <div class = "product-detail">
        <ul>  
        	<li style="color:black;font-size:20px;">Regd no :<span><%= result.getString("regdno") %></span></li>
              <li style="color:black;font-size:20px;">Car Brand :<span><%= result.getString("car_brand") %></span></li>
              <li style="color:black;font-size:20px;">Type: <span><%= result.getString("type") %></span></li>
              <li style="color:black;font-size:20px;">Fuel: <span><%= result.getString("fuel") %></span></li>
              <li style="color:black;font-size:20px;">Transmission:  <span><%= result.getString("transmission") %></span></li>
              <li style="color:black;font-size:20px;">Color : <span><%= result.getString("color") %></span></li>
              <li style="color:black;font-size:20px;">Mileage : <span><%= result.getString("mileage") %></span></li>
              <li style="color:black;font-size:20px;">Color : <span><%= result.getString("color") %></span></li>
              <li style="color:black;font-size:20px;">Seats : <span><%= result.getString("seats") %></span></li>	
            </ul>
          </div>

        </div>
      </div>
     <form action="reqin" method="post">
     <p hidden <% session.setAttribute("j", i); %>>Request Invoice</p>
     <input type="submit" >
     </form>
    </div>


<%
}
 catch(Exception e){
 	response.sendRedirect("except.html");
 	e.printStackTrace();
 	
 }%>  
%>
  </body>
</html>