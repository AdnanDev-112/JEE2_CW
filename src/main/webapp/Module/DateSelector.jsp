<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Module"%>
<%@ page import="model.Schedule"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Date</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
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
	padding: 20px;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	width: auto;
	max-width: 800px;
}

.schedule-container {
	width: 100%;
	max-width: 600px;
	height: 300px;
	overflow-y: auto;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fafafa;
	margin-top: 20px;
}

.checklist-item {
	display: flex;
	align-items: center;
	padding: 10px;
	border-bottom: 1px solid #eee;
}

.checklist-item label {
	margin-left: 10px;
	cursor: pointer;
}

input[type="radio"] {
	cursor: pointer;
}

button {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-size: 16px;
	margin-top: 20px;
}

button:hover {
	background-color: #0056b3;
}

h1, h2, em {
	margin-bottom: 20px;
}

</style>
</head>
<body>
	<%
	@SuppressWarnings("unchecked")
	List<Schedule> scheduleList = (List<Schedule>) session.getAttribute("scheduleList");
	Module moduleData = (Module) session.getAttribute("moduleData");
	%>
	<div class="grid-container">
		<div class="main-container">
		<span><a href="/AttendanceDAO/Module/ListModules.jsp" class="" style="margin-right: 10px;text-decoration:none;"> <span class="">&larr;</span>
					Back
			</a>
			<h1 style="display: block;">Module: [${moduleData.shortCode}] ${moduleData.longName}</h1></span>
			<%-- <h1>Module: [${moduleData.shortCode}] ${moduleData.longName}</h1> --%>
			<h2>Please Select The Activity</h2>
			<em>Total Schedules this week: ${fn:length(scheduleList)}</em>

			<form id="attendanceDate" action="DateSelector.jsp" method="GET">
				<div class="schedule-container">
					<c:forEach items="${scheduleList}" var="schedule">
						<div class="checklist-item">
							<input type="radio" id="${schedule.scheduleID}" name="checklist" value="${schedule.scheduleID}"> 
							<label for="${schedule.scheduleID}">${schedule.scheduleDate} ${schedule.scheduleTime}</label>
						</div>
					</c:forEach>
				</div>
				<button type="submit">Continue</button>
			</form>
		</div>
	</div>
</body>
</html>
