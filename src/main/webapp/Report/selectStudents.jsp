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
<title>Student Selection</title>
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

.student-container {
    width: 100%; 
    max-width: 600px; 
    height: 300px;
    overflow-y: auto;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fafafa;
}

.student-row {
    padding: 10px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
    transition: background-color 0.3s;
}

.student-row:hover, .student-row.selected {
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
    @SuppressWarnings("unchecked")
    List<Student> reportStudentList = (List<Student>) session.getAttribute("reportStudentList");
    Integer reportModuleID = (Integer) session.getAttribute("reportModuleID"); 
    %>

    <%
    if (request.getParameter("selectedStudentId") != null) {
        response.sendRedirect(
        "/AttendanceDAO/ReportsServlet?action=showReport&studentID=" + request.getParameter("selectedStudentId")+"&reportModuleID=" + reportModuleID);
    }
    %>
    

    
    <div class="grid-container">
        <div class="main-container">

            <span><a href="/AttendanceDAO" class="" style="margin-right: 10px;text-decoration:none;"> <span class="">&larr;</span>
                    Back
            </a>
            <h1 style="display: inline;">Welcome</h1></span>
            <h2>Select The Student</h2>

            <form id="studentForm" action="selectStudents.jsp" method="GET">
            <input type="hidden" name="reportModuleID" value="<%= reportModuleID %>">
                <div class="student-container">
                    <c:forEach items="${reportStudentList}" var="student">
                        <div id="student-${student.studentID}" class="student-row"
                            onclick="selectStudent('${student.studentID}')">
                            <strong>${student.name}</strong> - ${student.email}
                        </div>
                    </c:forEach>
                </div>
                <input type="hidden" id="selectedStudentId" name="selectedStudentId">
                <br />
                <button type="button" onclick="submitForm()">Continue</button>
            </form>
        </div>
    </div>
    <script>
        var selectedStudentId = null;

        function selectStudent(studentId) {
            if (selectedStudentId !== null) {
                document.getElementById('student-' + selectedStudentId).classList
                        .remove('selected');
            }
            selectedStudentId = studentId;
            document.getElementById('student-' + studentId).classList
                    .add('selected');
            document.getElementById('selectedStudentId').value = selectedStudentId; // Update the hidden input whenever a student is selected
        }

        function submitForm() {
            if (selectedStudentId !== null) {
                document.getElementById('studentForm').submit();
            }
        }
    </script>

</body>
</html>
