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

<meta charset="UTF-8">
<title>Add Cars</title>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

    <!-- Included from https://bootsnipp.com/snippets/BEdDE -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
</head><link rel="stylesheet" href="index.css" type="text/css">
<title>Insert title here</title>
</head>
<body class="bgg">        
            <nav id="nav-bar">

                <ul>
                
                    <li><a class="nav-link" href="Dealer.jsp">Home</a></li>
                    <li><a class="nav-link" href="addcars.jsp">Add Car</a></li>
                    <li><a class="nav-link" href="viewcars.jsp">View cars</a></li>
                    <li><a class="nav-link" href="removecars.jsp">Remove car</a></li>
                    <li><a class="nav-link" href="requestd.jsp">View Requests</a></li>
                    <li><a href="update.jsp" class="nav-link">Update Car</a></li>
                     <li><a href="logout.jsp" class="nav-link">Log Out</a></li>
                </ul>
               
            </nav>

 <<section class="vh-100 gradient-custom">
      <div class="container py-5 h-100">
        <div class="row justify-content-center align-items-center h-100">
          <div class="col-12 col-lg-9 col-xl-7">
            <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
              <div class="card-body p-4 p-md-5">
                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">ADD CAR</h3>
                <form action="Addcars" method="POST">
    
                  <div class="row">
                    <div class="col-md-6 mb-4">
    
                      <div class="form-outline">
                        <input type="text"  class="form-control form-control-lg" name="regdno" required/>
                        <label class="form-label" >Registration Number</label>
                      </div>
    
                    </div>
                    <div class="col-md-6 mb-4">
    
                      <div class="form-outline">
                        <input type="text"  class="form-control form-control-lg" name="car_brand" required/>
                        <label class="form-label" >Car Brand</label>
                      </div>
    
                    </div>
                  </div>
    
                  <div class="row">
                  <div class="col-md-6 mb-4">
    
                      <div class="form-outline">
                        <input type="text"  class="form-control form-control-lg" name="car_name" required/>
                        <label class="form-label" >Car Name</label>
                      </div>
    
                    </div>
                    <div class="col-md-6 mb-4 d-flex align-items-center">
    
                      <div class="form-outline">
                        <input type="text" class="form-control form-control-lg"  name="year" required />
                        <label class="form-label">Year Of Manufacturing</label>
                      </div>
    
                    </div>
                    <div class="col-md-6 mb-4">
    
                      <h6 class="mb-2 pb-1">Fuel: </h6>
    
                     
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="fuel" 
                            value="Petrol" />
                          <label class="form-check-label" >Petrol</label>
                        </div>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="fuel" 
                          value="diesel" />
                        <label class="form-check-label" >Diesel</label>
                      </div>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="fuel" 
                          value="cng" />
                        <label class="form-check-label" >CNG</label>
                      </div>
    
                    </div>
                    
                  </div>
    
                  <div class="row">
                    <div class="col-md-6 mb-4">
    
                      <h6 class="mb-2 pb-1">Type: </h6>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="SUV"  />
                        <label class="form-check-label" >SUV</label>
                      </div>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="Hatchback" />
                        <label class="form-check-label" >Hatchback</label>
                      </div>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="MPV" />
                        <label class="form-check-label" >MPV</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="SPORTS" />
                        <label class="form-check-label" >SPORTS</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="C-SUV"  />
                        <label class="form-check-label" >C-SUV</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="type" 
                          value="TRUCK"  />
                        <label class="form-check-label" >TRUCK</label>
                      </div>
    
                    </div>
                    <div class="col-md-6 mb-4 pb-2">
    
                      <h6 class="mb-2 pb-1">TRANSMISSION : </h6>
    
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="transmission" 
                          value="MANUAL"  />
                        <label class="form-check-label" >MANUAL</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="transmission" 
                          value="AUTOMATIC"  />
                        <label class="form-check-label" >AUTOMATIC</label>
                      </div>
    
                    </div>
                    
    
                  <div class="row">
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline">
                        <input type="number"  class="form-control form-control-lg" name="mileage" />
                        <label class="form-label" >MILEAGE</label>
                      </div>
                    </div>
                    <div class="col-md-6 mb-4 pb-2">
                      <div class="form-outline">
                        <input type="text"  class="form-control form-control-lg" name="color" required />
                        <label class="form-label" >COLOR</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
  
                    <select class="select form-control" name="condition">
                      <option value="" disabled>Choose option</option>
                      <option value="Good">Good</option>
                      <option value="Fair">Fair</option>
                      <option value="Excellent">Excellent</option>
                    </select>
                    <label class="form-label select-label">Condition</label>
                    
                  </div>
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="number"  class="form-control form-control-lg" name="seats" required />
                      <label class="form-label" >SEATS</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="text"  class="form-control form-control-lg" name="img" required />
                      <label class="form-label" >Link of image</label>
                    </div>
                  </div>
                  </div>
                  <div class="col-md-6 mb-4 pb-2">
                    <div class="form-outline">
                      <input type="number"  class="form-control form-control-lg" name="price" required />
                      <label class="form-label" >Price</label>
                    </div>
                  </div>
                  <div class="mt-4 pt-2">
                    <input class="btn btn-primary btn-lg" type="submit" value="Submit" />
                  </div>
    
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

      
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
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