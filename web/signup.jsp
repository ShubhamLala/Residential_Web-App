<%-- 
    Document   : signup
    Created on : 13-Sep-2020, 10:58:38 am
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
if(request.getParameter("submit") != null){
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String block = request.getParameter("block");
    String flatnumber = request.getParameter("flatnumber");
    String phonenumber = request.getParameter("phonenumber");
    String password = request.getParameter("pass");
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/residents","root","");
    pst = con.prepareStatement("INSERT into users(firstname,lastname,block,flatnumber,phonenumber,password) values(?,?,?,?,?,?)");
    pst.setString(1, firstname);
    pst.setString(2, lastname);
    pst.setString(3, block);
    pst.setString(4, flatnumber);
    pst.setString(5, phonenumber);
    pst.setString(6, password);
    pst.executeUpdate();
    
    %>
    
    <script>
        alert("You have successfully signed up!");
    </script>
    
    
    
    <%
        String site = new String("http://localhost:8080/Residential/home.jsp?block="+block+"&flat="+flatnumber);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    
}    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Residential</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-right text-md-right" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Login</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminlogin.jsp">Admin Login</a>
            </li>
          </ul>
        </div>
        </nav>
        <br/>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
                <form method="POST" action="" oninput='confirm.setCustomValidity(pass.value != confirm.value ? "Passwords do not match." : "")'>
                    <div class="form-row">
                     <div class="form-group col-md-6">
                      <label for="fName">First Name</label>
                      <input type="text" class="form-control" id="fname" name="firstname" placeholder="First Name">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="fName">Last Name</label>
                      <input type="text" class="form-control" id="lname" name="lastname" placeholder="Last Name">
                    </div>
                        <div class="form-group col-md-6">
                        <label for="block">Block</label>
                        <input type="text" class="form-control" name="block" id="block"  placeholder="Block">
                        </div>
                      <div class="form-group col-md-6">
                        <label for="flatNumber">Flat Number</label>
                        <input type="text" class="form-control" name="flatnumber" id="flatNumber" placeholder="Flat Number">
                      </div>
                     <div class="form-group col-md-12">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="text" class="form-control" name="phonenumber" id="phoneNumber" placeholder="Phone Number">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="pass" placeholder="Password">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="confirm">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm" name="confirm" placeholder="Confirm Password">
                      </div>
                    </div>
                    <input type="submit" id="submit" value="Sign Up" name="submit" class="btn btn-info">
                  </form>
             </div>
    <div class="col-md-3"></div>
</div>
    </body>
</html>
