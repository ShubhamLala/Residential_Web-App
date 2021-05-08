<%-- 
    Document   : addShop
    Created on : 13-Sep-2020, 8:09:32 pm
    Author     : shubh
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <style>
            h1{
                text-align: center;
            }
        </style>
    </head>
    <body>
            <% 
    String block = request.getParameter("block");
    String flatnumber = request.getParameter("flat");
    %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand active" href="home.jsp?block=<%= block%>&flat=<%= flatnumber%>">Residential</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-right text-md-right" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="complaints.jsp?block=<%= block%>&flat=<%= flatnumber%>">Complaints</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="shop.jsp?block=<%= block%>&flat=<%= flatnumber%>">Super Mart</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="bills.jsp?block=<%= block%>&flat=<%= flatnumber%>">Bills</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">Logout</a>
            </li>
          </ul>
        </div>
        </nav>
        <h1 class="mt-5">Register a Complaint</h1>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
         <form method="POST" action="">
                    <div class="form-row">
                      <div class="form-group col-md-12">
                        <label for="list">Your List</label>
                        <textarea class="form-control" id="list" name="list" rows="10"></textarea>
                      </div>
                    </div>
                    <input type="submit" id="submit" value="Add Shopping List" name="submit" class="btn btn-info">
                  </form>
          </div>
    <div class="col-md-3"></div>
</div>
        <%
        if (request.getParameter("submit") != null) {
        Connection con;
        ResultSet rs;
        PreparedStatement pst;
        
        String list = request.getParameter("list");
        String status = "Not seen";
        int flat = Integer.parseInt(flatnumber);
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/residents","root","");
        pst = con.prepareStatement("INSERT into shop(block,flatnumber,listdetails,status) values(?,?,?,?)");
        pst.setString(1, block);
        pst.setInt(2, flat);
        pst.setString(3, list);
        pst.setString(4, status);
        pst.executeUpdate();
        %>
        <script>
            alert("Your list has been added!");
        </script>
        <%
        String site = new String("http://localhost:8080/Residential/shop.jsp?block="+block+"&flat="+flatnumber);
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    }
%>
    </body>
</html>
