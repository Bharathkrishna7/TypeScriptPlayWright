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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous"/>
    </head>
    <%
        if (request.getParameter("msg") != null) {%>
    <script>alert('User Login Successful...');</script>
    <%}%>
    <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>

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
                        <a class="nav-link font-weight-bolder active" href="userhome.jsp">
                            <i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="u_viewfiles.jsp">
                            <i class="fas fa-file"></i> View Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="u_downloadfiles.jsp">
                            <i class="fas fa-file-download"></i> Download Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="index.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br/>
        <div class="container">
            <h1 class="text-center" style="margin-top: 35vh">Welcome User</h1>
        </div>
    </body>
</html>
