<%--
  Created by IntelliJ IDEA.
  User: Orkin_Prime
  Date: 2024/4/29
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/SysOfStu_war_exploded/ResetSubmitServlet" method="get" accept-charset="UTF-8">
    <input hidden="hidden" id="stu_id" name="stu_id" value="${stu_id}">
    <label>姓名:</label>
    <input type="text" id="stu_name" name="stu_name" value="${stu_name}">

    <label>学号:</label>
    <input type="text" id="stu_no" name="stu_no" value="${stu_no}">

    <label>班级:</label>
    <select name="className">
        <c:forEach items="${classnamelist}" var="className">
            <c:choose>
                <c:when test="${className eq class_name}">
                    <option value="${className}" selected>${className}</option>
                </c:when>
                <c:otherwise>
                    <option value="${className}">${className}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
    <input type="submit" value="提交修改" class="btn">
</form>
</body>
</html>
