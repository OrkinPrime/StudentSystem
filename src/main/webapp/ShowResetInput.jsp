<%--
  Created by IntelliJ IDEA.
  User: Orkin_Prime
  Date: 2024/4/29
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/SysOfStu_war_exploded/ResetSubmitServlet" method="get" accept-charset="UTF-8">
    <label>姓名:</label>
    <input type="text" id="stu_name" name="stu_name">

    <label>学号:</label>
    <input type="text" id="stu_no" name="stu_no">

    <label>班级:</label>
    <select id="class_name" name="class_name">
    </select>
<%--
在使用Servlet转发信息到JSP页面并生成select选项时，可以按照以下步骤进行：
    在Servlet中设置要传递的数据：在Servlet中创建一个HttpServletRequest对象，并将要传递的数据存储在其中，可以使用setAttribute()方法将数据存储在request对象中。
    request.setAttribute("options", yourDataList);

    使用RequestDispatcher进行转发：使用RequestDispatcher将请求转发到目标JSP页面。
    RequestDispatcher dispatcher = request.getRequestDispatcher("yourPage.jsp");
    dispatcher.forward(request, response);

    在JSP页面中获取数据并生成select选项：在JSP页面中使用EL表达式（Expression Language）来获取Servlet中传递的数据，并使用该数据生成select选项。
    <select>
        <c:forEach var="option" items="${options}">
            <option value="${option.value}">${option.label}</option>
        </c:forEach>
    </select>
    在这个示例中，${options} 是在Servlet中设置的属性名称，${option.value} 和 ${option.label} 是从数据对象中获取每个选项的值和标签。

    确保在JSP页面的顶部导入JSTL标签库：
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    这样就可以在JSP页面中根据Servlet转发的信息生成select选项了。--%>
    <input type="submit" value="完成" class="btn">
</form>
</body>
</html>
