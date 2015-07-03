<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.Domain.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
    if (session.getAttribute("user_id") == null) {
%>
<c:redirect url="login.jsp"/>
<%
    }
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>Add Feed</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="assets/css/style_responsive.css" rel="stylesheet" />
        <link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
        <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
    </head>
    <!-- END HEAD -->

    <script type="text/javascript">

        function checkForm(form)
        {
            if (form.feedname.value == "") {
                alert("Error: Feed name cannot be blank!");
                form.feedname.focus();
                return false;
            }

        }
    </script>



    <!-- BEGIN BODY -->
    <body>
        <!-- BEGIN LOGO -->
        <div id="logo" class="center">
            <img src="assets/img/logo.png" alt="logo" class="center" /> 
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div id="login">
            <!-- BEGIN LOGIN FORM -->
            <form id="loginform" class="form-vertical no-padding no-margin" action="addnewfeed.htm" method="POST" onsubmit="return checkForm(this);">
                <input type="hidden" name="user_id" value="<%=(Long)session.getAttribute("user_id")%>"/>
                <p class="center">Add Device</p>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-desktop"></i></span><select id="input-devicename" name="device_id" type="dropdown" placeholder="Device Name" />
                                <%
                                    ArrayList<Device> devices = (ArrayList<Device>) session.getAttribute("devices");
                                    for (int i = 0; i < devices.size(); i++) {
                                %>
                            <option value="<%= devices.get(i).getDeviceId()%>" ><%= devices.get(i).getDeviceName()%></option>

                            <%
                                }
                            %>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="input-prepend">
                            <span class="add-on"><i class="icon-arrow-down"></i></span><input id="input-feedname" name="feedname" type="text" placeholder="Feed Name" />
                        </div>
                    </div>
                </div>
                <input type="submit" id="login-btn" class="btn btn-block btn-inverse" value="Add Feed" />
            </form><br>
            <form id="Back" class="form-vertical no-padding no-margin" action="index.htm">
                <input type="submit" id="back-btn" class="btn btn-block btn-inverse" value="Dashboard" />
            </form>
            <!-- END LOGIN FORM -->
        </div>
        <!-- END LOGIN -->
        <!-- BEGIN COPYRIGHT -->
        <div id="login-copyright">
            2015 &copy; IOTA.
        </div>
        <!-- END COPYRIGHT -->
        <!-- BEGIN JAVASCRIPTS -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.blockui.js"></script>
        <script src="assets/js/app.js"></script>
        <script>
              jQuery(document).ready(function () {
                  App.initLogin();
              });
        </script>
        <!-- END JAVASCRIPTS -->
    </body>
    <!-- END BODY -->
</html>