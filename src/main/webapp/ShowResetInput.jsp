<%--
  Created by IntelliJ IDEA.
  User: Orkin_Prime
  Date: 2024/4/29
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改学生信息</title>
<style>
    div{
        text-align: center;
        margin: auto;
        padding: 30px;
    }
    h1{
        margin: 30px;
        font-size: 40px;
    }
    form{
        font-size: 18px;
        display: flex;
        flex-direction: column;
    }

    form .btn {
        margin-top: 10px;
        cursor: pointer;
        width: auto;
    }
    section {
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 8px;
        width: 50%;
        height: auto;
        margin: auto;
        box-shadow: 1px 3px 10px 8px darkgray;
    }
    label{
        margin-inline-end:auto;
    }
    input,option,select{
        font-size: 15px;
    }
    label{
        margin-top: 10px;
    }
</style>
    <script>
        function checkInput() {
            const requiredFields = ['stu_name', 'stu_no', 'class_name'];
            let isAllFilled = true;
            for (let i = 0; i < requiredFields.length; i++) {
                var fieldId = requiredFields[i];
                var field = document.getElementById(fieldId);
                if (field.tagName.toLowerCase() === 'input') {
                    if (field.value.trim() === "") {
                        isAllFilled = false;
                        alert("请填写完整的学生信息！");
                        break;
                    }
                } else if (field.tagName.toLowerCase() === 'select') {
                    if (field.value === "") {
                        isAllFilled = false;
                        alert("请填写完整的学生信息！");
                        break;
                    }
                }
            }
            return isAllFilled;
        }

    </script>
</head>
<body>
<div>
<h1>修改学生信息</h1>
<section>
<form action="/SysOfStu_war_exploded/ResetSubmitServlet" onsubmit="return checkInput()" method="get" accept-charset="UTF-8">
    <label for="stu_id"></label><input hidden="hidden" id="stu_id" name="stu_id" value="${stu_id}">
    <label for="stu_name">姓名:</label>
    <input type="text" id="stu_name" name="stu_name" value="${stu_name}">

    <label for="stu_no">学号:</label>
    <input type="text" id="stu_no" name="stu_no" value="${stu_no}">

    <label for="class_name">班级:</label>
    <select name="class_name" id="class_name">
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
</form></section>
</div>
</body>
</html>
