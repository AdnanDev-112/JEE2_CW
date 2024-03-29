<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Success</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        height: 100vh; 
    }

    .message {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
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
</style>
</head>
<body>

<div class="centered-content">
    <div class="message">Registration Successful!</div>
    <button onclick="window.location.href='/AttendanceDAO';">HOME</button>
</div>

</body>
</html>
