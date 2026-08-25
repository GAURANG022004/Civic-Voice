<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.civicvoice.model.Citizen" %>
<%
    Citizen citizen = (Citizen) session.getAttribute("citizen");
    if (citizen == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Citizen Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #8e44ad, #3498db);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dashboard {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 30px 40px;
            width: 480px;
            backdrop-filter: blur(15px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            color: #fff;
            animation: slideUp 0.7s ease-in-out;
        }

        @keyframes slideUp {
            0% { transform: translateY(40px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        .dashboard h2 {
            margin-top: 0;
            margin-bottom: 15px;
            font-size: 26px;
            font-weight: 600;
        }

        p {
            margin: 10px 0;
        }

        strong {
            color: #f0eaea;
        }

        .logout-btn {
            float: right;
            background: #ff4d4d;
            color: white;
            padding: 8px 18px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            box-shadow: 0 4px 8px rgba(255, 77, 77, 0.3);
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            background-color: #e84141;
            box-shadow: 0 6px 12px rgba(255, 77, 77, 0.5);
        }

        ul {
            list-style: none;
            padding-left: 0;
            margin-top: 25px;
        }

        li a {
            display: block;
            margin-bottom: 15px;
            padding: 12px;
            background: #ffffff20;
            border: 1px solid #ffffff30;
            color: #fff;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 5px 10px rgba(255, 255, 255, 0.05);
        }

        li a:hover {
            transform: scale(1.03);
            background-color: #ffffff30;
            box-shadow: 0 8px 16px rgba(255, 255, 255, 0.1);
        }

        hr {
            border: 0;
            height: 1px;
            background-color: #ffffff30;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<div class="dashboard">
    <a class="logout-btn" href="logout">Logout</a>
    <h2>Welcome, <%= citizen.getName() %> 👋</h2>

    <p><strong>Contact ID:</strong> <%= citizen.getContactId() %></p>
    <p><strong>Email:</strong> <%= citizen.getEmail() %></p>
    <p><strong>Address:</strong> <%= citizen.getAddress() %></p>

    <hr/>

    <h3 style="color: #eee;">Your Options</h3>
    <ul>
        <li><a href="registerGrievance">📨 Register Complaint</a></li>
        <li><a href="myGrievances">📋 View Complaint Status</a></li>
        <li><a href="#">⚙️ Update Profile</a></li>
    </ul>
</div>

</body>
</html>
