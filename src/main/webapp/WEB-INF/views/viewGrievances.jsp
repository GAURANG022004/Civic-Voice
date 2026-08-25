
<!-- rest of your JSP remains the same -->
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
	margin: 20px;
	background-color: #f5f5f5;
}

.container {
	max-width: 1000px;
	margin: 0 auto;
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

tr:hover {
	background-color: #f5f5f5;
}

.status-pending {
	color: #FFA500;
	font-weight: bold;
}

.status-resolved {
	color: #4CAF50;
	font-weight: bold;
}

.no-grievances {
	text-align: center;
	padding: 20px;
	color: #666;
}

.action-buttons {
	margin-top: 20px;
	text-align: center;
}

.btn {
	padding: 10px 15px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

.btn:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div class="container">
		<h1>My Reported Grievances</h1>

		<c:if test="${not empty grievances}">
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Grievance Details</th>
						<th>Date Reported</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grievances}" var="grievance">
						<tr>
							<td>${grievance.id}</td>
							<td>${grievance.grievanceText}</td>
							<td>${grievance.date}</td>
							<td>${grievance.status}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</c:if>

		<c:if test="${empty grievances}">
			<div class="no-grievances">
				<p>You haven't reported any grievances yet.</p>
			</div>
		</c:if>

		<div class="action-buttons">
			<a href="registerGrievance" class="btn">Report New Grievance</a> <a
				href="citizenDashboard" class="btn">Back to Dashboard</a>
		</div>
	</div>
</body>
</html>