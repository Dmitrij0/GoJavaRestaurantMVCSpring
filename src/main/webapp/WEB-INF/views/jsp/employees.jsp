<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employees</title>
</head>
<body>
<table>
    <tr style="align-items: center">
        <th>empLastName</th>
        <th>empFirstName</th>
    </tr>
    <%--@elvariable id="employees" type="java.util.List"--%>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td><a href="${pageContext.request.contextPath}/employee?empId=${employee.empId}">${employee.empLastName}</a></td>
            <td>${employee.empFirstName}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
