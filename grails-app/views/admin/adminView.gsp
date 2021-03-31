<%@ page import="linksharing.User; linksharing.Visibility; linksharing.Seriousness;  linksharing.DocumentResource; linksharing.LinkResource; linksharing.Resource; linksharing.Topic ; linksharing.Subscription" %>



<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

  <script src="extensions/multiple-sort/bootstrap-table-multiple-sort.js"></script>
  <script src="https://www.w3schools.com/lib/w3.js"></script>

</head>

<style type="text/css">


.topnav {
  background-color: #f9f9f9;
  border-radius: 20px !important;
}


.navbarRightSearch{
  text-align: center;
}

.navBtn{
  right: -10px;
}


.dropdown-menu{
  text-align: center !important;
}

.heading{

  margin-top: 40px;

  background-color: #f7f7f7;
  border-left:3px solid black;
  border-top:3px solid black;
  border-right:3px solid black;
}

</style>

<body>


<div class="topnav">
  <nav class="navbar">

    <div class="col-6">
      <g:link url="[action: 'index', controller: 'dashboard']">Link Sharing</g:link>
    </div>

    <div class="col-6 navbarRightSearch">

      <div class="row">
        <div class="col-4">
          <g:form class="form-inline my-2 my-lg-0" controller="search" action="search">

            <input class="form-control mr-sm-2" id="sea" type="search" placeholder="Search" aria-label="Search" name="search" style="border-radius: 60px !important">

            <button id="btt" type="submit" style="display:none;">Submit</button>
          </g:form>

        </div>

        <div class="col-4 navBtn">
          <button class="btn btn-outline-success my-2 my-sm-0 btnn"  type="submit" data-toggle="modal" data-target="#createTopics"><i class="fa fa-comment" aria-hidden="true"></i></button>
          <button class="btn btn-outline-success my-2 my-sm-0 btnn"  type="submit" data-toggle="modal" data-target="#sendInvitation"><i class="fa fa-envelope" aria-hidden="true"></i></button>



          <button class="btn btn-outline-success my-2 my-sm-0 btnn"  type="submit" data-toggle="modal" data-target="#shareLink">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-link-45deg" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path d="M4.715 6.542L3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1.001 1.001 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4.018 4.018 0 0 1-.128-1.287z"/>
              <path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 0 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 0 0-4.243-4.243L6.586 4.672z"/>
            </svg>
          </button>

          <button class="btn btn-outline-success my-2 my-sm-0 btnn"  type="submit" data-toggle="modal" data-target="#shareDocument">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-earmark-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path d="M9 1H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h5v-1H4a1 1 0 0 1-1-1V3a1 1 0 0 1 1-1h5v2.5A1.5 1.5 0 0 0 10.5 6H13v2h1V6L9 1z"/>
              <path fill-rule="evenodd" d="M13.5 10a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1H13v-1.5a.5.5 0 0 1 .5-.5z"/>
              <path fill-rule="evenodd" d="M13 12.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0v-2z"/>
            </svg>
          </button>
        </div>

        <div class="col-4">
          <div class="dropdown drop">
            <button class="btn btn-secondary dropdown-toggle btnn" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ${u.firstName} ${u.lastName}
            </button>

            <div class="dropdown-menu" aria-labelledby="dropdownMenu2">

              <g:if test="${u.admin}">
                <div class="col-12">
                  <g:link controller="user" action="edit">Profile</g:link>
                </div>

                <div class="col-12">
                  <g:link controller="admin" action="adminView">Users</g:link>
                </div>
                <div class="col-12">
                  <a href="#">Topics</a>
                </div>
                <div class="col-12">
                  <a href="#">Posts</a>
                </div>

                <div class="col-12">
                  <g:link controller="login" action="logout" href="#">Logout</g:link>
                </div>
              </g:if>
              <g:else>
                <div class="col-12">
                  <g:link controller="user" action="edit">Profile</g:link>
                </div>
                <div class="col-12">
                  <g:link controller="login" action="logout" href="#">Logout</g:link>
                </div>
              </g:else>


            </div>

          </div>
        </div>

      </div>




    </div>


  </nav>
</div>

<div class="container-fluid ">
  <nav class=" navbar heading rounded-top"><span><STRONG>User List</STRONG></span></nav>
  <div style="border: 3px solid black">
    <table class="table table-striped mb-0" id="myTable">
      <thead>
      <tr>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(1)')" style="cursor:pointer">Id</th>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(2)')" style="cursor:pointer">Username</th>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(3)')" style="cursor:pointer">Email</th>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(4)')" style="cursor:pointer">First Name</th>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(5)')" style="cursor:pointer">Last Name</th>
        <th scope="col" onclick="w3.sortHTML('#myTable','.item', 'td:nth-child(6)')" style="cursor:pointer">Active</th>
        <th scope="col">Manage</th>
      </tr>
      </thead>
      <tbody>
      <g:each in="${User.list()}" var="u">
        <tr class="item">
          <td>${u.id}</td>
          <td>${u.userName}</td>
          <td>${u.email}</td>
          <td>${u.firstName}</td>
          <td>${u.lastName}</td>
          <g:if test="${u.active}">
            <td>Yes</td>
            <td><g:if test="${!u.admin}"><g:link controller="admin" action="deactivate" params="[id:u.id]">Deactivate</g:link></g:if></td>
          </g:if>
          <g:else>
            <td>No</td>
            <td><g:link controller="admin" action="activate" params="[id:u.id]">Activate</g:link></td>
          </g:else>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
