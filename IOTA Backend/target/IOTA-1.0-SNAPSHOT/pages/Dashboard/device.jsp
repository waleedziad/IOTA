<%@page import="com.mycompany.Domain.Device"%>
<%@page import="com.mycompany.Domain.FeedData"%>
<%@page import="com.mycompany.Controller.DashboardController.DeviceInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
    if (session.getAttribute("user_id") == null) {
%>
<c:redirect url="login.jsp"/>
<%
    }
    Long deviceId = Long.parseLong(request.getParameter("deviceid"));
%>

<!DOCTYPE html>
<!--  
Template Name: Conquer Responsive Admin Dashboard Template build with Twitter Bootstrap 2.2.2
Version: 1.2
Author: KeenThemes
Website: http://www.keenthemes.com
Purchase: http://themeforest.net/item/conquer-responsive-admin-dashboard-template/3716838
-->
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if IE 10]> <html lang="en" class="ie10"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>IOTA Device Page</title>
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
        <link href="assets/fancybox/source/jquery.fancybox.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/uniform/css/uniform.default.css" />
        <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />
        <link href="assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
        <link href="assets/jqvmap/jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" />
        <!-- BEGIN JAVASCRIPTS -->
        <!-- Load javascripts at bottom, this will reduce page load time -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>	
        <script src="assets/jQuery-slimScroll/jquery-ui-1.9.2.custom.min.js"></script>	
        <script src="assets/jQuery-slimScroll/slimScroll.min.js"></script>		
        <script src="assets/fullcalendar/fullcalendar/fullcalendar.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.blockui.js"></script>	
        <script src="assets/js/jquery.cookie.js"></script>	
        <!-- ie8 fixes -->
        <!--[if lt IE 9]>
        <script src="assets/js/excanvas.js"></script>	
        <script src="assets/js/respond.js"></script>
        <![endif]-->	
        <script src="assets/jqvmap/jqvmap/jquery.vmap.js" type="text/javascript"></script>	
        <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.russia.js" type="text/javascript"></script>
        <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.world.js" type="text/javascript"></script>
        <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.europe.js" type="text/javascript"></script>
        <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.germany.js" type="text/javascript"></script>
        <script src="assets/jqvmap/jqvmap/maps/jquery.vmap.usa.js" type="text/javascript"></script>
        <script src="assets/jqvmap/jqvmap/data/jquery.vmap.sampledata.js" type="text/javascript"></script>	
        <script src="assets/jquery-knob/js/jquery.knob.js"></script>
        <script src="assets/flot/jquery.flot.js"></script>
        <script src="assets/flot/jquery.flot.resize.js"></script>
        <script src="assets/js/jquery.peity.min.js"></script>	
        <script type="text/javascript" src="assets/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/uniform/jquery.uniform.min.js"></script>	
        <script type="text/javascript" src="assets/js/jquery.pulsate.min.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>	
        <script src="assets/fancybox/source/jquery.fancybox.pack.js"></script>
        <script src="assets/js/app.js"></script>		
        <script>
            // used by plot functions
            var data = [];
            var totalPoints = 250;
            var handleDashboardCharts;
            jQuery(document).ready(function () {
                // initiate layout and plugins
                App.setMainPage(true);
                App.init();
                ////////////////////////////
                handleDashboardCharts = function (index) {
                    if (!jQuery.plot) {
                        return;
                    }

                    function randValue() {
                        return (Math.floor(Math.random() * (1 + 40 - 20))) + 20;
                    }

                    function getRandomData() {
                        if (data.length > 0)
                            data = data.slice(1);
                        // do a random walk
                        while (data.length < totalPoints) {
                            var prev = data.length > 0 ? data[data.length - 1] : 50;
                            var y = prev + Math.random() * 10 - 5;
                            if (y < 0)
                                y = 0;
                            if (y > 100)
                                y = 100;
                            data.push(y);
                        }
                        // zip the generated y values with the x values
                        var res = [];
                        for (var i = 0; i < data.length; ++i)
                            res.push([i, data[i]])
                        return res;
                    }

            <%
                DeviceInfo currentDeviceInfo = null;
                ArrayList<DeviceInfo> devicesInfo = (ArrayList<DeviceInfo>) session.getAttribute("devicesInfo");

                for (int i = 0; i < devicesInfo.size(); i++) {
                    if (devicesInfo.get(i).device.getDeviceId() != deviceId) {
                        continue;
                    }
                    currentDeviceInfo = devicesInfo.get(i);
                }
                if (currentDeviceInfo != null) {
                    for (int i = 0; i < currentDeviceInfo.feeds.size(); i++) {

                        out.println("if(index==" + i + "){");

                        ArrayList<FeedData> feedData = (ArrayList<FeedData>) currentDeviceInfo.feeds.get(i).feedData;
                        out.println("var pageviews = [");

                        for (int k = feedData.size() - 1, x = 0; k >= 0; k--, x++) {
                            out.print("[" + x + ", " + feedData.get(k).getFeedValue() + "]");
                            if (k != 0) {
                                out.println(",");
                            }
                        }
                        out.println("];");


            %>

                    $('#site_statistics_loading').hide();
                    $('#site_statistics_content').show();


                    var plot = $.plot($("#site_statistics"), [
                        {
                            data: pageviews,
                            label: "<%=currentDeviceInfo.feeds.get(i).feed.getFeedName()%>"
                        }

                    ], {
                        series: {
                            lines: {
                                show: true,
                                lineWidth: 2,
                                fill: true,
                                fillColor: {
                                    colors: [{
                                            opacity: 0.05
                                        }, {
                                            opacity: 0.01
                                        }]
                                }
                            },
                            points: {
                                show: true
                            },
                            shadowSize: 2
                        },
                        grid: {
                            hoverable: true,
                            clickable: true,
                            tickColor: "#eee",
                            borderWidth: 0
                        },
                        colors: ["#d12610", "#37b7f3", "#52e136"],
                        xaxis: {
                            ticks: 11,
                            tickDecimals: 0
                        },
                        yaxis: {
                            ticks: 11,
                            tickDecimals: 0
                        }
                    });
                    function showTooltip(x, y, contents) {
                        $('<div id="tooltip">' + contents + '</div>').css({
                            position: 'absolute',
                            display: 'none',
                            top: y + 5,
                            left: x + 15,
                            border: '1px solid #333',
                            padding: '4px',
                            color: '#fff',
                            'border-radius': '3px',
                            'background-color': '#333',
                            opacity: 0.80
                        }).appendTo("body").fadeIn(200);
                    }

                    var previousPoint = null;
                    $("#site_statistics").bind("plothover", function (event, pos, item) {
                        $("#x").text(pos.x.toFixed(2));
                        $("#y").text(pos.y.toFixed(2));

                        if (item) {
                            if (previousPoint != item.dataIndex) {
                                previousPoint = item.dataIndex;

                                $("#tooltip").remove();
                                var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);

                                showTooltip(item.pageX, item.pageY, item.series.label + " of " + x + " = " + y);
                            }
                        } else {
                            $("#tooltip").remove();
                            previousPoint = null;
                        }
                    });

                    //server load
                    var options = {
                        series: {
                            shadowSize: 1
                        },
                        lines: {
                            show: true,
                            lineWidth: 0.5,
                            fill: true,
                            fillColor: {
                                colors: [{
                                        opacity: 0.1
                                    }, {
                                        opacity: 1
                                    }]
                            }
                        },
                        yaxis: {
                            min: 0,
                            max: 100,
                            tickFormatter: function (v) {
                                return v + "%";
                            }
                        },
                        xaxis: {
                            show: false
                        },
                        colors: ["#e14e3d"],
                        grid: {
                            tickColor: "#a8a3a3",
                            borderWidth: 0
                        }
                    };

                    $('#load_statistics_loading').hide();
                    $('#load_statistics_content').show();

                    var updateInterval = 30;
                    var plot = $.plot($("#load_statistics"), [getRandomData()], options);

                    function update() {
                        plot.setData([getRandomData()]);
                        plot.draw();
                        setTimeout(update, updateInterval);
                    }
                    update();

            <%                out.println("}");
                    }
                }
            %>
                }


                ////////////////////////


                handleDashboardCharts(0);
            });
        </script>
        <!-- END JAVASCRIPTS -->
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
                        <img src="assets/img/logo.png" alt="Conquer" />
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
                                    <li><a href="#"><i class="icon-user"></i> <%=(String)session.getAttribute("email")%></a></li>
                                    <li class="divider"></li>
                                    <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
                                </ul>
                            </li>
                            <!-- END USER LOGIN DROPDOWN -->
                        </ul>
                        <!-- END TOP NAVIGATION MENU -->	
                    </div>
                </div>
                <span class="navbar-search visible-phone">
                    <input type="text" class="search-query" placeholder="Search" />
                </span></div>
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
                    </form>
                </div>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
                <!-- BEGIN SIDEBAR MENU -->
                <ul>
                    <li class="active">
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
                                        <a class="btn fancybox-button" data-rel="fancybox-button" title="Conquer Large Desktop Preview" href="assets/img/demo/desktop.png"><i class="icon-eye-open"></i> Screenshots</a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Notebook Preview" href="assets/img/demo/notebook.png"></a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Tablet Preview" href="assets/img/demo/tablet.png"></a>
                                        <a class="fancybox-button" data-rel="fancybox-button" title="Conquer Phone Preview" href="assets/img/demo/phone.png"></a>
                                    </span>
                                </span>
                            </div>
                            <!-- END STYLE CUSTOMIZER-->    	
                            <!-- BEGIN PAGE TITLE & BREADCRUMB-->		
                            <h3 class="page-title">Device Page <small>statistics and more</small>
                            </h3>
                            <br><br>
                            <ul class="breadcrumb">
                                <li>
                                    <i class="icon-home"></i>
                                    <a href="#">Home</a> <span class="divider">/</span>
                                </li>
                                <li><a href="#">Dashboard</a></li>
                                <li class="pull-right dashboard-report-li">
                                    
                                </li>
                            </ul>
                            <!-- END PAGE TITLE & BREADCRUMB-->
                        </div>
                    </div>
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN PAGE CONTENT-->
                    <div id="page" class="dashboard">
                        <!-- BEGIN OVERVIEW STATISTIC BARS-->
                        <div class="row-fluid stats-overview-cont"></div>
                        <!-- END OVERVIEW STATISTIC BARS-->
                        <div class="row-fluid">
                            <div class="span6"> <a href="editor.jsp?deviceId=<%=deviceId%>">
                                    <button class="btn btn-block btn-inverse" type="button">Device IDE</button>
                                </a>
                            </div>
                            <div class="span6"> <a href="servereditor.jsp?deviceId=<%=deviceId%>">
                                    <button class="btn btn-block btn-inverse" type="button">Server IDE</button>
                                </a>
                            </div>
                            <br>
                            <br>
                            <div class="widget">
                                <div class="widget-title">
                                    <%
                                        if (currentDeviceInfo != null && currentDeviceInfo.feeds.size() != 0) {
                                    %>
                                    <h4><i class="icon-signal"></i>Feeds Statistics</h4>
                                    <% }else{
                                    %>
                                    <h4><i class="icon-signal"></i>This device does not contain any feed</h4>
                                    <%
                                        }
                                    %>
                                    <span class="tools">
                                        <a href="javascript:;" class="icon-chevron-down"></a>
                                        <a href="javascript:;" class="icon-refresh"></a>		
                                        <a href="javascript:;" class="icon-remove"></a>
                                    </span>							
                                </div>
                                <div class="widget-body">
                                    <div id="site_statistics_loading">
                                        <img src="assets/img/loading.gif" alt="loading" />
                                    </div>
                                    <div id="site_statistics_content" class="hide">
                                        <div class="btn-toolbar no-top-space clearfix">
                                            <div class="btn-group" data-toggle="buttons-radio">
                                                <%
                                                    if (currentDeviceInfo != null && currentDeviceInfo.feeds.size() != 0) {
                                                        for (int i = 0; i < currentDeviceInfo.feeds.size(); i++) {
                                                %>
                                                <button class="btn btn-mini" onclick="handleDashboardCharts(<%=i%>)"><%=currentDeviceInfo.feeds.get(i).feed.getFeedName()%></button>
                                                <%}
                                                } else if (currentDeviceInfo != null) {
                                                %>
                                                <button class="btn btn-mini" >This device does not contain any feeds</button>
                                                <%
                                                    }
                                                %>
                                            </div>
                                            <div class="btn-group pull-right" data-toggle="buttons-radio">

                                            </div>
                                        </div>
                                        <div id="site_statistics" class="chart"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- END OVERVIEW STATISTIC BLOCKS-->
                    <div class="row-fluid">
                        <div class="span12">
                            <!-- BEGIN LATEST INVOICES PORTLET-->
                            <div class="widget">
                                <div class="widget-title">
                                    <h4><i class="icon-print"></i>Device Data</h4>
                                    <span class="tools">
                                        <a href="javascript:;" class="icon-chevron-down"></a>
                                        <a href="javascript:;" class="icon-refresh"></a>		
                                        <a href="javascript:;" class="icon-remove"></a>
                                    </span>							
                                </div>
                                <div class="widget-body">
                                    <table class="table table-striped table-bordered table-advance table-hover">
                                        <thead>
                                            <tr>
                                                <th><i class="icon-briefcase"></i> <span class="hidden-phone">From</span></th>
                                                <th><i class="icon-question-sign"></i> <span class="hidden-phone">Feed Name</span></th>
                                                <th><i class="icon-bookmark"></i> <span class="hidden-phone">Feed Value</span></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                        ArrayList<FeedData> tableData=(ArrayList<FeedData>)session.getAttribute("device_table_data");
                                                        for(int i=0;i<tableData.size();i++){
                                            %>
                   
                                                <tr>
                                                    <td><a href="device.jsp?deviceid=<%=tableData.get(i).getFeed().getDevice().getDeviceId()%>"><%=tableData.get(i).getFeed().getDevice().getDeviceName()%></a></td>
                                                    <td><%=tableData.get(i).getFeed().getFeedName()%></td>
                                                    <td>
                                                         <span class="label label-success label-mini block-margin-bottom-5"><%=tableData.get(i).getFeedValue()%></span>
                                                    </td>
                                                    
                                                </tr>
                                                <%}%>
                                        </tbody>
                                    </table>
                                    <div class="space7"></div>
                                    <div class="clearfix">
                                       	
                                    </div>
                                </div>
                            </div>
                            <!-- END LATEST INVOICES PORTLET-->
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="span8 responsive" data-tablet="span12 fix-margin" data-desktop="span8">
                            <!-- BEGIN CALENDAR PORTLET--><!-- END CALENDAR PORTLET-->
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
            <!-- END PAGE CONTAINER-->		
        </div>
        <!-- END PAGE -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <div id="footer">
        2015 &copy;.
        <div class="span pull-right">
            <span class="go-top"><i class="icon-arrow-up"></i></span>
        </div>
        IOTA.</div>
    <!-- END FOOTER -->
</body>
<!-- END BODY -->
</html>