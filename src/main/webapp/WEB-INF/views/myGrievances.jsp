<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Grievances</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 30px;
        }
        .container {
            background: white;
            padding: 20px;
            max-width: 800px;
            margin: auto;
            border-radius: 10px;
            box-shadow: 0 0 10px #ccc;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .status {
            font-weight: bold;
        }
        .Pending { color: orange; }
        .Approved { color: green; }
        .Disapproved { color: red; }
    </style>
</head>
<body>
<div class="container">
    <h2>My Reported Grievances</h2>

    <c:if test="${not empty grievances}">
        <table>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
            <c:forEach var="g" items="${grievances}">
                <tr>
                    <td>${g.id}</td>
                    <td>${g.grievanceText}</td>
                    <td>${g.date}</td>
                    <td class="status ${g.status}">${g.status}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty grievances}">
        <p style="text-align:center; color: #777;">You haven't submitted any grievances yet.</p>
    </c:if>

    <div style="text-align: center;">
        <a class="btn" href="citizenDashboard">Back to Dashboard</a>
    </div>
</div>
</body>
</html>
