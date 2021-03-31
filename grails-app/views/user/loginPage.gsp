<%@ page import="linksharing.ResourceRating; linksharing.Resource" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>

<style type="text/css">


.navB{
    background: #f7f7f7;
    border-radius: 10px;
}

.rightColInbox{
    background: #f7f7f7;
    border: 1px solid black;
    border-radius: 5px;
}

.loginCred{
    background: #f7f7f7;
    border: 1px solid black;
    border-radius: 5px;
    height: fit-content;
}
.topPost{
    background: #f7f7f7;
    border: 1px solid black;
    border-radius: 5px;
    height: fit-content;
}

.loginCred2{
    background: #f7f7f7;
    border: 1px solid black;
    border-radius: 5px;
    height: fit-content;

}



</style>

<body>
<div class="topnav navB">
    <nav class="navbar">

        <div class="col-6">
            <a class="navbar-brand" href="#">LINK SHARING</a>
        </div>

        <div class="col-6 navbarRightSearch">

            <div class="row">

                <div class="col-4"></div>
                <div class="col-2"></div>
                <div class="col-4">
                    <form class="form-inline my-2 my-lg-0">

                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="border-radius: 60px !important">

                    </form>
                </div>



            </div>




        </div>


    </nav>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-6 mr-4 ml-4" >
            <div class="col-12 mt-3 rightColInbox">
                <div class="col-12">
                    <nav class="navbar">
                        <strong><h4>Recent Shares</h4></strong>

                    </nav>
                </div>

                <div class="row">

                    <div class="col-12">

                        <table class="table ">
                            <tbody>

                            <g:each in="${Resource.listOrderByDateCreated(max: 3,order: "desc")}" var="res">
                                <tr>
                                    <td>
                                        <div class="col-12">

                                            <div class="row" >

                                                <div class="col-3">

                                                    <svg width="7em" height="7em" viewBox="0 0 16 16" class="bi bi-person-square my-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                        <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>

                                                </div>

                                                <div class="col-9">
                                                    <div class="col-12 mt-1 name">
                                                        <strong>${res.createdBy.firstName} ${res.createdBy.lastName}</strong>
                                                    </div>

                                                    <div class="col-12">
                                                        ${res.lastUpdated}
                                                    </div>

                                                    <div class="col-12 mt-2">
                                                        ${res.getDescription()}

                                                    </div>

                                                    <div class="col-12  mt-1">
                                                        <div class="row">

                                                            <div class="col-3">

                                                                <a href="#"> <i class="fa fa-facebook-official fa-1x" aria-hidden="true"></i></a>
                                                                <a href="#"> <i class="fa fa-twitter fa-1x" aria-hidden="true"></i></a>
                                                                <a href="#"> <i class="fa fa-google-plus fa-1x" aria-hidden="true"></i></a>

                                                            </div>

                                                            <div class="col-9 links">

                                                                <div class="row">
                                                                    <div class="col-2"></div>
                                                                    <div class="col-2"></div>
                                                                    <div class="col-8">
                                                                        <g:if test="${res.class == linksharing.DocumentResource}">
                                                                            <a href="#" data-toggle="modal" data-target="#loginToSee" class="links1">Download</a>
                                                                        </g:if>
                                                                        <g:else>
                                                                            <a href="#" data-toggle="modal" data-target="#loginToSee" class="links1">View Full Site </a>
                                                                        </g:else>

                                                                    </div>
                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </td>
                                </tr>

                            </g:each>

                            </tbody>
                        </table>


                    </div>

                </div>
            </div>
            <div class="col-12 mt-3 mb-2  topPost">

                <nav class="navbar">
                    <div class="col-12">
                        <div class="row mr-0 ml-0">
                            <div class="col-7">
                                <strong><h4>Top Posts</h4></strong>
                            </div>

                            <div class="col-5">
                                <div class="input-group mb-3">

                                    <select class="custom-select" id="inputGroupSelect01">
                                        <option selected>Today</option>
                                        <option value="1">1 Week</option>
                                        <option value="2">1 Month</option>
                                        <option value="3">1 Year</option>
                                    </select>
                                </div>
                            </div>



                        </div>
                    </div>

                </nav>


                <div class="col-12">

                    <div class="row">
                        <div class="col-12 pr-0 pl-0">

                            <table class="table ">
                                <tbody>
                                <g:each in="${ResourceRating.list(max:3,order: "desc",sort: "score" )}" var="res">

                                    <tr>
                                            <td>
                                                <div class="col-12">

                                                    <div class="row" >

                                                        <div class="col-3">

                                                            <svg width="7em" height="7em" viewBox="0 0 16 16" class="bi bi-person-square my-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                                <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                            </svg>

                                                        </div>

                                                        <div class="col-9">
                                                            <div class="col-12 mt-1 name">
                                                                <strong><h4>${res.resource.createdBy.userName}</h4></strong>
                                                            </div>

                                                            <div class="col-12">
                                                                <strong>${res.resource.topic.name}</strong>
                                                            </div>
                                                            <div class="col-12 mt-2">
                                                                ${res.resource.getDescription()}

                                                            </div>

                                                            <div class="col-12  mt-1">
                                                                <div class="row">

                                                                    <div class="col-3">

                                                                        <a href="#"> <i class="fa fa-facebook-official fa-1x" aria-hidden="true"></i></a>
                                                                        <a href="#"> <i class="fa fa-twitter fa-1x" aria-hidden="true"></i></a>
                                                                        <a href="#"> <i class="fa fa-google-plus fa-1x" aria-hidden="true"></i></a>

                                                                    </div>

                                                                    <div class="col-9 links">

                                                                        <div class="row">
                                                                            <div class="col-2"></div>
                                                                            <div class="col-2"></div>
                                                                            <div class="col-8">
                                                                                <a href="#" data-toggle="modal" data-target="#loginToSee" class="links1">View Full Site </a>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </td>
                                        </tr>


                                </g:each>






                                </tbody>
                            </table>


                        </div>
                    </div>

                </div>


            </div>
        </div>

        <div class="col-5 ml-5">
            <div class="col-12 mt-3 loginCred">

                <g:form controller="login" action="log" name="login-form">
                    <h2 >Log in</h2>
                    <hr>
                    <div class="form-group">
                        <input type="text" class="form-control" name="userName" placeholder="Username" required="required">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Log in</button>
                    </div>
                    <div class="clearfix">
                        <!-- <label class="float-left form-check-label"><input type="checkbox"> Remember me</label> -->
                        <a href="#" class="float-right" data-toggle="modal" data-target="#forgetPassword">Forgot Password?</a>
                    </div>
                </g:form>
            </div>

            <div class="col-12 mt-3 mb-2 loginCred2">

                <div class="signup-form">
                    <g:form controller="login" action="register" name="register-form">
                        <h2>Sign Up</h2>
                        <!-- <p>Please fill in this form to create an account!</p> -->
                        <hr>
                        <div class="form-group">
                            <input type="text" class="form-control" name="firstName" placeholder="First name" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="lastName" placeholder="Last name" required>
                        </div>

                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" name="userName" placeholder="Username" required>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password"required >
                        </div>



                    %{--                    <div class="form-group">--}%
                    %{--                        <div class="input-group">--}%
                    %{--                            <div class="custom-file">--}%
                    %{--                                <input type="file" class="custom-file-input" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04">--}%
                    %{--                                <label class="custom-file-label" for="inputGroupFile04">Photo</label>--}%
                    %{--                            </div>--}%
                    %{--                        </div>--}%
                    %{--                    </div>--}%


                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>

                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>






%{--<--------------------------------------modal------------------------------------>--}%

<div class="modal fade" id="forgetPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Forgot your password?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <g:form controller="login" action="forgotPassword">
                <div class="modal-body">

                    <div class="form-group">
                        <label >Email address</label>
                        <input type="email" name="email" class="form-control" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" placeholder="Confirm Password">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </g:form>

        </div>
    </div>
</div>

<div class="modal fade" id="loginToSee" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Please Login...</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
</div>


</body>
</html>