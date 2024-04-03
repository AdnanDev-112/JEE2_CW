<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Lists</title>
</head>
<body>

	<h1>
		See the attendance corresponding to module
		<c:out value="${module}"></c:out>
		on week
		<c:out value="${week}"></c:out>
	</h1>
	<br />
	<br />
	<a href="index.html">MAIN</a>
	<br />
	<br />


	<form action="AttndceServlet?action=record-attendance" method="post">
		<table border="1">
			<tr>
				<td><label for="moduleId">Module : </label>
				<input
					id="moduleId" name="moduleId" type="text" readonly="readonly"
					value="${module}">
				</td>
			</tr>		
			<tr>
				<td><label for="week">week : </label> <input id="week"
					name="week" type="text" readonly="readonly" value="${week}">
				</td>
			</tr>
		</table>

		<c:forEach items="${students}" var="student" varStatus="counter">

			<table border="1">
				<tbody>
					<tr>
						<c:set var="studentAtt" value="attend-${student.id}"></c:set>
						<td width="5%">${student.id}</td>
						<td width="15 %">${student.mail}</td>
						<td width="50%">${student.name}</td>
						<td width="10%">  <input type="radio" id="aYES"
							name="${studentAtt}" value="YES"> <label for="aYES">YES</label>
							<input type="radio" id="aNO" name="${studentAtt}" value="NO"
							checked> <label for="aNO">NO</label>
						</td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
		<input type="submit" value="SAVE">
	</form>
	<br>
	<br>
</body>
</html>