<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	</a> <c:choose>
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
		</c:otherwise>
	</c:choose> </a> <a href="${pageContext.request.contextPath}/showCourses"
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
			<span class="w3-hide-small">Successfully</span> Enrolled!
		</h1>
		<p>You successfully enrolled a course of next semester ( 1
			semester, 2019 )!</p>
		</header>

		<!-- About Section -->
		<div class="w3-content w3-justify w3-text-grey w3-padding-64"
			id="about">
			${course.courseTitle} is enrolled! </br>
		</div>
	</div>
</body>
</html>