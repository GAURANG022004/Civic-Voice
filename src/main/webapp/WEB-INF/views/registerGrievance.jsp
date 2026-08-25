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
    <title>Register Grievance</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #8e44ad, #3498db);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 600px;
            padding: 30px 35px;
            background: rgba(255, 255, 255, 0.15);
            border-radius: 16px;
            backdrop-filter: blur(12px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            color: #fff;
            animation: fadeIn 0.6s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to   { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
        }

        label {
            margin-top: 15px;
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        textarea, input[type="text"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: none;
            outline: none;
            margin-bottom: 15px;
            font-size: 15px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        textarea {
            resize: none;
            min-height: 120px;
        }

        button {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: 600;
            color: white;
            background: #00b894;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 12px rgba(0, 184, 148, 0.3);
        }

        button:hover {
            background-color: #019875;
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(0, 184, 148, 0.4);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            font-weight: 500;
            color: #ffffffcc;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📝 Register Your Grievance</h2>

    <form action="registerGrievance" method="post">
        <input type="hidden" name="citizenContactId" value="<%= citizen.getContactId() %>" />

        <label for="grievanceText">Grievance Details</label>
        <textarea id="grievanceText" name="grievanceText" placeholder="Describe your grievance in detail..." required></textarea>

        <button type="submit">📨 Submit Grievance</button>
    </form>

    <a class="back-link" href="citizenDashboard">← Back to Dashboard</a>
    <% System.out.println("JSP loaded successfully"); %>
</div>

</body>
</html>
