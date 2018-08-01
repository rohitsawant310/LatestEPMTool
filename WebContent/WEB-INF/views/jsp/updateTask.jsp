<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="resources/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
</head>
<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

			<ul class="nav navbar-nav navbar-left navbar-top-links">
				<li><a href="#"><i class="fa fa-home fa-fw"></i> EPM TOOL</a></li>
			</ul>

			<ul class="nav navbar-right navbar-top-links">

				<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<br>
						<li><a href="home" class="active"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a></li>
						<li><a href="newTask"><i class="fa fa-edit fa-fw"></i>New
								Task</a></li>

						<li><a href="taskDetails"><i class="fa fa-edit fa-fw"></i>
								Task Details</a></li>

						<li><a href="#"><i class="fa fa-files-o fa-fw"></i>
								Contact Us</span></a></li>
					</ul>
				</div>
			</div>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-md-12">
					<h3 class="page-header" style="text-align: center;">Update TASK</h3>
				</div>
				<div class="row panel panel-info scheduler-border"
					style="margin-left: 0px; margin-right: 0px;" ng-show="show">
					<div>
						<h5 style="text-align: right;" class="text-danger">Fields
							Marked with * are mandatory.</h5>
						<form:form method="POST" modelAttribute="task" class="slide-animation">
							<legend class="scheduler-border text-danger">Task
								Details </legend>
							<div class="row col-md-12">
								<div class="col-md-3 text-left">
									<label style="font-size: 16px; margin-top: 5px;"
										class="text-primary">Task Type: </label>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
										<form:select path="taskType"  class="form-control">
					  						<form:options items="${taskType}" />
				       					</form:select>
				       					<form:input type="hidden" path="id" name="id" id="id"/>
								</div>

								<div class="col-md-3 text-left">
									<label style="font-size: 16px; margin-top: 5px;"
										data-toggle="tooltip" data-placement="bottom"
										data-original-title="Date when actual work on this task started.."
										class="text-primary">Start Date: 
								</div>
								<div class="form-group  form-inline col-md-3 pull-left">
									<form:input type="Date" path="taskStartDate"
										class="form-control ng-pristine ng-valid"
										placeholder="Task Start Date" id="taskStartDate"
										name="taskStartDate" style="width: 195px;" />
								</div>

								<div class="col-md-3 text-left">
									<label style="font-size: 16px; margin-top: 5px;"
										class="text-primary">Commit Date: </label>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
									<form:input type="Date"
										class="form-control ng-pristine ng-valid"
										path="taskCommitDate" id="taskCommitDate"
										name="taskCommitdate" placeholder="Task Commit Date"
										style="width: 195px;" />
								</div>

								<div class="col-md-3 text-left">
									<label style="font-size: 16px; margin-top: 5px;"
										class="text-primary">End Date: </label>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
									<form:input type="Date"
										class="form-control ng-pristine ng-valid"
										path="taskClosedDate" id="taskClosedDate"
										name="taskClosedDate" placeholder="Task End Date"
										style="width: 195px;" />
								</div>

								<div class="col-md-3 text-left">
									<label
										style="font-size: 16px; margin-top: 5px; text-decoration: underline; font-weight: 500"
										class="text-danger">Owner Id: </label> <span
										style="color: #FF0000; font-weight: 900"> *</span>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left ">
									<form:input type="text" placeholder="Enter OwnerId"
										path="ownerUserId" name="ownerUserId" id="ownerUserId"
										class="form-control" />
									<br>
								</div>

								<div class="col-md-3 text-left">
									<label
										style="font-size: 16px; margin-top: 5px; text-decoration: underline; font-weight: 500"
										class="text-danger">Owner Project</label><span
										style="color: #FF0000; font-weight: 900"> *</span>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
									<form:select path="ownerGroupId" class="form-control">
					  						<form:options items="${projectName}" />
				       					</form:select>
				       					    
									<br> <BR>
								</div>

								<div class="col-md-3 text-left">
									<label
										style="font-size: 16px; margin-top: 5px; text-decoration: underline; font-weight: 500"
										class="text-danger">Task Name: </label><span
										style="color: #FF0000; font-weight: 900"> *</span>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
									<form:input type="text" path="taskName" name="taskName"
										id="taskName" class="form-control pull-left"
										style="width: 195px;" placeholder="Enter Taskname" />
									<br> <BR>
								</div>

								<div class="col-md-3 text-left">
									<label
										style="font-size: 16px; margin-top: 5px; text-decoration: underline; font-weight: 500"
										class="text-danger">Task Status</label><span
										style="color: #FF0000; font-weight: 900"> *</span>
								</div>
								<div class="form-group  form-inline  col-md-3 pull-left">
									<form:select path="taskStatus"  class="form-control">
					  						<form:options items="${taskStatus}" />
				       					</form:select>
									<br> <BR>
								</div>

								<div class="col-md-3 text-left">
									<label
										style="font-size: 16px; margin-top: 5px; text-decoration: underline; font-weight: 500"
										class="text-danger"">Task Description: </label><span
										style="color: #FF0000; font-weight: 900"> *</span>
								</div>
								<div class="col-md-9 pull-left">
									<form:textarea class="form-control" path="taskDescription"
										name="taskDescription" rows="3" ng-required="true"
										placeholder="Enter Description...." id="taskDescription" />
									<br> <BR>
								</div>
								<div class="row" style="text-align: center;">
									<div class="form-group  form-inline col-md-12 pull-center">
										<input type="submit" class="btn btn-success pull-center"></input>
										<input type="reset" class="btn btn-info pull-center"></input>
									</div>
								</div>
							</div>
					</div>
				</div>
				</form:form>
			</div>
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
