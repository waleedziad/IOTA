<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
    if (session.getAttribute("user_id") == null) {
%>
<c:redirect url="login.jsp"/>
<%
    }
    Long deviceId = Long.parseLong(request.getParameter("deviceId"));
    Long userId = (Long) session.getAttribute("user_id");
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if IE 10]> <html lang="en" class="ie10"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <style type="text/css" media="screen">
            /*!important without this top: 0; bottom: 0 doesn't work on old ie */
            body, html {
                position: absolute;
                top: 0px; bottom: 0; left: 0; right: 0;
                margin:0; padding:0;
                overflow:hidden
            }

            #code { 
                margin: 0;
                position: absolute;

            }
        </style>
        <meta charset="utf-8" />
        <title>IOTA | Server IDE</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />
        <link href="assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" />
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="assets/css/style_responsive.css" rel="stylesheet" />
        <link href="assets/css/style_default.css" rel="stylesheet" id="style_color" />
        <link href="#" rel="stylesheet" id="style_metro" />
        <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
        <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
        
           <script src="ace-builds/src/ace.js"></script>
        <script src="ace-builds/src/ext-old_ie.js"></script>
    </head>
    <!-- END HEAD -->
    <!-- BEGIN BODY -->
    <body class="fixed-top">
        <!-- BEGIN HEADER -->
        <div id="header" class="navbar navbar-inverse navbar-fixed-top">
            <!-- BEGIN TOP NAVIGATION BAR -->
            <div class="navbar-inner">
                <div class="container-fluid">
                    <!-- BEGIN LOGO -->
                    <a class="brand" href="index.jsp">
                        <img src="assets/img/logo.png" alt="Conquer"/>
                    </a>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a class="btn btn-navbar collapsed" id="main_menu_trigger" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="arrow"></span>
                    </a>          
                    <!-- END RESPONSIVE MENU TOGGLER -->				
                    <div class="top-nav">
                        <!-- BEGIN QUICK SEARCH FORM -->
                        <form class="navbar-search hidden-phone">
                            <div class="search-input-icon">
                                <input type="text" class="search-query dropdown-toggle" id="quick_search" placeholder="Search" data-toggle="dropdown" />
                                <i class="icon-search"></i>
                                <!-- BEGIN QUICK SEARCH RESULT PREVIEW -->
                                <ul class="dropdown-menu extended">								
                                    <li>
                                        <span class="arrow"></span>
                                        <p>Found 23 results</p>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-success"><i class="icon-user"></i></span>
                                            Nick Kim, Technical Mana...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-info"><i class="icon-money"></i></span>
                                            Anual Report,Dec 20...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-warning"><i class="icon-comment"></i></span>
                                            Re: Nick Dalton, Sep 11:...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-important"><i class="icon-bullhorn"></i></span>
                                            Office Setup, Mar 12...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-info"><i class="icon-envelope"></i></span>
                                            Re: Order Status, Jan 12...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="label label-info"><i class="icon-paper-clip"></i></span>
                                            project_2011.docx, Feb 12...<i class="icon icon-arrow-right"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            See all results...
                                        </a>
                                    </li>
                                </ul>
                                <!-- END QUICK SEARCH RESULT PREVIEW -->
                            </div>
                        </form>
                        <!-- END QUICK SEARCH FORM -->
                        <!-- BEGIN TOP NAVIGATION MENU -->					
                        <ul class="nav pull-right" id="top_menu">
                            <!-- BEGIN NOTIFICATION DROPDOWN -->	

                            <!-- END NOTIFICATION DROPDOWN -->
                            <!-- BEGIN INBOX DROPDOWN -->
                            <!-- END INBOX DROPDOWN -->
                            <li class="divider-vertical hidden-phone hidden-tablet"></li>
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <!-- END USER LOGIN DROPDOWN -->
                            <li class="divider-vertical hidden-phone hidden-tablet"></li>
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-user"></i>
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="#"><i class="icon-user"></i> <%=(String) session.getAttribute("email")%> </a></li>
                                    <li class="divider"></li>
                                    <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                        </ul>
                        <!-- END TOP NAVIGATION MENU -->	
                    </div>
                </div>
            </div>
            <!-- END TOP NAVIGATION BAR -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN CONTAINER -->	
        <div id="container" class="row-fluid">
            <!-- BEGIN SIDEBAR -->
            <div id="sidebar" class="nav-collapse collapse">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <div class="navbar-inverse">
                    <form class="navbar-search visible-phone">
                        <input type="text" class="search-query" placeholder="Search" />
                    </form>
                </div>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
                <!-- BEGIN SIDEBAR MENU -->
                <ul>
                    <li>
                        <a href="index.jsp">
                            <i class="icon-home"></i> Dashboard
                        </a>					
                    </li>
                    <!--
    <li class="has-sub">
                            <a href="javascript:;" class="">
                            <i class="icon-bookmark-empty"></i> UI Elements
                            <span class="arrow"></span>
                            </a>
                            <ul class="sub">
                                    <li><a class="" href="ui_elements_general.html">General</a></li>
                                    <li><a class="" href="ui_elements_buttons.html">Buttons</a></li>
                                    <li><a class="" href="ui_elements_tabs_accordions.html">Tabs & Accordions</a></li>
                                    <li><a class="" href="ui_elements_typography.html">Typography</a></li>
                            </ul>
                    </li>
                    <li><a class="" href="forms.html"><i class="icon-table"></i> Form Stuff</a></li>
                    -->

                    <!--
                                    <li><a class="" href="tables.html"><i class="icon-table"></i> Data Tables</a></li>
                                    <li><a class="" href="grids.html"><i class="icon-th"></i> Grids & Portlets</a></li>
                    -->


                    <!--
                    <li class="has-sub">
                                            <a href="javascript:;" class="">
                                            <i class="icon-map-marker"></i> Maps
                                            <span class="arrow"></span>
                                            </a>
                                            <ul class="sub">
                                                    <li><a class="" href="maps_google.html"> Google Maps</a></li>
                                                    <li><a class="" href="maps_vector.html"> Vector Maps</a></li>
                                            </ul>
                                    </li>
                                    <li><a class="" href="calendar.html"><i class="icon-ok"></i> Calendar</a></li>
                                    <li><a class="" href="gallery.html"><i class="icon-camera"></i> Gallery</a></li>
                    -->

                </ul>
                <!-- END SIDEBAR MENU -->   		
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN PAGE -->
            <div id="body">
                <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <div id="widget-config" class="modal hide">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button">×</button>
                        <h3>Widget Settings</h3>
                    </div>
                    <div class="modal-body">
                        <p>Here will be a configuration form</p>
                    </div>
                </div>
                <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
                <!-- BEGIN PAGE CONTAINER-->
                <div class="container-fluid">
                    <!-- BEGIN PAGE HEADER-->	    
                    <div class="row-fluid">

                        <div class="span12">
                            <!-- BEGIN STYLE CUSTOMIZER-->
                            <div id="styler" class="hidden-phone">
                                <i class="icon-cog"></i>
                                <span class="settings">
                                    <span class="text">Style:</span>
                                    <span class="colors">
                                        <span class="color-default" data-style="default">
                                        </span>
                                        <span class="color-grey" data-style="grey">
                                        </span>
                                        <span class="color-navygrey" data-style="navygrey">
                                        </span>											
                                        <span class="color-red" data-style="red">
                                        </span>	
                                    </span>
                                    <span class="layout">
                                        <label class="hidden-phone">
                                            <input type="checkbox" class="header" checked value="" />Sticky Header
                                        </label><br />
                                        <label><input type="checkbox" class="metro" value="" />Metro Style</label>
                                        <span class="space5"></span>
                                        <a class="btn fancybox-button" data-rel="fancybox-button" title="Conquer Large Desktop Preview"  href="assets/img/demo/desktop.png"><i class="icon-eye-open"></i> Screenshots</a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Notebook Preview" href="assets/img/demo/notebook.png"></a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Tablet Preview"  href="assets/img/demo/tablet.png"></a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Phone Preview"  href="assets/img/demo/phone.png"></a>
                                    </span>
                                </span>
                            </div>
                            <!-- END STYLE CUSTOMIZER-->     	
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->				    			
                            <h3 class="page-title">
                                Server IDE
                                <small>Code and more</small>
                            </h3>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> <span class="divider">/</span>
                                </li>
                                <li><a href="#">IDE</a></li>
                            </ul>

                            <form method="POST" action="serverIDE.htm">
                                <input type="hidden" name="userID" value="<%=userId%>"/>
                                <input type="hidden" name="deviceID" value="<%=deviceId%>"/>
                            
                                <div class="row-fluid" style="margin-bottom: 5px;">
                                    <div class="span6"> 
                                        <input type="submit" name="case" class="btn btn-block btn-inverse" value="Deploy"/>
                                    </div>
                                    <div class="span6"> 
                                        <input type="submit" name="case" class="btn btn-block btn-inverse" value="Run"/>
                                    </div>
                                    
                                </div>
                                <select name="langCode"><option value="1" selected="">Java</option><option value="2">C++</option></select>
                                <div class="widget">
                                    <div class="widget-title">
                                        <h4><i class="icon-reorder"></i>Code Editor</h4>
                                    </div>
                                    <span class="tools" style="height:100%;width:100%;">
                                        <textarea name="code" style="height:35%;width:81%;">#include &lt;iostream>
