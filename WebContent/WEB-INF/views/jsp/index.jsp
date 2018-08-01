<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>EPM</title>

        <!-- Bootstrap Core CSS -->
        <link href="resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="resources/css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="resources/css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="resources/css/startmin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="resources/css/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="#"><i class="fa fa-home fa-fw"></i> EPM TOOL</a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                    
                    <li class="dropdown">
                       <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                        	<br>
                            <li>
                                <a href="" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="newTask"><i class="fa fa-edit fa-fw"></i> New Task</a>
                            </li>
                            <li>
                                <a href="taskDetails"><i class="fa fa-edit fa-fw"></i> Task Details</a>
                            </li>
                           
                            <li>
                                <a href="#"><i class="fa fa-files-o fa-fw"></i> Contact Us</span></a>
                                <!-- /.nav-second-level -->
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Dashboard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${NewTask}</div>
                                        <div>New Tasks!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="taskDetails">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-cog fa-spin fa-5x fa-fw"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${InProgressTask}</div>
                                        <div>InProgress Tasks</div>
                                    </div>
                                </div>
                            </div>
                            <a href="taskDetails">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right" href="taskDetails"></i></span>

                                    <div class="clearfix"></div>
                                </div>
                            </a>
					</div>
                    
                    </div>
                    <div class="col-lg-3 col-md-6">
						<div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-tasks fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${ClosedTask}</div>
                                        <div>Closed Tasks</div>
                                    </div>
                                </div>
                            </div>
                            <a href="taskDetails">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right" href="taskDetails"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${TotalTask}</div>
                                        <div>Total Tasks</div>
                                    </div>
                                </div>
                            </div>
                            <a href="taskDetails">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right" href="taskDetails"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                TaskWise Total Work
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Total Tasks Per Day
                            </div>
                            <div class="panel-body">
                                <div id="morris-line-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Total Tasks Per Day
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Top 5 tasks Order by points earned
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>TaskName</th>
                                                <th>OwnerId</th>
                                                <th>GroupId</th>
                                                <th>Poitns</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${TopFiveTasks}" var="taskDetails">
                                       		 <tr class="warning">
                                                <td>${taskDetails.taskName}</td>
                                                <td>${taskDetails.ownerUserId}</td>
                                                <td>${taskDetails.ownerGroupId}</td>
                                                <td>${taskDetails.points}</td>
                                            </tr>
                                		</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="resources/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="resources/js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="resources/js/raphael.min.js"></script>
        <script src="resources/js/morris.min.js"></script>
        <script src="resources/js/morris-data.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="resources/js/startmin.js"></script>

    </body>
</html>