</div>













<!------------------------------------------------ MODAL ------------------------------------->



<div class="modal fade" id="createTopics" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

  <div class="modal-dialog modal-dialog-centered" role="document">

    <div class="modal-content">

      <g:form name="create-topic" url="[controller:'topic',action:'createTopic']">

        <div class="modal-header">

          <h5 class="modal-title" id="exampleModalLongTitle1">Create Topic</h5>

          <button type="button" class="close" data-dismiss="modal" aria-label="Close">

            <span aria-hidden="true">&times;</span>

          </button>
        </div>

        <div class="modal-body">

          <div class="col-12  ">


            <div class="col-12 ">

              <div class="col-12 mb-1">

                <div class="row">

                  <div class="col-4" >
                    Name* :
                  </div>

                  <div class="col-8">
                    <input class="form-control" name="name" id="name"  type="text" placeholder="Name">
                  </div>
                </div>

              </div>


              <div class="col-12">
                <div class="row">

                  <div class="col-4" >
                    Visibility :
                  </div>
                  <div class="col-8">
                    <select class="form-control" name="visi">
                      <option>Public</option>
                      <option>Private</option>
                    </select>
                  </div>
                </div>
              </div>


            </div>

          </div>



        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" value="save" class="btn btn-primary">Save changes</button>
        </div>

      </g:form>


    </div>
  </div>
</div>




<div class="modal fade" id="sendInvitation" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle2">Send Invitation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-12">

          <div class="col-12 mb-1">

            <div class="row">
              <div class="col-4">Email :</div>
              <div class="col-8">
                <input class="form-control"  type="email" placeholder="Email">
              </div>


            </div>
          </div>

          <div class="col-12 ">
            <div class="row">
              <div class="col-4">Topic :</div>
              <div class="col-8">
                <select class="form-control">
                  <g:each in="${Topic.findAllByCreatedBy(u)}" var="t">
                    <option value="${t.name}">${t.name}</option>
                  </g:each>
                </select>
              </div>
            </div>
          </div>
        </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="sendInvitations" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Invite</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-12">

          <div class="col-12 mb-1">

            <div class="row">
              <div class="col-4">Email :</div>
              <div class="col-8">
                <input class="form-control"  type="email" placeholder="Email">
              </div>


            </div>
          </div>

          <div class="col-12 mt-2">
            <div class="row">
              <div class="col-4">Topic :</div>
              <div class="col-8" id="sendInvitationModalName" style="text-align: center;">

              </div>
            </div>
          </div>
        </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="shareLink" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle3">Share Link</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-12">

          <div class="col-12 ">

            <div class="col-12 ">

              <div class="row">
                <div class="col-4">LINK :</div>
                <div class="col-8">
                  <input class="form-control"  type="text" placeholder="Link">
                </div>
              </div>

            </div>

            <div class="col-12 mt-3">
              <div class="row">
                <div class="col-4">Description :</div>
                <div class=" col-8 form-group">
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" style="resize: none;"></textarea>
                </div>
              </div>
            </div>

            <div class="col-12">
              <div class="row">
                <div class="col-4">Topic :</div>
                <div class="col-8">
                  <select class="form-control">
                    <g:each in="${Topic.list()}" var="t">
                      <option value="${t.name}">${t.name}</option>
                    </g:each>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send</button>
      </div>
    </div>
  </div>
</div>





<div class="modal fade" id="shareDocument" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle4">Share Document</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <div class="col-12 ">


          <div class="col-12 ">

            <div class="col-12 mb-3">

              <div class="row">
                <div class="col-4">Document :</div>
                <div class="col-8">
                  <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                  </div>
                </div>
              </div>

            </div>

            <div class="col-12 ">
              <div class="row">
                <div class="col-4">Description :</div>
                <div class=" col-8 form-group">
                  <textarea class="form-control" id="exampleFormControlTextarea2" rows="5" style="resize: none;"></textarea>
                </div>
              </div>
            </div>

            <div class="col-12">
              <div class="row">
                <div class="col-4" >Topic :</div>
                <div class="col-8">
                  <select class="form-control">
                    <g:each in="${Topic.list()}" var="t">
                      <option value="${t.name}">${t.name}</option>
                    </g:each>
                  </select>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send</button>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript">

  document.getElementById("sea").addEventListener("keyup", function(event) {
    if (event.keyCode === 13) {

      event.preventDefault();

      document.getElementById("btt").click();
    }
  });

  $('#sendInvitations').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget)

    var recipient = button.data('whatever')

    var modal = $(this)
    modal.find('#sendInvitationModalName').text(recipient)
    // modal.find('.modal-body input').val(recipient)
  })

</script>



</body>
</html>