#include &lt;stdlib>

int main() {
    cout << "Hello World!" << endl;
    return 0;
}</textarea>
                                        <div id="code" style="height:35%;width:81%;"/>









                                </div>

                                </span>  							
                        </div>
                        </form>
                        </br></br></br></br></br></br></br></br></br></br></br></br>
                        <h5> Result: </h5>
                        <div class="text-info">
                             <%
                            if(session.getAttribute("codeResult")!=null){
                        %>
                            <textarea rows="2" cols="80" style="width:99.5%" readonly><%=session.getAttribute("codeResult")%></textarea>
                        <%
                            session.removeAttribute("codeResult");
                            }
                            else{
                         %>
                           <textarea rows="2" cols="80" style="width:99.5%" readonly></textarea>
                         <%
                            }
                         %>
                        </div>
                    </div>
                </div>
                <!-- END PAGE HEADER-->
                <!-- BEGIN PAGE CONTENT-->
                <div id="page">
                    <!-- BEGIN BASIC CHART PORTLET--><!-- END BASIC CHART PORTLET-->
                    <!-- BEGIN INTERACTIVE CHART PORTLET--><!-- END INTERACTIVE CHART PORTLET-->
                    <!-- BEGIN TRACKING CURVES PORTLET--><!-- END TRACKING CURVES PORTLET-->
                    <!-- BEGIN DYNAMIC CHART PORTLET--><!-- END DYNAMIC CHART PORTLET-->
                    <!-- BEGIN STACK CHART CONTROLS PORTLET--><!-- END STACK CHART CONTROLS PORTLET-->
                    <!-- BEGIN PIE CHART PORTLET-->
                    <div class="row-fluid">
                        <div class="span6"></div>
                    </div>
                    <!-- END PIE CHART PORTLET-->
                </div>
                <!-- END PAGE CONTENT-->
            </div>
            <!-- BEGIN PAGE CONTAINER-->		
        </div>
        <!-- END PAGE -->	
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div id="footer">
        2015 &copy; IOTA.
        <div class="span pull-right">
            <span class="go-top"><i class="icon-arrow-up"></i></span>
        </div>
    </div>
    <!-- END FOOTER -->
    <!-- BEGIN JAVASCRIPTS -->
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <script src="assets/js/jquery-1.8.2.min.js"></script>	
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.blockui.js"></script>	
    <!-- ie8 fixes -->
    <!--[if lt IE 9]>
    <script src="assets/js/excanvas.js"></script>
    <script src="assets/js/respond.js"></script>
    <![endif]-->
    <script src="assets/flot/jquery.flot.js"></script>
    <script src="assets/flot/jquery.flot.resize.js"></script>
    <script src="assets/flot/jquery.flot.pie.js"></script>
    <script src="assets/flot/jquery.flot.stack.js"></script>
    <script src="assets/flot/jquery.flot.crosshair.js"></script>
    <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>	
    <script src="assets/fancybox/source/jquery.fancybox.pack.js"></script>
    <script src="assets/js/app.js"></script>		
    <script>
        jQuery(document).ready(function () {
            // initiate layout and plugins
            App.init();
        });
    </script>
    <!-- END JAVASCRIPTS -->
    <script src="ace-builds/src/ace.js"></script>
    <script src="ace-builds/src/ext-old_ie.js"></script>
    <script>
        var editor = ace.edit("code");
        editor.setTheme("ace/theme/monokai");
        editor.session.setMode("ace/mode/c_cpp");
        var textarea = $('textarea[name="code"]').hide();
        editor.getSession().setValue(textarea.val());
        editor.getSession().on('change', function () {
            textarea.val(editor.getSession().getValue());
        });
    </script>
</body>
<!-- END BODY -->
</html>