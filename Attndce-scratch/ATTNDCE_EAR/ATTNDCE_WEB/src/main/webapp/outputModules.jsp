<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Module Lists</title>
<style>
    body {
        font-family: Arial, sans-serif;
        padding: 20px;
        background-color: #f0f0f0;
    }
    h1 {
        color: #333;
    }
    a {
        background-color: #007bff;
        color: #ffffff;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 5px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #007bff;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    input, select {
        width: 95%;
        padding: 5px;
        margin: 2px 0;
        box-sizing: border-box;
    }
    input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

    <h1>Please, select the module/week/student.</h1>
    <a href="index.html">MAIN</a>

<form action="AttndceServlet?action=module-attendance" method="post">
<table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>SHORT NAME</th>
                        <th>TITLE</th>
                        <th>WEEK</th>
                        <th>STUDENT</th>
                        <th>ACTION</th>
                    </tr>
                </thead>
                <tbody>
	
	
    <c:forEach items="${modules}" var="module" varStatus="counter">
        
                    <tr>
                        <td><input type="text" name="moduleId" readonly value="${module.moduleID}"></td>
                        <td><input type="text" name="moduleShortName" readonly value="${module.shortCode}"></td>
                        <td><input type="text" readonly value="${module.longName}"></td>
                        <td>
                            <select name="cbxWeek">
                                <option value="ALL">ALL</option>
                                <c:forEach begin="1" end="21" varStatus="loop">
                                    <option value="${loop.count}">${loop.count}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>
                            <select name="cbxStudent">
                                <option value="ALL">ALL</option>
                                <c:forEach items="${students}" var="student">
                                    <option value="${student.studentID}">${student.email}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td><input type="submit" value="VIEW ATTENDANCE"></td>
                    </tr>
                    </c:forEach>
                </tbody>
                
            </table>
       
               </form>

</body>
</html>
