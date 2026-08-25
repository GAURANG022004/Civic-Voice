<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Citizens</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">📋 Registered Citizens</h2>
    
    <c:if test="${empty citizens}">
        <div class="alert alert-info text-center">No citizens found.</div>
    </c:if>

    <c:if test="${not empty citizens}">
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Contact ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${citizens}">
                    <tr>
                        <td>${c.contactId}</td>
                        <td>${c.name}</td>
                        <td>${c.email}</td>
                        <td>${c.address}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
</body>
</html>
