<%-- 
    Document   : signup
    Created on : 13-Sep-2020, 10:58:38 am
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
if(request.getParameter("submit") != null){
    String block = request.getParameter("block");
    String flatnumber = request.getParameter("flatnumber");
    String bill = request.getParameter("bill");
    String status = "Not Paid";
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    int flat = Integer.parseInt(flatnumber);
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/residents","root","");
    pst = con.prepareStatement("INSERT into bills(block,flatnumber,billdetails,status) values(?,?,?,?)");
    pst.setString(1, block);
    pst.setInt(2, flat);
    pst.setString(3, bill);
    pst.setString(4, status);
    pst.executeUpdate();
    
    %>
    
    <script>
        alert("Bill Sent Successfully!");
    </script>
    
    
    
    <%
        String site = new String("http://localhost:8080/Residential/adminBills.jsp");
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    
}    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Bill</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
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
        <br/>
<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6">
                <form method="POST" action="">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                        <label for="block">Block</label>
                        <input type="text" class="form-control" name="block" id="block"  placeholder="Block">
                        </div>
                      <div class="form-group col-md-6">
                        <label for="flatNumber">Flat Number</label>
                        <input type="text" class="form-control" name="flatnumber" id="flatNumber" placeholder="Flat Number">
                      </div>
                     <div class="form-group col-md-12">
                        <label for="bill">Bill Details</label>
                        <textarea type="text" class="form-control" name="bill" id="bill" placeholder="Phone Number" rows="10"></textarea>
                     </div>
                    </div>
                    <input type="submit" id="submit" value="Send Bill" name="submit" class="btn btn-info">
                  </form>
             </div>
    <div class="col-md-3"></div>
</div>
    </body>
</html>
