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
                        <a class="nav-link font-weight-bolder" href="cloudhome.jsp">
                            <i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="c_viewfiles.jsp">
                            <i class="fas fa-file"></i> View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder active" href="c_viewrequest.jsp">
                            <i class="fas fa-clipboard-check"></i> Verification Request</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="index.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Nav Bar End -->
        <br/>


        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="databaseconnection.databasecon"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="java.sql.Statement"%>
        <%@page import="java.sql.Connection"%>
        <%
    

             //String dancer = session.getAttribute("name").toString();					
             Connection con = databasecon.getconnection();
             PreparedStatement pst=con.prepareStatement("select * from verify where status='Waiting For Cloud'");    
        
             ResultSet rs=pst.executeQuery();
        %>
        <h3 style="text-align: center;color:white"><u>File Verification Requests</u></h3>

        <!-- Table Start -->
        <div class="container">
            <div class="tbl-header">
                <table cellpadding="0" cellspacing="0" border="0">
                    <thead>
                    <th>Id</th>
                    <th>Owner</th>              
                    <th>File Name</th>
                    <th>File Data</th>
                    <th>Send Key</th>
                    </thead>
                </table>
            </div>
            <div class="tbl-content">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tbody>

                        <%
while(rs.next())  {      
                        %> 
                    <form action="sendkey.jsp" method="post">
                        <tr>
                        <input type="hidden" name="id" value="<%=rs.getString(1)%>">
                        <input type="hidden" name="owner" value="<%=rs.getString(2)%>">
                        <input type="hidden" name="fname" value="<%=rs.getString(3)%>">
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><textarea style="font-weight:550" name="fdata"><%=rs.getString(4)%></textarea></td>
                        <td>
                            <button class="btn-hover color-1"  id="n" onclick="change()" style="text-decoration: none;font-family:Andalus, sans-serif;color:black;font-size: 15px;width:80px;height: 30px;">
                                Send
                            </button>
                        </td>
                        </tr>
                    </form>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- Table End -->



        <script>
            var a = document.getElementById("n");
            function change() {
                a.innerHTML = "Sending..";
            }
        </script>
    </body>
</html>
