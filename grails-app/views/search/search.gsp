<%@ page import="linksharing.ReadingItem; linksharing.Visibility; linksharing.Seriousness;  linksharing.DocumentResource; linksharing.LinkResource; linksharing.Resource; linksharing.Topic ; linksharing.Subscription" %>


<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>abc</title>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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


.leftColName{
    background-color: #f7f7f7 !important;
    border-radius: 10px;
    border: 3px solid black;
    max-height: 150px;
    padding: 0px !important;
}

.leftColName .name{
    font-size: 20px;
}

.leftColName .topic{
    text-align: center !important;
}

.rightColInbox{
    background: #f7f7f7 !important;
    border-radius: 10px;
    border: 3px solid black;
    padding: 0px !important;
    height: fit-content;
}
.rightColInbox .name{
    font-size: 20px;
}

.rightColInbox .links{
    padding: 0px !important;
}
.rightColInbox .links1{
    margin-right: 7px;
}

.leftCol2{
    padding: 0px !important;
    border: 3px solid black;
    border-radius: 10px;
    background: #f7f7f7;
    height: fit-content;
}
.leftCol2 .centerAl{
    text-align: center;
}

.trendingTopics{
    background: #f7f7f7 !important;
    border-radius: 10px;
    border: 3px solid black;
    padding: 0px !important;
    height: fit-content;

}

.trendingTopics .centerAl{
    text-align: center;
}

.trendingTopics .save{
    padding: 0px !important;
}



.subTr td{
    padding: 0px !important;
}

