<%-- 
    Document   : home
    Created on : 13-Sep-2020, 11:47:14 am
    Author     : shubh
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <style>
            body{
                background-color: #FDC564;
            }
            h1{
                font-size: 2em;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <% 
    String str;
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
        
        <% 
        Connection con;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/residents", "root", "");
        String sql = "select * from users where block='" + block + "' and flatnumber=" + flatnumber;
        try {
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                str = rs.getString("firstname");
                String name = str.substring(0, 1).toUpperCase() + str.substring(1);
                out.print("<h1 class='mt-5'>Welcome "+name+"</h1>");
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
%>

    </body>
</html>
