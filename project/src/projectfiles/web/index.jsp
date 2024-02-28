<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Secure Cloud Storage based on RLWE Problem</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    </head>
    <%
            if (request.getParameter("fmsg") != null) {%>
    <script>
        alert('Invalid Username or Password!!!...');
    </script>
    <%}%>
    <%
        if (request.getParameter("msg") != null) {%>
    <script>
        alert('Owner Registered Successfully...');
    </script>
    <% }
    %>
    <%
        if (request.getParameter("msg1") != null) {%>
    <script>
        alert('User Registered Successfully...');
    </script>
    <% }
    %>

    <body>
                <script>
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
        <div class="container-fluid">
            <h3 class="text-center">Secure Cloud Storage based on RLWE Problem</h3>
        </div>

        <!-- Nav Bar Start-->
        <nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder active" href="index.jsp">
                            <i class="fas fa-home"></i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="#" data-toggle="modal" data-target="#myModal" onclick="select_owner()">
                            <i class="fas fa-user-tie"></i> Owner</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="#" data-toggle="modal" data-target="#myModal" onclick="select_user()">
                            <i class="fas fa-user-alt"></i> User</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="#" data-toggle="modal" data-target="#myModal" onclick="select_cloud()">
                            <i class="fas fa-cloud"></i> Cloud</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="#" data-toggle="modal" data-target="#myModal" onclick="select_tpa()">
                            <i class="far fa-user-circle"></i> TPA</a>
                    </li>
                </ul>
                <ul class="navbar-nav mobile" style="margin-left:20vw">
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="#" id="click" data-toggle="modal" data-target="#myModal2">
                            <i class="fas fa-user-plus "></i> Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" id="now" href="#" data-toggle="modal" data-target="#myModal" onclick="select_select()">
                            <i class="fas fa-sign-in-alt"></i> Login</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="background">
            <br>
            <!-- Nav Bar End -->



            <!--Modal Login Form Start-->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content ">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title" style="margin-left: 38%">Login Form</h4>
                            <button title="close" class="sp-close-modal" data-dismiss="modal">
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 22.6 22.6" style="height: 1em; width: 1em;" xml:space="preserve" preserveAspectRatio="none">
                                <rect fill="currentColor" x="8.3" y="-1.7" transform="matrix(0.7071 0.7071 -0.7071 0.7071 11.3137 -4.6863)" width="6" height="26"></rect>
                                <rect fill="currentColor" x="8.3" y="-1.7" transform="matrix(-0.7071 0.7071 -0.7071 -0.7071 27.3137 11.3137)" width="6" height="26"></rect>
                                </svg>
                            </button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container ">
                                <form action="loginact.jsp" class="needs-validation" method="POST" novalidate id="reset">
                                    <div class="form-group">
                                        <label for="sel1">User Type:</label>
                                        <select class="custom-select" id="sel1" name="utype" required>
                                            <option value="" id="select">Select User Type</option>
                                            <option value="Owner" id="Owner">Owner</option>
                                            <option value="User" id="User">User</option>
                                            <option value="Cloud" id="Cloud">Cloud</option>
                                            <option value="TPA" id="TPA">TPA</option>
                                        </select>
                                        <!--                                <div class="valid-feedback">Valid.</div>-->
                                        <div class="invalid-feedback">Please select an user in the list.</div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="uname">Username:</label>
                                        <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
                                        <!--                                <div class="valid-feedback">Valid.</div>-->
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="pwd">Password:</label>
                                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
                                        <!--                                <div class="valid-feedback">Valid.</div>-->
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                    <br>
                                    <button class="btn-hover color-7">Login</button>
                                </form>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <a href="" class="textGradient" style="font-size: 18px;font-weight: 900" data-toggle="modal" data-target="#myModal2" data-dismiss="modal">New User Click Here....</a>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Login Form End -->




            <!--Modal Registration Form Start-->
            <div class="modal fade " id="myModal2">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Registration Form</h4>
                            <button title="close" class="sp-close-modal" data-dismiss="modal">
                                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_1" x="0px" y="0px" viewBox="0 0 22.6 22.6" style="height: 1em; width: 1em;" xml:space="preserve" preserveAspectRatio="none">
                                <rect fill="currentColor" x="8.3" y="-1.7" transform="matrix(0.7071 0.7071 -0.7071 0.7071 11.3137 -4.6863)" width="6" height="26"></rect>
                                <rect fill="currentColor" x="8.3" y="-1.7" transform="matrix(-0.7071 0.7071 -0.7071 -0.7071 27.3137 11.3137)" width="6" height="26"></rect>
                                </svg>
                            </button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="container">
                                <form action="registrationact.jsp" class="needs-validation" method="post" novalidate>
                                    <div class="form-group row">
                                        <div class="form-group col-sm-6">
                                            <label for="sel1">User Type:</label>
                                            <select class="custom-select" id="sel2" name="utype" required>
                                                <option value="">Select User Type</option>
                                                <option value="Owner">Owner</option>
                                                <option value="User">User</option>
                                            </select>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please select an user in the list.</div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="uname">Name:</label>
                                            <input type="text" class="form-control" id="uname1" placeholder="Enter Name" name="name" required>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please fill out this field.</div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="form-group col-sm-6">
                                            <label for="uname">Email:</label>
                                            <input type="email" class="form-control" id="uname2" placeholder="Enter Email Id" name="email" required>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please fill out this field.</div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label for="pwd">Password:</label>
                                            <input type="password" class="form-control" id="pwd1" placeholder="Enter password" name="pswd" required>
                                            <div class="valid-feedback">Valid.</div>
                                            <div class="invalid-feedback">Please fill out this field.</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="uname">Mobile Number:</label>
                                        <input type="tel" class="form-control" id="mob" placeholder="Enter Mobile Number" name="mob" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                    <br>
                                    <button class="btn-hover color-6">Register</button>
                                </form>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal Registration Form End -->


            <!-- <div class="center-div">
                <img src="images/clouds.png" alt="">
            </div> -->

            <script>
                //         Disable form submissions if there are invalid fields
                onload = "document.location.reload(true)";
                (function () {
                    'use strict';
                    window.addEventListener('load', function () {
                        // Get the forms we want to add validation styles to
                        var forms = document.getElementsByClassName('needs-validation');
                        // Loop over them and prevent submission
                        var validation = Array.prototype.filter.call(forms, function (form) {
                            form.addEventListener('submit', function (event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add('was-validated');
                            }, false);
                        });
                    }, false);
                })();
                // -----------------------------
                function select_owner() {
                    document.getElementById("Owner").selected = "true";
                }
                function select_user() {
                    document.getElementById("User").selected = "true";
                }
                function select_cloud() {
                    document.getElementById("Cloud").selected = "true";
                }
                function select_tpa() {
                    document.getElementById("TPA").selected = "true";
                }
                function select_select() {
                    document.getElementById("select").selected = "true";
                }

            </script>
        </div>
    </body>

</html>