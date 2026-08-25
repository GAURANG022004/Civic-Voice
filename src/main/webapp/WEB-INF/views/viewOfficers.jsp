<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Officer Management | CivicVoice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        :root {
            --primary: #6C5CE7;
            --secondary: #A29BFE;
            --accent: #FD79A8;
            --dark: #2D3436;
            --light: #F5F6FA;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .header {
            background: linear-gradient(90deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 15px 0;
            margin-bottom: 30px;
            border-radius: 5px;
            box-shadow: 0 4px 12px rgba(108, 92, 231, 0.2);
        }
        .action-btns .btn {
            margin-right: 8px;
            margin-bottom: 8px;
        }
        .table-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.08);
            padding: 20px;
        }
        .table thead th {
            background-color: var(--dark);
            color: white;
            border-color: var(--dark);
        }
        .table-hover tbody tr:hover {
            background-color: rgba(108, 92, 231, 0.05);
        }
        .badge-department {
            background-color: var(--accent);
            color: white;
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 20px;
        }
        .empty-state {
            padding: 40px;
            text-align: center;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        }
        .empty-state i {
            font-size: 50px;
            color: var(--secondary);
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header text-center">
        <h3><i class="fas fa-user-tie mr-2"></i> Officer Management</h3>
        <p class="mb-0">View and manage all registered officers</p>
    </div>

    <div class="action-btns mb-4">
        <a href="addOfficer" class="btn btn-primary">
            <i class="fas fa-user-plus mr-2"></i>Add New Officer
        </a>
        <a href="admindashboard" class="btn btn-secondary">
            <i class="fas fa-arrow-left mr-2"></i>Back to Dashboard
        </a>
    </div>

    <div class="table-container">
        <c:if test="${empty officers}">
            <div class="empty-state">
                <i class="fas fa-user-slash"></i>
                <h4>No Officers Found</h4>
                <p class="text-muted">There are currently no officers registered in the system.</p>
                <a href="addOfficer" class="btn btn-primary mt-3">
                    <i class="fas fa-user-plus mr-2"></i>Add First Officer
                </a>
            </div>
        </c:if>

        <c:if test="${not empty officers}">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="thead-dark">
                        <tr>
                            <th>Contact ID</th>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Contact</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="o" items="${officers}">
                            <tr>
                                <td>${o.contactId}</td>
                                <td>${o.name}</td>
                                <td><span class="badge-department">${o.department}</span></td>
                                <td>${o.contact}</td>
                                <td>${o.email}</td>
                                <td>
                                    <a href="editOfficer?id=${o.contactId}" class="btn btn-sm btn-outline-primary" title="Edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="deleteOfficer?id=${o.contactId}" class="btn btn-sm btn-outline-danger" title="Delete"
                                       onclick="return confirm('Are you sure you want to delete this officer?')">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
