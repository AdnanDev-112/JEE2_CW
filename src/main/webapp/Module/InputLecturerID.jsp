<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Module"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Input Lecturer ID</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f0f0f0;
}

.grid-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.main-container {
	border: 2px solid #007bff;
	padding: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: white;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	box-sizing: border-box;
	border: 2px solid #007bff;
	border-radius: 4px;
}

button {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	margin: 10px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%
	if (request.getParameter("lecturerID") != null) {
		response.sendRedirect("/AttendanceDAO/ModuleServlet?action=showAllModules&lecturerID=" + request.getParameter("lecturerID"));
	}
	%>
	<div class="grid-container">
		<div class="main-container">
			<h1>Please Input your Lecturer ID</h1>
			<form action="/AttendanceDAO/Module/InputLecturerID.jsp" method="GET">
				<input type="text" placeholder="Input your Lecturer ID" name="lecturerID" />
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>
