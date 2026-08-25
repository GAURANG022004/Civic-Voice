<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Officer</title>
</head>
<body>
    <h2>Officer Registration</h2>
    <form action="OfficerLogin" method="post">
    <label>Contact ID:</label>
    <input type="text" name="contactId" required />

    <label>Password:</label>
    <input type="password" name="password" required />

    <input type="submit" value="Login" />
</form>

</body>
</html>

