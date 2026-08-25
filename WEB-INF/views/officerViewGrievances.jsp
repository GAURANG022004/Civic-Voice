<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Officer Grievance List</title>

    <!-- Bootstrap & Modern Font -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #2c3e50, #3498db);
            color: #ffffff;
            padding: 40px 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            font-weight: 600;
            margin-bottom: 30px;
            color: #fff;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.3);
        }

        .table thead th {
            background-color: #1a252f;
            color: #0ff;
            font-weight: 500;
        }

        .table td, .table th {
            color: #f1f1f1;
            vertical-align: middle;
        }

        .btn {
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-sm {
            font-size: 14px;
            padding: 6px 14px;
            border-radius: 6px;
        }

        .btn-success {
            background: #2ecc71;
            color: white;
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.3);
        }

        .btn-success:hover {
            background: #27ae60;
        }

        .btn-danger {
            background: #e74c3c;
            color: white;
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.3);
        }

        .btn-danger:hover {
            background: #c0392b;
        }

        .btn-outline-danger {
            color: #e74c3c;
            border: 1px solid #e74c3c;
        }

        .btn-outline-danger:hover {
            background-color: #e74c3c;
            color: #fff;
        }

        .btn-secondary {
            background-color: #34495e;
            color: #0ff;
            box-shadow: 0 0 8px #0ff;
        }

        .btn-secondary:hover {
            background-color: #2c3e50;
            color: #fff;
        }

        .badge {
            padding: 5px 10px;
            font-size: 13px;
            border-radius: 20px;
        }

        .text-right {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 25px;
        }

        form {
            display: inline-block;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- 🔙 Back Button -->
    <div class="text-right">
        <a href="officerDashboard" class="btn btn-secondary">🔙 Back to Dashboard</a>
    </div>

    <h2>📋 Officer Grievance Dashboard</h2>

    <!-- ⚠ No Grievances -->
    <c:if test="${empty grievances}">
        <div class="alert alert-info text-center bg-light text-dark">No grievances found.</div>
    </c:if>

    <!-- ✅ Display Grievances -->
    <c:if test="${not empty grievances}">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Text</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="g" items="${grievances}">
                        <tr>
                            <td>${g.id}</td>
                            <td>${g.grievanceText}</td>
                            <td>${g.date}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${g.status == 'Pending'}">
                                        <span class="badge badge-warning">${g.status}</span>
                                    </c:when>
                                    <c:when test="${g.status == 'Approved'}">
                                        <span class="badge badge-success">${g.status}</span>
                                    </c:when>
                                    <c:when test="${g.status == 'Disapproved'}">
                                        <span class="badge badge-danger">${g.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${g.status}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${g.status == 'Pending'}">
                                    <form action="updateGrievanceStatus" method="post">
                                        <input type="hidden" name="id" value="${g.id}" />
                                        <button type="submit" name="status" value="Approved" class="btn btn-sm btn-success">✔ Approve</button>
                                        <button type="submit" name="status" value="Disapproved" class="btn btn-sm btn-danger">✖ Disapprove</button>
                                    </form>
                                </c:if>
                                <form action="deleteGrievance" method="post">
                                    <input type="hidden" name="id" value="${g.id}" />
                                    <button type="submit" class="btn btn-sm btn-outline-danger">🗑 Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

</body>
</html>
