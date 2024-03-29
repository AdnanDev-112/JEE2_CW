<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Student"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List All Students</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

td, th {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>

    <% 
    @SuppressWarnings("unchecked")
    List<Student> studentList = (List<Student>) session.getAttribute("studentList");
    Integer chosenModule = (Integer) session.getAttribute("moduleID"); 
    Integer scheduleID = (Integer) session.getAttribute("scheduleID"); 
    %>

<form action="/AttendanceDAO/RegisterAttendanceServlet" method="GET">
<input type="hidden" name="chosenModule" value="<%= chosenModule %>">
<input type="hidden" name="scheduleID" value="<%= scheduleID %>">
    <h1>Listing Students Enrolled in the Module</h1>
    <table>
        <tr>
            <th>Student ID</th>
            <th>Email</th>
            <th>Name</th>
            <th>Attendance</th>
        </tr>

        <c:forEach items="${studentList}" var="student">
            <tr>
                <td>${student.studentID}</td>
                <td>${student.email}</td>
                <td>${student.name}</td>
                <td><input type="checkbox" name="selectedStudents" value="${student.studentID}"></td>
            </tr>
        </c:forEach>
    </table>
    <input type="submit" name="action" value="registerStudentsAttendance">
    <hr>
</form>

</body>
</html>
  --%>
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Student"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List All Students</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

.centered-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 80vh; /* Ensure it's at least 80% of the viewport height */
}

.table-container {
    width: 80%; /* Adjust width as needed */
    overflow-x: auto; /* Allows table to be scrollable horizontally if needed */
    margin: 0 auto; /* Centers the container */
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 100%; /* Adjust width as needed */
    margin: 0 auto; /* Centers the table */
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center; /* Center-align the text in th and td */
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

button {
    display: block; /* Makes the button centered below the table */
    margin: 20px auto; /* Centers the button horizontally */
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
    font-size: 16px; /* Optional: Adjusts the font size */
}

button:hover {
    background-color: #0056b3;
}
</style>
</head>
<body>

<% 
@SuppressWarnings("unchecked")
List<Student> studentList = (List<Student>) session.getAttribute("studentList");
Integer chosenModule = (Integer) session.getAttribute("moduleID"); 
Integer scheduleID = (Integer) session.getAttribute("scheduleID"); 
%>

<div class="centered-container">
    <form action="/AttendanceDAO/RegisterAttendanceServlet" method="GET">
        <input type="hidden" name="chosenModule" value="<%= chosenModule %>">
        <input type="hidden" name="scheduleID" value="<%= scheduleID %>">
        <h1>Listing Students Enrolled in the Module</h1>
        <div class="table-container">
            <table>
                <tr>
                    <th>Student ID</th>
                    <th>Email</th>
                    <th>Name</th>
                    <th>Attendance</th>
                </tr>
                <c:forEach items="${studentList}" var="student">
                    <tr>
                        <td>${student.studentID}</td>
                        <td>${student.email}</td>
                        <td>${student.name}</td>
                        <td><input type="checkbox" name="selectedStudents" value="${student.studentID}"></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <button type="submit" name="action" value="registerStudentsAttendance">Mark Attendance</button>
    </form>
</div>

</body>
</html>
  
  