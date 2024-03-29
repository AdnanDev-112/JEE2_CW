<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Attendance"%> 

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
    min-height: 80vh;  
}

.table-container {
    width: 100%; 
    overflow-x: auto; 
    margin: 0 auto;  
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

table {
    border-collapse: collapse;
    width: 100%;  
    margin: 0 auto;  
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center; 
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

button {
    display: block; 
    margin: 20px auto; 
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

</style>
</head>
<body>

<% 
@SuppressWarnings("unchecked")
List<Attendance> attendanceList = (List<Attendance>) session.getAttribute("attendanceList");
%>



<div class="centered-container">
    <form action="#" method="GET">
        <h1>Student Report</h1>
        
        <h3>${attendanceList.get(0).student.name} </h3>
        <div class="table-container">
            <table>
                <tr>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Attendance</th>
                </tr>
                <c:forEach items="${attendanceList}" var="attendance">
                    <tr>
                        <td>${attendance.schedule.scheduleDate}</td>
                        <td>${attendance.schedule.scheduleTime}</td>
                        <td>
                        <c:choose>
                <c:when test="${attendance.attended == 1}">
                    &#10004; 
                </c:when>
                <c:otherwise>
                    &#10008; 
                </c:otherwise>
            </c:choose>
                        
                        
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <button onclick="window.location.href='/AttendanceDAO';">HOME</button>
    </form>
</div>

</body>
</html>
  
  