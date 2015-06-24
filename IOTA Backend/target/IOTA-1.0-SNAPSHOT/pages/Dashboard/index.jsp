<%@page import="com.mycompany.Domain.Device"%>
<%@page import="java.util.ArrayList"%>
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
	<title>IOTA Dashboard</title>
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
						<li class="dropdown" id="header_notification_bar">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-warning-sign"></i>
							<span class="label label-important">15</span>
							</a>
							<ul class="dropdown-menu extended notification">
								<li>
									<p>You have 14 new notifications</p>
								</li>
								<li>
									<a href="#">
									<span class="label label-success"><i class="icon-plus"></i></span>
									New user registered. 
									<span class="small italic">Just now</span>
									</a>
								</li>
								<li>
									<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									Server #12 overloaded. 
									<span class="small italic">15 mins</span>
									</a>
								</li>
								<li>
									<a href="#">
									<span class="label label-warning"><i class="icon-bell"></i></span>
									Server #2 not respoding.
									<span class="small italic">22 mins</span>
									</a>
								</li>
								<li>
									<a href="#">
									<span class="label label-info"><i class="icon-bullhorn"></i></span>
									Application error.
									<span class="small italic">40 mins</span>
									</a>
								</li>
								<li>
									<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									Database overloaded 68%. 
									<span class="small italic">2 hrs</span>
									</a>
								</li>
								<li>
									<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									2 user IP addresses blacklisted.
									<span class="small italic">5 hrs</span>
									</a>
								</li>
								<li>
									<a href="#">See all notifications</a>
								</li>
							</ul>
						</li>
						<!-- END NOTIFICATION DROPDOWN -->
						<!-- BEGIN INBOX DROPDOWN -->
						<li class="dropdown" id="header_inbox_bar">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-envelope-alt"></i>
							<span class="label label-success">5</span>
							</a>
							<ul class="dropdown-menu extended inbox">
								<li>
									<p>You have 12 new messages</p>
								</li>
								<li>
									<a href="#">
									<span class="photo"><img src="./assets/img/avatar-mini.png" alt="avatar" /></span>
									<span class="subject">
									<span class="from">Lisa Wong</span>
									<span class="time">Just Now</span>
									</span>
									<span class="message">
									Vivamus sed auctor nibh congue nibh.
									</span>  
									</a>
								</li>
								<li>
									<a href="#">
									<span class="photo"><img src="./assets/img/avatar-mini.png" alt="avatar" /></span>
									<span class="subject">
									<span class="from">Alina Fionovna</span>
									<span class="time">16 mins</span>
									</span>
									<span class="message">
									Vivamus sed auctor nibh congue.
									</span>  
									</a>
								</li>
								<li>
									<a href="#">
									<span class="photo"><img src="./assets/img/avatar-mini.png" alt="avatar" /></span>
									<span class="subject">
									<span class="from">Mila Rock</span>
									<span class="time">2 hrs</span>
									</span>
									<span class="message">
									Vivamus sed auctor nibh congue.
									</span>  
									</a>
								</li>
								<li>
									<a href="#">See all messages</a>
								</li>
							</ul>
						</li>
						<!-- END INBOX DROPDOWN -->
						<li class="divider-vertical hidden-phone hidden-tablet"></li>
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-wrench"></i>
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon-cogs"></i> System Settings</a></li>
								<li><a href="#"><i class="icon-pushpin"></i> Shortcuts</a></li>
								<li><a href="#"><i class="icon-trash"></i> Trash</a></li>
							</ul>
						</li>
						<!-- END USER LOGIN DROPDOWN -->
						<li class="divider-vertical hidden-phone hidden-tablet"></li>
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-user"></i>
							<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon-user"></i> Mark King</a></li>
								<li><a href="#"><i class="icon-envelope-alt"></i> Inbox</a></li>
								<li><a href="#"><i class="icon-tasks"></i> Tasks</a></li>
								<li><a href="#"><i class="icon-ok"></i> Calendar</a></li>
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
						<h3 class="page-title">
							IOTA Dashboard
							<small>statistics and more</small>
						</h3>
                        <div class="span5">
                        <a href="adddevice.jsp"><button class="btn btn-block btn-inverse" type="button">+ Add Device</button></a>
                        </div>
                        <div class="span5">
                            <a href="addfeed.htm?id=<%=session.getAttribute("user_id")%>"><button class="btn btn-block btn-inverse" type="button">+ Add Feed</button></a>
                        </div>
                        <br><br>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="#">Home</a> <span class="divider">/</span>
							</li>
							<li><a href="#">Dashboard</a></li>
							<li class="pull-right dashboard-report-li">
								<div id="dashboard-report-range" class="dashboard-report-range-container no-text-shadow tooltips" data-placement="top" data-original-title="Change dashboard date range"><i class="icon-calendar icon-large"></i><span></span>
									<b class="caret"></b>
								</div>
							</li>
						</ul>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN PAGE CONTENT-->
				<div id="page" class="dashboard">
					<!-- BEGIN OVERVIEW STATISTIC BARS-->
					<div class="row-fluid stats-overview-cont">
						
                                              <%
                                                    ArrayList<Device> devices=(ArrayList<Device>)session.getAttribute("devices");
                                                    for(int i=0;i<devices.size();i++){
                                              %>
                                              <a href="device.jsp?deviceid=<%=devices.get(i).getDeviceId()%>">
                                              <div class="span2 responsive" style="margin-right: 10px;" data-tablet="span4" data-desktop="span2">
							<div class="stats-overview block clearfix">
								<div class="display stat ok huge">
									<span class="line-chart">5, 6, 7, 11, 14, 10, 15, 19, 15, 2</span>
									<div class="percent">+66%</div>
								</div>
								<div class="details">
									<div class="title"><%=devices.get(i).getDeviceName()%></div>
									<div class="numbers">1360</div>
								</div>
								<div class="progress progress-info">
									<div class="bar" style="width: 66%"></div>
								</div>
							</div>
						</div>
                                              </a>
                                              <%
                                                    }
                                              %>
                                              
					</div>
					<!-- END OVERVIEW STATISTIC BARS-->
					<div class="row-fluid">
						<div class="span8">
							<!-- BEGIN SITE VISITS PORTLET-->
							<div class="widget">
								<div class="widget-title">
									<h4><i class="icon-signal"></i>Site Visits</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="#widget-config" data-toggle="modal" class="icon-wrench"></a>
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
												<button class="btn btn-mini">Asia</button><button class="btn btn-mini">Europe</button><button class="btn btn-mini">USA</button>		
											</div>
											<div class="btn-group pull-right" data-toggle="buttons-radio">
												<button class="btn btn-mini active">Sales</button><button class="btn btn-mini">
												<span class="visible-phone">In</span>
												<span class="hidden-phone">Income</span>
												</button><button class="btn btn-mini">Stock</button>		
											</div>
										</div>
										<div id="site_statistics" class="chart"></div>
									</div>
								</div>
							</div>
							<!-- END SITE VISITS PORTLET-->
						</div>
						<div class="span4">
							<!-- BEGIN NOTIFICATIONS PORTLET-->
							<div class="widget">
								<div class="widget-title">
									<h4><i class="icon-bell"></i>Notifications</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="#widget-config" data-toggle="modal" class="icon-wrench"></a>
									<a href="javascript:;" class="icon-refresh"></a>
									</span>							
								</div>
								<div class="widget-body">
									<ul class="item-list scroller padding" data-height="307" data-always-visible="1">
										<li>
											<span class="label label-success"><i class="icon-bell"></i></span>
											<span>New user registered.</span>
											<span class="small italic">Just now</span>
										</li>
										<li>
											<span class="label label-success"><i class="icon-bell"></i></span>
											<span>New order received.</span>
											<span class="small italic">15 mins ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Alerting a user account balance.</span>
											<span class="small italic">2 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Alerting administrators staff.</span>
											<span class="small italic">11 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Messages are not sent to users.</span>
											<span class="small italic">14 hrs ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Web server #12 failed to relosd.</span>
											<span class="small italic">2 days ago</span>										
										</li>
										<li>
											<span class="label label-success"><i class="icon-bell"></i></span>
											<span>New order received.</span>
											<span class="small italic">15 mins ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Alerting a user account balance.</span>
											<span class="small italic">2 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Alerting administrators support staff.</span>
											<span class="small italic">11 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Messages are not sent to users.</span>
											<span class="small italic">14 hrs ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Web server #12 failed to relosd.</span>
											<span class="small italic">2 days ago</span>										
										</li>
										<li>
											<span class="label label-success"><i class="icon-bell"></i></span>
											<span>New order received.</span>
											<span class="small italic">15 mins ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Alerting a user account balance.</span>
											<span class="small italic">2 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Alerting administrators support staff.</span>
											<span class="small italic">11 hrs ago</span>
										</li>
										<li>
											<span class="label label-important"><i class="icon-bolt"></i></span>
											<span>Messages are not sent to users.</span>
											<span class="small italic">14 hrs ago</span>
										</li>
										<li>
											<span class="label label-warning"><i class="icon-bullhorn"></i></span>
											<span>Web server #12 failed to relosd.</span>
											<span class="small italic">2 days ago</span>										
										</li>
									</ul>
									<div class="space5"></div>
									<a href="#" class="pull-right">View all notifications</a>										
									<div class="clearfix no-top-space no-bottom-space"></div>
								</div>
							</div>
							<!-- END NOTIFICATIONS PORTLET-->
						</div>
					</div>
					<!-- BEGIN OVERVIEW STATISTIC BLOCKS-->
					<div class="row-fluid">
					  <div class="span3 responsive" data-tablet="span6" data-desktop="span3"></div>
					</div>
					<!-- END OVERVIEW STATISTIC BLOCKS-->
					<div class="row-fluid">
						<div class="span6">
							<!-- BEGIN SERVER LOAD PORTLET-->
							<div class="widget">
								<div class="widget-title">
									<h4><i class="icon-cogs"></i>Server Load</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="#widget-config" data-toggle="modal" class="icon-wrench"></a>
									<a href="javascript:;" class="icon-refresh"></a>		
									<a href="javascript:;" class="icon-remove"></a>
									</span>							
								</div>
								<div class="widget-body">
									<div id="load_statistics_loading">
										<img src="assets/img/loading.gif" alt="loading" />
									</div>
									<div id="load_statistics_content" class="hide">
										<div id="load_statistics" class="chart"></div>
										<div class="btn-toolbar no-bottom-space clearfix">
											<div class="btn-group" data-toggle="buttons-radio">
												<button class="btn btn-mini">Web</button><button class="btn btn-mini">Database</button><button class="btn btn-mini">Static</button>		
											</div>
											<div class="btn-group pull-right" data-toggle="buttons-radio">
												<button class="btn btn-mini active">Asia</button><button class="btn btn-mini">
												<span class="visible-phone">Eur</span>
												<span class="hidden-phone">Europe</span>
												</button><button class="btn btn-mini">USA</button>		
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- END SERVER LOAD PORTLET-->
						</div>
						<div class="span6">
							<!-- BEGIN REGIONAL STATS PORTLET-->
							<div class="widget">
								<div class="widget-title">
									<h4><i class="icon-globe"></i>Regional Stats</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="#widget-config" data-toggle="modal" class="icon-wrench"></a>
									<a href="javascript:;" class="icon-refresh"></a>		
									<a href="javascript:;" class="icon-remove"></a>										
									</span>							
								</div>
								<div class="widget-body">
									<div id="region_statistics_loading">
										<img src="assets/img/loading.gif" alt="loading" />
									</div>
									<div id="region_statistics_content" class="hide">
										<div class="btn-toolbar no-top-space clearfix">
											<div class="btn-group" data-toggle="buttons-radio">
												<button class="btn btn-mini active">Users</button><button class="btn btn-mini">Orders</button><button class="btn btn-mini">Income</button>		
											</div>
											<div class="btn-group pull-right">
												<button class="btn btn-mini dropdown-t	oggle" data-toggle="dropdown">
												Select Region 
												<span class="caret"></span>
												</button>
												<ul class="dropdown-menu">
													<li><a href="javascript:;" id="regional_stat_world">World</a></li>
													<li><a href="javascript:;" id="regional_stat_usa">USA</a></li>
													<li><a href="javascript:;" id="regional_stat_europe">Europe</a></li>
													<li><a href="javascript:;" id="regional_stat_russia">Russia</a></li>
													<li><a href="javascript:;" id="regional_stat_germany">Germany</a></li>
												</ul>
											</div>
										</div>
										<div id="vmap_world" class="vmaps  chart hide"></div>
										<div id="vmap_usa" class="vmaps chart hide"></div>
										<div id="vmap_europe" class="vmaps chart hide"></div>
										<div id="vmap_russia" class="vmaps chart hide"></div>
										<div id="vmap_germany" class="vmaps chart hide"></div>
									</div>
								</div>
							</div>
							<!-- END REGIONAL STATS PORTLET-->
						</div>
					</div>
					<div class="row-fluid">
					  <div class="span6">
						  <!-- BEGIN LATEST INVOICES PORTLET-->
						  <div class="widget">
								<div class="widget-title">
									<h4><i class="icon-print"></i>Latest Invoices</h4>
									<span class="tools">
									<a href="javascript:;" class="icon-chevron-down"></a>
									<a href="#widget-config" data-toggle="modal" class="icon-wrench"></a>
									<a href="javascript:;" class="icon-refresh"></a>		
									<a href="javascript:;" class="icon-remove"></a>
									</span>							
								</div>
								<div class="widget-body">
									<table class="table table-striped table-bordered table-advance table-hover">
										<thead>
											<tr>
												<th><i class="icon-briefcase"></i> <span class="hidden-phone">From</span></th>
												<th><i class="icon-question-sign"></i> <span class="hidden-phone">Details</span></th>
												<th><i class="icon-bookmark"></i> <span class="hidden-phone">Amount</span></th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="#">Loop Inc</a></td>
												<td>Hardware Upgrade</td>
												<td>
													2160.10$ <span class="label label-success label-mini block-margin-bottom-5">Pending</span>
												</td>
												<td><a href="#" class="btn btn-mini hidden-phone">View</a></td>
											</tr>
											<tr>
												<td>
													<a href="#">UnltimateFix Ltd</a>	
												</td>
												<td>Storage Devices</td>
												<td>
													129.10$ <span class="label label-warning label-mini">Paid</span>
												</td>
												<td><a href="#" class="btn btn-mini hidden-phone">View</a></td>
											</tr>
											<tr>
												<td>
													<a href="#">Tripix Ltd</a>	
												</td>
												<td>Company Anual Trip</td>
												<td>
													2400.50$ <span class="label label-success label-mini">Pending</span>
												</td>
												<td><a href="#" class="btn btn-mini hidden-phone">View</a></td>
											</tr>
											<tr>
												<td>
													<a href="#">PrinMe Ltd</a>
												</td>
												<td>Printer recharge</td>
												<td>
													290.50$ <span class="label label-danger label-mini">Overdue</span>	
												</td>
												<td><a href="#" class="btn btn-mini hidden-phone">View</a></td>
											</tr>
										</tbody>
									</table>
									<div class="space7"></div>
									<div class="clearfix">
										<a href="#" class="btn btn-mini pull-right">All Invoices</a>	
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
		jQuery(document).ready(function() {		
			// initiate layout and plugins
			App.setMainPage(true);
			App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>