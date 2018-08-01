<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<title>User Registration Form</title>
	<link type="text/css" href="resources/css/bootstrap.css" rel="stylesheet"></link>
	<link type="text/css" href="resources/css/app.css" rel="stylesheet"></link>
</head>

<body>

 <div class="container">
            <div class="row">
            <br><br>
                <div class="col-md-12 col-md-offset-3">
 	<div class="form-container">
 	
 	<h1 align="center">Create New Account!</h1>
 	
	<form:form method="POST" modelAttribute="user" class="form-horizontal">

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="firstName">First Name</label>
				<div class="col-md-7">
					<form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="firstName" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="lastName">Last Name</label>
				<div class="col-md-7">
					<form:input type="text" path="lastName" id="lastName" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="lastName" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="userId">User ID</label>
				<div class="col-md-7">
					<form:input type="text" path="userId" id="userId" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="userId" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="password">Password</label>
				<div class="col-md-7">
					<form:input type="password" path="password" id="password" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="password" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="emailId">Email</label>
				<div class="col-md-7">
					<form:input type="text" path="emailId" id="emailId" class="form-control input-sm"/>
					<div class="has-error">
						<form:errors path="emailId" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="userGroup">Role</label>
				<div class="col-md-7">
					<form:select path="designation"  class="form-control">
					  	<form:option value="Admin">Admin</form:option>
					  	<form:option value="Developer">Developer</form:option>
						<form:option value="Student">Student</form:option>
					</form:select>
					<div class="has-error">
						<form:errors path="emailId" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="form-group col-md-12">
				<label class="col-md-3 control-lable" for="userGroup">UserGroup</label>
				<div class="col-md-7">
					<form:select path="userGroup"  class="form-control">
					  	<form:option value="DAC">DAC</form:option>
					  	<form:option value="DMC">DMC</form:option>
						<form:option value="DGI">DGI</form:option>
					</form:select>
					<div class="has-error">
						<form:errors path="emailId" class="help-inline"/>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="form-group col-md-12">
			<div class="col-md-3">
			</div>
			<div class="col-md-7">
				<input type="submit" value="Register" class="btn btn-primary btn-sm"> or
				<a href="<c:url value='/' />">Cancel</a>
			</div>
			</div>
		</div>
	</form:form>
	</div>
	</div>
	</div>
	</div>
</body>
</html>