.trendTr td{
    padding: 0px !important;
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



<div class="container-fluid">
    <div class="row">
        <div class="col-5 trendingTopics mt-3 mb-3 ml-3">
            <div class="col-12 ">
                <nav class="navbar navbar-light bg-light navBlock">
                    <h5><strong>Trending Topics</strong></h5>

                </nav>
            </div>

            <div class="col-12">
                <table class="table">
                    <tbody>

                    <g:each in="${Topic.list(max:5)}" var="num">
                        <g:if test="${num.createdBy.id == u.id}">
                            <tr class="trendTr">
                                <td>

                                    <div class="col-12">
                                        <div class="row">

                                            <div class="col-3">
                                                <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-square my-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                    <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                </svg>

                                            </div>

                                            <div class="col-9 mb-2">

                                                <div class="col-12 mb-2">
                                                    <div class="row">

                                                        <div class="col-6">
                                                            <g:link controller="topic" action="topicsShow" params="[id:num.id]">${num.name}</g:link>
                                                        </div>
                                                    </div>


                                                </div>

                                                <div class="row ">

                                                    <div class="col-4">
                                                        @${num.createdBy.userName}

                                                    </div>

                                                    <div class="col-4">
                                                        Subscription
                                                    </div>

                                                    <div class="col-4 centerAl">
                                                        Post
                                                    </div>

                                                </div>


                                                <div class="row">

                                                    <div class="col-4">
                                                        %{--                                                        <a href="#" style="text-decoration: underline">Unsubscribe</a>--}%
                                                    </div>

                                                    <div class="col-4 centerAl">
                                                        ${Subscription.countByTopic(num)}
                                                    </div>

                                                    <div class="col-4 centerAl">
                                                        ${Resource.countByTopic(num)}
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="col-12">

                                                <div class="row">

                                                    <div class="col-1">
                                                    </div>

                                                    <div class="col-4  ">

                                                        <g:form controller="subscription" action="changeSeriousness" params="[id: num.id]">

                                                            <select class="form-control form-control-sm" name="serious" onchange="this.form.submit()">
                                                                <g:if test="${Subscription.findByTopic(num).seriousness== Seriousness.SERIOUS}">
                                                                    <option value="casual">Casual</option>
                                                                    <option value="serious" selected>Serious</option>
                                                                    <option value="very serious">Very serious</option>
                                                                </g:if>

                                                                <g:elseif test="${Subscription.findByTopic(num).seriousness== Seriousness.CASUAL}">
                                                                    <option value="casual" selected>Casual</option>
                                                                    <option value="serious">Serious</option>
                                                                    <option value="very serious">Very serious</option>
                                                                </g:elseif>

                                                                <g:else>
                                                                    <option value="casual">Casual</option>
                                                                    <option value="serious">Serious</option>
                                                                    <option value="very serious" selected>Very serious</option>
                                                                </g:else>

                                                            </select>

                                                        </g:form>

                                                    </div>

                                                    <div class="col-4 ">
                                                        <g:form controller="topic" action="changePrivacy"  params="[id: num.id]">
                                                            <g:if test="${num.visibility== Visibility.PRIVATE}">
                                                                <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                                                                    <option value="private" selected>Private</option>
                                                                    <option value="public">Public</option>

                                                                </select>
                                                            </g:if>
                                                            <g:else>
                                                                <select class="form-control form-control-sm" name="privacy" onchange="this.form.submit()">

                                                                    <option value="private">Private</option>
                                                                    <option value="public" selected>Public</option>

                                                                </select>
                                                            </g:else>

                                                        </g:form>
                                                    </div>

                                                    <div class="col-3 ">

                                                        <div class="row">

                                                            <div class="col-12">

                                                                <div class="row">



                                                                    <div class="col-1">
                                                                        <a href="#" data-toggle="modal" data-target="#sendInvitations" data-val="${num.name}">
                                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-envelope" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                                <path fill-rule="evenodd" d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383l-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z"/>
                                                                            </svg>
                                                                        </a>

                                                                    </div>

                                                                    <div class="col-1">
                                                                        <a href="#">
                                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                                            </svg>
                                                                        </a>

                                                                    </div>

                                                                    <div class="col-1">
                                                                        <g:link controller="topic" action="delete" params="[id:num.id]">
                                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                                                <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                                            </svg>
                                                                        </g:link>



                                                                    </div>

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
                        </g:if>
                        <g:else>
                            <tr class="trendTr">

                                <td>
                                    <div class="col-12">

                                        <div class="row">

                                            <div class="col-3">

                                                <svg width="4em" height="4em" viewBox="0 0 16 16" class="bi bi-person-square my-2" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                    <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                </svg>

                                            </div>

                                            <div class="col-9">

                                                <g:link controller="topic" action="topicsShow" params="[id:num.id]">${num.name}</g:link>

                                                <div class="row ">

                                                    <div class="col-4">
                                                        @${num.createdBy.userName}

                                                    </div>

                                                    <div class="col-4">
                                                        Subscription
                                                    </div>

                                                    <div class="col-4 centerAl">
                                                        Post
                                                    </div>

                                                </div>


                                                <div class="row">

                                                    <g:if test="${num.createdBy.userName == u.userName}">
                                                        <div class="col-4">

                                                        </div>
                                                    </g:if>
                                                    <g:elseif test="${Subscription.findByTopicAndUser(num,u)}">
                                                        <div class="col-4">
                                                            <g:link controller="subscription" action="unsubscribe" params="[id:num.id]" style=" text-decoration: underline;">Unsubscribe</g:link>
                                                        </div>
                                                    </g:elseif>

                                                    <g:else>
                                                        <div class="col-4">
                                                            <g:link controller="subscription" action="subscribe" params="[id:num.id]" style=" text-decoration: underline;">Subscribe</g:link>
                                                        </div>
                                                    </g:else>


                                                    <div class="col-4 centerAl">
                                                        ${Subscription.countByTopic(num)}
                                                    </div>

                                                    <div class="col-4 centerAl">
                                                        ${Resource.countByTopic(num)}
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                </td>

                            </tr>
                        </g:else>
                    </g:each>

                    </tbody>
                </table>

            </div>

        </div>


        <div class="col-6 mt-3 mb-3  ml-5 rightColInbox">
            <div class="col-12 ">
                <nav class="navbar">
                    <h4><strong>Search for ${searchElement}</strong></h4>

                </nav>
            </div>

            <div class="row">
                <div class="col-12">

                    <table class="table mb-0">
                        <tbody>
                        <g:each in="${Topic.findAllByNameIlike("%${searchElement}%")}" var="top">
                            <g:each in="${Resource.findAllByTopic(top)}" var="rs">
                                <g:if test="${rs.class == DocumentResource}">
                                    <tr>
                                        <td>
                                            <div class="col-12 ">

                                                <div class="row" >



                                                    <div class="col-9">
                                                        <div class="col-12 mt-2">
                                                            ${rs.getDescription()}
                                                        </div>

                                                        <div class="col-12  mt-4">
                                                            <div class="row">

                                                                <div class="col-3">

                                                                    <a> <i class="fa fa-facebook-official fa-1x" aria-hidden="true"></i></a>
                                                                    <a> <i class="fa fa-twitter fa-1x" aria-hidden="true"></i></a>
                                                                    <a> <i class="fa fa-google-plus fa-1x" aria-hidden="true"></i></a>

                                                                </div>

                                                                <div class="col-9 links">

                                                                    <g:if test="${!ReadingItem.findByUserAndResource(u,rs).isRead}">
                                                                        <g:link controller="readingItem" action="markRead" params="[id:rs.id]" class="links1">Mark as read </g:link>
                                                                    </g:if>

                                                                    <g:link controller="resource" action="downloadPost" params="[id: rs.id]" class="links1">Download</g:link>



                                                                    <a href="#" class="links1">View post</a>
                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </td>
                                    </tr>
                                </g:if>

                                <g:else>
                                    <tr>
                                        <td>
                                            <div class="col-12 ">

                                                <div class="row" >



                                                    <div class="col-9">
                                                        <div class="col-12 mt-2">
                                                            ${rs.getDescription()}
                                                        </div>

                                                        <div class="col-12  mt-4">
                                                            <div class="row">

                                                                <div class="col-3">

                                                                    <a> <i class="fa fa-facebook-official fa-1x" aria-hidden="true"></i></a>
                                                                    <a> <i class="fa fa-twitter fa-1x" aria-hidden="true"></i></a>
                                                                    <a> <i class="fa fa-google-plus fa-1x" aria-hidden="true"></i></a>

                                                                </div>

                                                                <div class="col-9 links">

                                                                    <g:if test="${!ReadingItem.findByUserAndResource(u,rs).isRead}">
                                                                        <g:link controller="readingItem" action="markRead" params="[id:rs.id]" class="links1">Mark as read </g:link>
                                                                    </g:if>

                                                                    <a href="${LinkResource.findById(rs.id).url}" class="links1">View Full Site</a>



                                                                    <a href="#" class="links1">View post</a>
                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </td>
                                    </tr>
                                </g:else>

                            </g:each>

                        </g:each>

                        </tbody>
                    </table>
                </div>

            </div>
        </div>
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
                                        Visibility* :
                                    </div>
                                    <div class="col-8">
                                        <select class="form-control" name="visi">
                                            <option value="public">Public</option>
                                            <option value="private">Private</option>
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

            <g:form controller="subscription" action="invite">
                <div class="modal-body">

                    <div class="col-12">

                        <div class="col-12 mb-1">

                            <div class="row">
                                <div class="col-4">Email* :</div>
                                <div class="col-8">
                                    <input class="form-control" id="email" name="email" type="email" placeholder="Email">
                                </div>


                            </div>
                        </div>

                        <div class="col-12 mt-2">
                            <div class="row">
                                <div class="col-4">Topic* :</div>
                                <div class="col-8" id="sendInvitationModalName">


                                    <select class="form-control" name="topic">
                                        <g:each in="${Subscription.findAllByUser(u).topic}" var="topic">
                                            <option value="${topic.name}">${topic.name}</option>
                                        </g:each>
                                    </select>


                                </div>
                            </div>
                        </div>
                    </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Invite</button>
                </div>
            </g:form>

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
            <g:form controller="subscription" action="invite">
                <div class="modal-body">

                    <div class="col-12">

                        <div class="col-12 mb-1">

                            <div class="row">
                                <div class="col-4">Email* :</div>
                                <div class="col-8">
                                    <input class="form-control" name="email" type="email" placeholder="Email">
                                </div>


                            </div>
                        </div>

                        <div class="col-12 mt-2">
                            <div class="row">
                                <div class="col-4">Topic* :</div>
                                <div class="col-8 sendName"  style="text-align: center;" >


                                    <select class="form-control" name="topic">
                                        <option id="opt" value=""></option>
                                    </select>


                                </div>
                            </div>
                        </div>
                    </div>



                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Invite</button>
                </div>
            </g:form>




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

            <g:form controller="resource" action="createLink">
                <div class="modal-body">


                    <div class="col-12">

                        <div class="col-12 ">

                            <div class="col-12 ">

                                <div class="row">
                                    <div class="col-4">LINK* :</div>
                                    <div class="col-8">
                                        <input class="form-control" name="url" type="url" placeholder="Link">
                                    </div>
                                </div>

                            </div>

                            <div class="col-12 mt-3">
                                <div class="row">
                                    <div class="col-4">Description* :</div>
                                    <div class=" col-8 form-group">
                                        <textarea class="form-control" id="exampleFormControlTextarea1" name="urlDescription" rows="5" style="resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="row">
                                    <div class="col-4">Topic :</div>
                                    <div class="col-8">
                                        <select class="form-control" name="urlTopic">
                                            <g:each in="${Subscription.findAllByUser(u).toList()}" var="t">
                                                <option value="${t.topic.name}">${t.topic.name}</option>
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
                    <button type="submit" class="btn btn-primary">Send</button>
                </div>
            </g:form>

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

            <g:uploadForm name="upload" method="post" controller="resource" action="fileUpload">
                <div class="modal-body">

                    <div class="col-12 ">


                        <div class="col-12 ">

                            <div class="col-12 mb-3">

                                <div class="row">
                                    <div class="col-4">Document* :</div>
                                    <div class="col-8">
                                        <div class="custom-file">
                                            <input type="file" name="documentFile" class="custom-file-input" id="docFile" required>
                                            <label class="custom-file-label" for="docFile">Choose file</label>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-12 ">
                                <div class="row">
                                    <div class="col-4">Description* :</div>
                                    <div class=" col-8 form-group">
                                        <textarea class="form-control" name="documentDescription" id="exampleFormControlTextarea2" rows="5" style="resize: none;"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="row">
                                    <div class="col-4" >Topic* :</div>
                                    <div class="col-8">
                                        <select class="form-control" name="documentTopic">
                                            <g:each in="${Subscription.findAllByUser(u).toList()}" var="t">
                                                <option value="${t.topic.name}">${t.topic.name}</option>
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
                    <button type="submit" class="btn btn-primary">Upload</button>
                </div>
            </g:uploadForm>


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
        var myVal = $(event.relatedTarget).data('val');
        // alert(myVal)
        // $(this).find("select").attr("placeholder",myVal)
        $(this).find("#opt").attr("value",myVal)
        $(this).find("#opt").text(myVal)
    });


    $('#docFile').change(function() {

        var file = $('#docFile')[0].files[0].name;
        var name = file.substring(0,21)
        $(this).next('label').text(name);
    });

</script>


</body>
</html>