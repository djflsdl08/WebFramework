<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<title>Kim, Ye Jin</title>
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
				class="w3-bar-item w3-button w3-padding-large w3-black"> <i
				class="fa fa-user w3-xxlarge"></i>
				<p>LOGIN</p>
			</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/login"
				class="w3-bar-item w3-button w3-padding-large w3-black"> <i
				class="fa fa-user w3-xxlarge"></i>
				<p>LOGOUT</p>
			</a>
		</c:otherwise>
	</c:choose> <a href="${pageContext.request.contextPath}/showCourses"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-eye w3-xxlarge"></i>
		<p>VIEW</p>
	</a> <a href="${pageContext.request.contextPath}/enrollCourse"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-envelope w3-xxlarge"></i>
		<p>ENROLL</p>
	</a> <a href="${pageContext.request.contextPath}/enrolledCourse"
		class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
		class="fa fa-envelope w3-xxlarge"></i>
		<p>Enrolled Course</p>
	</a> </nav>

	<!-- Page Content -->
	<div class="w3-padding-large" id="main">

		<c:choose>
			<c:when test="${pageContext.request.userPrincipal.name == null}">
				<!-- login 된 사용자가 없으면! -->
				<!-- Header/Home -->
				<header class="w3-container w3-padding-32 w3-center w3-black"
					id="home">
				<h1 class="w3-jumbo">
					<span class="w3-hide-small">Login</span> Page!
				</h1>
				<p>Please enter your name and password!</p>
				</header>

				<!-- About Section -->
				<div class="w3-content w3-justify w3-text-grey w3-padding-64"
					id="about">
					<h2 class="w3-text-light-grey">Login</h2>
					<c:if test="${not empty logoutMsg}">
						<div style="color: #0000ff">
							<h3>${logoutMsg}</h3>
						</div>
					</c:if>
					<!-- <form name='f' action="/helloSpringMVC/login" method="post"> -->
					<form name='f' action="<c:url value="/login" />" method="post">

						<c:if test="${not empty errorMsg}">
							<div style="color: #ff0000">
								<h3>${errorMsg}</h3>
							</div>
						</c:if>

						<table>
							<tr>
								<td>Username :</td>
								<td><input type="text" name="username" /></td>
							</tr>
							<tr>
								<td>Password :</td>
								<td><input type="password" name="password" /></td>
							</tr>
							<tr>
								<td colspan="2"><input name="submit" type="submit"
									value="Login" /></td>
							</tr>
							<input name="${_csrf.parameterName}" type="hidden"
								value="${_csrf.token}" />
						</table>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<!-- login 된 사용자 있으면! -->
				<!-- Header/Home -->
				<header class="w3-container w3-padding-32 w3-center w3-black"
					id="home">
				<h1 class="w3-jumbo">
					<span class="w3-hide-small">Logout</span> Page!
				</h1>
				<p>If you want to logout, click the below Logout link!</p>
				</header>
				<div class="w3-content w3-justify w3-text-grey w3-padding-64"
					id="about">
					<h2 class="w3-text-light-grey">
						<a href="javascript:document.getElementById('logout').submit()">Logout</a>
					</h2>
				</div>
				<form id="logout" action="<c:url value="/logout" />" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</c:otherwise>
		</c:choose>


	</div>
</body>
</html>