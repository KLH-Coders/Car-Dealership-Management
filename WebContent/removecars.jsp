<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Tailwind CSS -->
    <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">

    <!-- Included from https://bootsnipp.com/snippets/BEdDE -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="index.css" type="text/css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<link rel="stylesheet" href="index.css" type="text/css">
<title>Insert title here</title>
</head>
<body class="bgg">        
            <nav id="nav-bar">

                <ul>
                
                    <li><a class="nav-link" href="Dealer.jsp">Home</a></li>
                    <li><a class="nav-link" href="addcars.jsp">Add Car</a></li>
                    <li><a class="nav-link" href="removecars.jsp">Remove car</a></li>
                    <li><a class="nav-link" href="viewcars.jsp">View cars</a></li>
                    <li><a href="update.jsp" class="nav-link">Update Car</a></li>
                                                <li><a class="nav-link" href="requestd.jsp">View Requests</a></li>
                     <li><a href="logout.jsp" class="nav-link">Log Out</a></li>
                </ul>
               
            </nav>

      <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <header class="card-header">
                        <p>Enter registration number to remove</p>
                        
                    </header>
                    <article class="card-body">
                        <form action="Removecar" method="POST">
                            <div class="form-group">
                                <label>Registration Number</label>
                                <input type="TEXT" class="form-control" placeholder="REGISTRATION NUMBER" name="regdno" required>
                            </div> <!-- form-group end.// -->
                            <button type="submit" class="btn btn-primary btn-block"> Remove </button>
                        </form>
                    </article> <!-- card-body end .// -->
                    </div>
                </div> <!-- card.// -->
            </div> <!-- col.//-->
        </div>

</body>
</html>