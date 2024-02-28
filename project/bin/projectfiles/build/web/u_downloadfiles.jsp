<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Secure Cloud Storage based on RLWE Problem</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="css/style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
            integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
            crossorigin="anonymous"
            />
    </head>

    <body>
        <div class="container-fluid">
            <h3 class="text-center">Secure Cloud Storage based on RLWE Problem</h3>
        </div>
        <!-- Nav Bar Start-->
        <nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
            <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="userhome.jsp">
                            <i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="u_viewfiles.jsp">
                            <i class="fas fa-file"></i> View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder active" href="u_downloadfiles.jsp">
                            <i class="fas fa-file-download"></i> Download Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="index.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Nav bar End -->
        <br>



        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="databaseconnection.databasecon"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <br><br>
    <center>
        <%
    
              String user = session.getAttribute("username").toString();
             //String dancer = session.getAttribute("name").toString();					
             Connection con = databasecon.getconnection();
             PreparedStatement pst=con.prepareStatement("select * from userrequests where requestby='"+user+"'");    
        
             ResultSet rs=pst.executeQuery();
        %> 

        <h3 style="text-align: center;color:white"><u>Owner Uploaded Files</u></h3>

        <!-- Table Start -->
        <div class="container">
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                    <th>Id</th>
                    <th>Owner</th>
                    <th>File Name</th>
                    <th>Status</th>
                    <th>Download</th>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>
                        <%
while(rs.next())  {      
                        %>
                        <tr>
                            <td><%=rs.getString(1)%></td>
                            <td><%=rs.getString(2)%></td>
                            <td><%=rs.getString(3)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><a href="download.jsp?id=<%=rs.getString(1)%>&owner=<%=rs.getString(2)%>&fname=<%=rs.getString(3)%>"><button class="btn-hover color-1" style="text-decoration: none;font-family:Andalus, sans-serif;color:black;font-size: 15px;width:90px;height: 30px;" id="n" onclick="change()">
                                        Download
                                    </button></a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Table End -->



    </body>
</html>
