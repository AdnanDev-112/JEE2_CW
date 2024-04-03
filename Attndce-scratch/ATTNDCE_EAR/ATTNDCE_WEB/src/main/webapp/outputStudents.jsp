<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Lists</title>
<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #333;
    }

    a {
        background-color: #007bff;
        color: white;
        padding: 10px 15px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    a:hover {
        background-color: #0056b3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed; /* Add this line to ensure fixed table layout */
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        word-wrap: break-word; /* Ensure content does not overflow */
    }

    th {
        background-color: #007bff;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    select, input[type="submit"] {
        width: 100%;
        padding: 8px;
        margin: 4px 0;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #28a745;
        color: white;
        border: none;
        cursor: pointer;
        border-radius: 5px;
    }

    input[type="submit"]:hover {
        background-color: #218838;
    }
</style>
</head>
<body>

<h1>Please, select the student/week/module.</h1>
<a href="index.html">MAIN</a>


<form action="AttndceServlet?" method="post">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>EMAIL</th>
                    <th>NAME</th>
                    <th>WEEK</th>
                    <th>MODULE</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <c:forEach items="${students}" var="student">
    
            <tbody>
                <tr>
                    <td>${student.studentID}</td>
                    <td>${student.email}</td>
                    <td>${student.name}</td>
                    <td>
                        <select name="cbxWeek">
                            <c:forEach begin="1" end="21" varStatus="loop">
                                <option value="${loop.count}">${loop.count}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <select name="cbxModule">
                            <option value="ALL">ALL</option>
                            <c:forEach items="${modules}" var="module">
                                <option value="${module.moduleID}">${module.shortCode}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="submit" value="ATTENDANCE"></td>
                </tr>
            </tbody>
            </c:forEach>
        </table>
    </form>


</body>
</html>
 
 