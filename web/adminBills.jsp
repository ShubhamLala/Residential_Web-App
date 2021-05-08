<%-- 
    Document   : complaints
    Created on : 13-Sep-2020, 6:37:32 pm
    Author     : shubh
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaints</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <style>
            h1{
                text-align: center;
            }
            #addButton{
                margin-left: 45%;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand active" href="adminHome.jsp">Residential</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-right text-md-right" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="adminComplaints.jsp">Complaints</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminShop.jsp">Super Mart</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminBills.jsp">Bills</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminlogin.jsp">Logout</a>
            </li>
          </ul>
        </div>
        </nav>
        <h1 class="mt-5">All Bills</h1>
        <a class="btn btn-danger mt-2 mb-5" id="addButton" href="addBill.jsp">Send A Bill</a>
        <table class="table">
            <thead>
            <th>Bill Id</th>
            <th>Bill Details</th>
            <th>Block</th>
            <th>Flat Number</th>
            <th>Status</th>
            </thead>
            <tbody>
        <% 
        Connection con;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/residents", "root", "");
        String sql = "select * from bills";
        try {
            PreparedStatement statement;
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                String billId = rs.getString("billid");
                String billdetails = rs.getString("billdetails");
                String status = rs.getString("status");
                String block = rs.getString("block");
                String flatnumber = rs.getString("flatnumber");
         %>
         <tr>
             <td><%= billId%></td>
             <td><%= billdetails%></td>
             <td><%= block%></td>
             <td><%= flatnumber%></td>
             <td><%= status%></td>
         </tr>
         <%
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
%>
    </tbody>
    </table>
    </body>
</html>
