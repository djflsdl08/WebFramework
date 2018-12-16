<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kim, Ye Jin</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>

<body class="w3-black" onload="document.f.username.focus()">

	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
	<!-- Avatar image in top left corner --> <a
		href="${pageContext.request.contextPath}/"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-home w3-xxlarge"></i>
		<p>HOME</p>
	</a>
	<c:choose> 
	<c:when test="${pageContext.request.userPrincipal.name == null}">
		<a href="${pageContext.request.contextPath}/login"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-user w3-xxlarge"></i>
			<p>LOGIN</p>
		</a>
	</c:when> 
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/login"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-user w3-xxlarge"></i>
			<p>LOGOUT</p>
		</a>
	</c:otherwise> </c:choose> <a href="${pageContext.request.contextPath}/showCourses"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-eye w3-xxlarge"></i>
		<p>VIEW</p>
	</a> <a href="${pageContext.request.contextPath}/enrollCourse"
		class="w3-bar-item w3-button w3-padding-large w3-black"> <i
		class="fa fa-envelope w3-xxlarge"></i>
		<p>ENROLL</p>
	</a> <a href="${pageContext.request.contextPath}/enrolledCourse"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-envelope w3-xxlarge"></i>
		<p>Enrolled Course</p>
	</a> </nav>

	<!-- Page Content -->
	<div class="w3-padding-large" id="main">
		<!-- Header/Home -->
		<header class="w3-container w3-padding-32 w3-center w3-black"
			id="home">
		<h1 class="w3-jumbo">
			<span class="w3-hide-small">Enroll</span> Page!
		</h1>
		<p>You can enroll a course of next semester ( 1 semester, 2019 )!</p>
		</header>

		<!-- About Section -->
		<div class="w3-content w3-justify w3-text-grey w3-padding-64"
			id="about">

			<sf:form method="post"
				action="${pageContext.request.contextPath}/doEnroll"
				modelAttribute="course">

				<table class="formtable">
					<tr>
						<td class="label">Year :</td>
						<td><sf:select class="control" path="year">
								<sf:option value="select">--select--</sf:option>
								<sf:option value="2019">2019</sf:option>
							</sf:select> <br /> <sf:errors path="year" class="error" /></td>
					</tr>
					<tr>
						<td class="label">Semester :</td>
						<td><sf:select class="control" path="semester">
								<sf:option value="select">--select--</sf:option>
								<sf:option value="1">1 semester</sf:option>
							</sf:select><br /> <sf:errors path="semester" class="error" /></td>
					</tr>
					<tr>
						<td class="label">Subject Cord :</td>
						<td><sf:input class="control" type="text" path="subjectCord" /><br />
							<sf:errors path="subjectCord" class="error" /></td>
					</tr>
					<tr>
						<td class="label">Course Title :</td>
						<td><sf:input class="control" type="text" path="courseTitle" /><br />
							<sf:errors path="courseTitle" class="error" /></td>
					</tr>
					<tr>
						<td class="label">Classify :</td>
						<td><sf:radiobutton class="control" path="classify"
								value="general" /> general <sf:radiobutton class="control"
								path="classify" value="basic_major" /> basic_major <sf:radiobutton
								class="control" path="classify" value="select_major" />
							select_major <br> <sf:radiobutton class="control"
								path="classify" value="mandatory_major" /> mandatory_major <sf:radiobutton
								class="control" path="classify" value="exchange_student" />
							exchange_student <sf:errors path="classify" class="error" /></td>
					</tr>
					<tr>
						<td class="label">Credit :</td>
						<td><sf:select class="control" path="credit">
								<sf:option value="select">--select--</sf:option>
								<sf:option value="1">1</sf:option>
								<sf:option value="2">2</sf:option>
								<sf:option value="3">3</sf:option>
							</sf:select><br /> <sf:errors path="credit" class="error" /></td>
					</tr>
					<tr>
						<td class="label"></td>
						<td><input class="control" type="submit"
							value="Enroll a new course" /></td>
					</tr>
				</table>
			</sf:form>
		</div>
	</div>
</body>
</html>