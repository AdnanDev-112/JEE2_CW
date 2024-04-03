<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>module Lists</title>
</head>
<body>

	<h1>See the attendance corresponding to module on week 1</h1>
	<br />
	<br />
<a href="index.html">MAIN</a>
	<br />
	<br />

	<c:forEach items="${modules}" var="module" varStatus="counter">
		<form action="AttndceServlet?" method="post">
			<table border="1">
				<!-- <thead>
					<tr>
						<td>ID</td>
						<td>MAIL</td>
						<td>NAME</td>
						<td>WEEK</td>
						<td>attendance</td>
						<td>ACTION</td>
					</tr>

				</thead> -->
				<tbody>
					<tr >
						<td width="5%">${module.id}</td>
						<td width="50 %">${module.shortname}</td>
						<td width="20%">${module.tittle}</td>
						<td>week 1</td>
						<td width="10%">
						  <input type="radio" id="html" name="attendance" checked value="YES">
						  <input type="radio" id="html" name="attendance" value="NO">
						</td>
						<td><input type="submit" value="ATTENDANCE"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</c:forEach>
	
</body>
</html>