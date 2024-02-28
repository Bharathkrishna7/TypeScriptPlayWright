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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
              integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous" />
    </head>
    <%
            if (request.getParameter("msg") != null) {%>
    <script>
        alert('File Uploaded Successfully...');
    </script>
    <%}%>
    <%
            if (request.getParameter("msg1") != null) {%>
    <script>
        alert('Upload Failed...\nChange Upload Format...');
    </script>
    <%}%>
    <body>
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
                        <a class="nav-link font-weight-bolder" href="ownerhome.jsp">
                            <i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder active"  href="o_uploadfiles.jsp">
                            <i class="fas fa-upload"></i> Upload Files</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="o_verifyfiles.jsp">
                            <i class="fas fa-clipboard-check"></i> Verify File</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="o_viewrequest.jsp">
                            <i class="fas fa-share-square"></i> View Requests</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-weight-bolder" href="index.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        <br />
        <div class="container manual">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title" style="margin-left: 30%">Upload Files</h4>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container">
                        <form action="Upload" method="post" enctype="multipart/form-data">
                            <div class="form-group ">
                                <label for="uname">File Name:</label>
                                <input type="text" class="form-control" id="uname" placeholder="Enter Filename"  required>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please fill out this field.</div>
                            </div>

                            <label for="uname">Select File:</label>
                            <div class="custom-file mb-3">
                                <input type="file" class="custom-file-input" id="customFile" name="filename" required>
                                <div class="valid-feedback">Valid.</div>
                                <div class="invalid-feedback">Please Select a File.</div>
                                <label class="custom-file-label" for="customFile">Choose file</label>
                            </div>

                            <br><br>
                            <button class="btn-hover color-10">Upload</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>

            // Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function () {
                var fileName = $(this).val().split("\\").pop();
                $(this).siblings(".custom-file-label").addClass("selected").jsp(fileName);
            });
        </script>
        <script>
            // Disable form submissions if there are invalid fields
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
            //-----------------------------
        </script>
    </body>

</html>