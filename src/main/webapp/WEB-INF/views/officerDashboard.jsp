<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.civicvoice.model.Officer" %>
<%
    Officer officer = (Officer) session.getAttribute("officer");
    if (officer == null) {
        response.sendRedirect("officerLogin");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Officer Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #2C3E50, #3498DB);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(14px);
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            padding: 40px 30px;
            max-width: 500px;
            width: 90%;
            color: white;
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to   { opacity: 1; transform: scale(1); }
        }

        h1 {
            margin-bottom: 10px;
            font-weight: 600;
        }

        .info {
            text-align: left;
            margin-top: 25px;
            margin-bottom: 30px;
        }

        .info p {
            font-size: 16px;
            margin: 12px 0;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            padding-bottom: 6px;
        }

        .btn {
            background-color: #00cec9;
            color: white;
            padding: 14px 22px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            box-shadow: 0 5px 14px rgba(0, 206, 201, 0.3);
            transition: all 0.3s ease;
        }

        .btn:hover {
            background-color: #01a3a4;
            transform: translateY(-2px);
            box-shadow: 0 8px 18px rgba(0, 206, 201, 0.4);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>👮‍♂️ Welcome Officer</h1>

        <div class="info">
            <p><strong>Name:</strong> <%= officer.getName() %></p>
            <p><strong>Department:</strong> <%= officer.getDepartment() %></p>
            <p><strong>Contact:</strong> <%= officer.getContact() %></p>
            <p><strong>Email:</strong> <%= officer.getEmail() %></p>
        </div>

        <a class="btn" href="officerViewGrievances">📂 View Grievances</a>
    </div>
</body>
</html>
