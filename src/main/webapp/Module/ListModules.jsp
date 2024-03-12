<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Module"%>
<%@ page import="model.Lecturer"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Module Selection</title>
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
	padding: 20px 70px;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	align-items: center;
}

.module-container {
	width: 100%; 
	max-width: 600px; 
	height: 300px;
	overflow-y: auto;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fafafa;
}

.module-row {
	padding: 10px;
	border-bottom: 1px solid #eee;
	cursor: pointer;
	transition: background-color 0.3s;
}

.module-row:hover, .module-row.selected {
	background-color: #e7f1ff;
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
}

button:hover {
	background-color: #0056b3;
}

h1, h2 {
	margin-bottom: 20px;
}
</style>
</head>

<body>

	<%
	if (request.getParameter("chosenModule") != null) {
		response.sendRedirect(
		"/AttendanceDAO/ModuleServlet?action=moduleSelected&chosenModule=" + request.getParameter("chosenModule"));
	}
	%>

	<%
	@SuppressWarnings("unchecked")
	List<Module> moduleList = (List<Module>) session.getAttribute("moduleList");
	Lecturer lecturer = (Lecturer) session.getAttribute("lecturer");
	%>
	<div class="grid-container">
		<div class="main-container">

			<span><a href="/AttendanceDAO/Module/InputLecturerID.jsp" class="" style="margin-right: 10px;text-decoration:none;"> <span class="">&larr;</span>
					Back
			</a>
			<h1 style="display: inline;">Welcome, ${lecturer.getName()}</h1></span>
			<h2>Select Your Module</h2>

			<form id="moduleForm" action="ListModules.jsp" method="GET">
				<div class="module-container">
					<c:forEach items="${moduleList}" var="module">
						<div id="module-${module.moduleID}" class="module-row"
							onclick="selectModule('${module.moduleID}')">
							<strong>${module.shortCode}</strong> - ${module.longName}
						</div>
					</c:forEach>
				</div>
				<input type="hidden" id="chosenModule" name="chosenModule">
				<br />
				<button type="button" onclick="submitForm()">Continue</button>
			</form>
		</div>
	</div>
	<script>
		var selectedModuleId = null;

		function selectModule(moduleId) {
			if (selectedModuleId !== null) {
				document.getElementById('module-' + selectedModuleId).classList
						.remove('selected');
			}
			selectedModuleId = moduleId;
			document.getElementById('module-' + moduleId).classList
					.add('selected');
			document.getElementById('chosenModule').value = selectedModuleId; // Update the hidden input whenever a module is selected
		}

		function submitForm() {
			if (selectedModuleId !== null) {
				document.getElementById('moduleForm').submit();
			}
		}
	</script>

</body>
</html>
