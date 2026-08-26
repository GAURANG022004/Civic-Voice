<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Officer</title>
</head>
<body>
    <h2>Officer Registration</h2>
    <form action="registerOfficer" method="post">
    <label>Name:</label>
    <input type="text" name="name" required />

    <label>Contact ID:</label>
    <input type="text" name="contactId" required />

    <label>Department:</label>
    <input type="text" name="department" required />

    <label>Email:</label>
    <input type="email" name="email" required />

    <label>Password:</label>
    <input type="password" name="password" required />

    <input type="submit" value="Register" />
</form>

</body>
</html>

