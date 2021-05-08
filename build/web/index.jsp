<%-- 
    Document   : index
    Created on : 12-Sep-2020, 7:33:52 pm
    Author     : shubhamlala
--%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%
    if (request.getParameter("submit") != null) {
        String block = request.getParameter("block");
        String flatnumber = request.getParameter("flatnumber");
        String password = request.getParameter("password");

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
                String pass = rs.getString("password");
                if (pass.equals(password)) {
                    String site = new String("http://localhost:8080/Residential/home.jsp?block="+block+"&flat="+flatnumber);
                    response.setStatus(response.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
%>
<script>
    alert("Incorrect");
</script>
<%
                }
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
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
                        <a class="nav-link" href="signup.jsp">Sign Up</a>
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
                <form method="POST" action="#">
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="block">Block</label>
                            <input type="text" class="form-control" name="block" id="block">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="flatNumber">Flat Number</label>
                            <input type="text" class="form-control" name="flatnumber" id="flatNumber">
                        </div>
                        <div class="form-group col-md-12">
                            <label for="inputPassword4">Password</label>
                            <input type="password" class="form-control" id="inputPassword4" name="password">
                        </div>
                    </div>
                    <input type="submit" id="submit" value="Sign In" name="submit" class="btn btn-info">
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </body>
</html>
