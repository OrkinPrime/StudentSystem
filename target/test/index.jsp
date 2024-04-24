<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>首页</title>
    <style>
        body{
            background-color: RGB(80,131,196);
        }
        div{
            padding-top: 30px;
            text-align: center;
            color: white;
            margin: initial;
        }
        h1{
            margin: 30px;
            font-size: 40px;
        }
        input{
            border-radius: 8px;
            border: none;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 20px;
            padding-right: 20px;
            font-size: 20px;
            color: white;
            margin: 30px;
            background-color: RGB(40,54,71);

            transition: background-color 0.3s;
        }
        input:hover{
            background-color: rgb(24, 34, 45);
            cursor: pointer;
        }
    </style>
</head>
<body>
<div>
    <h1>学生信息管理系统</h1>
    <form action="/SysOfStu_war_exploded/ShowAllStudentServlet">
        <input type="submit"  value="进入系统">
    </form>
</div>
</body>
</html>
