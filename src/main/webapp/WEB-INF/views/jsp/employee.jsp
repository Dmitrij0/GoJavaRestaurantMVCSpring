<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee</title>
</head>
<body>
<table>
    <tr style="align-items: center">
        <th>empLastName</th>
        <th>empFirstName</th>
        <th>empBirthday</th>
        <th>empPhone</th>
        <th>positions</th>
    </tr>
    <tr>
        <td>${employee.empLastName}</td>
        <td>${employee.empFirstName}</td>
        <td>${employee.empBirthday}</td>
        <td>${employee.empPhone}</td>
        <td>${employee.positions}</td>
    </tr>
</table>
</body>
</html>
