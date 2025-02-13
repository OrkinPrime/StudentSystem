<%@ page import="java.util.List" %>
<%@ page import="stu.entity.Stu_Class" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>学生信息</title>
    <style>
        table {
            border-collapse: collapse;
            border-radius: 12px;
            margin: auto;
            width: 60%;
            box-shadow: 1px 3px 10px 8px darkgray;
        }

        table tr:last-child td:first-child {
            border-bottom-left-radius: 12px;
            border-bottom: none;
            border-left: none;
        }

        table tr:last-child td:last-child {
            border-bottom-right-radius: 12px;
            border-bottom: none;
            border-right: none;
        }

        table tr:first-child th:first-child {
            border-top-left-radius: 12px;
            border-left: none;
            border-top: none;
        }

        table tr:first-child th:last-child {
            border-top-right-radius: 12px;
            border-top: none;
            border-right: none;
        }

        th, td {
            /*border: 1px solid darkgray;*/
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #eae8e8;
        }

        tr:hover {
            background-color: lightgray;
        }

        h1 {
            margin: 30px;
            font-size: 40px;
        }

        .parent {
            padding-top: 30px;
            text-align: center;
            margin: auto;
        }

        .child {
            padding: 15px;
            font-size: 25px;
        }

        a {
            text-decoration: none;
        }

        a:link, a:visited, a:focus, a:active {
            color: dodgerblue;
        }

        a:hover {
            color: darkblue;
        }

        .child .search, .insert, .delete, .reset {
            color: dodgerblue;
            text-decoration: none;
            font-size: 20px;
            background-color: transparent;
            border: none;
            cursor: pointer;
            padding: inherit;
        }

        .child .search:hover, .insert:hover, .delete:hover, .reset:hover {
            color: darkblue;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px 20px 50px;
            border: 1px solid #888;
            width: 40%;
            height: auto;
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .formJ {
            width: 60%;
            height: 60%;
            display: flex;
            flex-direction: column;
        }

        form label {
            margin-top: 10px;
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
            box-shadow: 0 0 10px black;
        }
    </style>
    <script>
        function checkInput() {
            const requiredFields = ['stu_name_', 'stu_no_', 'class_name_'];
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
    <script>
        function showModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        function closeModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }

        function showModal2() {
            var modal = document.getElementById("myModal2");
            modal.style.display = "block";
        }

        function closeModal2() {
            var modal = document.getElementById("myModal2");
            modal.style.display = "none";
        }
    </script>
    <script>
        function loadClassList() {
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var response = JSON.parse(xhr.responseText);
                        updateClassList(response.classList);
                    } else {
                        alert('无法获取班级列表');
                    }
                }
            };
            xhr.open('GET', 'SelectAllClassName', true);
            xhr.setRequestHeader('Accept-Charset', 'utf-8');
            xhr.send();
        }

        function updateClassList(classList) {
            var select = document.getElementById('class_name');
            select.innerHTML = ''; // 清空现有选项
            var optionV = document.createElement('option');
            optionV.value = '';
            optionV.text = "未分配班级";
            select.appendChild(optionV);
            for (var i = 0; i < classList.length; i++) {
                var option = document.createElement('option');
                option.value = classList[i];
                option.text = classList[i];
                select.appendChild(option);
            }
            select = document.getElementById('class_name_');
            select.innerHTML = ''; // 清空现有选项
            var optionV = document.createElement('option');
            optionV.value = '';
            optionV.text = "未分配班级";
            select.appendChild(optionV);
            for (var i = 0; i < classList.length; i++) {
                var option = document.createElement('option');
                option.value = classList[i];
                option.text = classList[i];
                select.appendChild(option);
            }
        }

        window.onload = loadClassList;
    </script>
    <script>
        function deleteById(stuId) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "DeleteStuServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                }
            };
            var params = "stuId=" + stuId;
            xhr.send(params);
        }
    </script>
</head>
<body>
<%--页面显示主体--%>
<div class="parent">
    <h1>学生信息</h1>
    <div class="child">
        <div style="margin-block: auto 20px;">
            <button class="search" style="margin: auto" onclick="showModal()">查询</button>
            <button class="insert" style="margin: auto" onclick="showModal2()">增加学生</button>
        </div>
        <%
            List<Stu_Class> studentList = (List<Stu_Class>) (request.getAttribute("studentList"));
            if (studentList == null || studentList.isEmpty()) {
                out.println("<p style:'font-size:20px'>[查询结果为空]");
            } else {
        %>
        <table>
            <thead style="border: none">
            <tr style="background-color: #eae8e8;">
                <th>姓名</th>
                <th>学号</th>
                <th>班级</th>
                <th>院系</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Stu_Class student : studentList) {
                    String stu_id = student.getStu_id();
            %>
            <tr>
                <td><%=student.getStu_name()%>
                </td>
                <td><%=student.getStu_no()%>
                </td>
                <td><%=student.getClassInfo().getClass_name()%>
                </td>
                <td><%=student.getClassInfo().getDepartment()%>
                </td>
                <td style="text-align: center;padding: 5px">
                    <form style="display: inline;" action="/SysOfStu_war_exploded/ResetStuServlet" method="get"
                          accept-charset="UTF-8">
                        <input type="hidden" name="stu_id" value="<%=stu_id%>">
                        <input type="hidden" name="stu_name" value="<%=student.getStu_name()%>">
                        <input type="hidden" name="stu_no" value="<%=student.getStu_no()%>">
                        <input type="hidden" name="class_name" value="<%=student.getClassInfo().getClass_name()%>">
                        <button class="reset" type="submit">修改</button>
                    </form>
                    <form style="display: inline;" action="/SysOfStu_war_exploded/DeleteStuServlet" method="get"
                          accept-charset="UTF-8">
                        <input type="hidden" name="stu_id" value="<%=stu_id%>">
                        <button class="delete" type="submit">删除</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</div>
<%--查询弹窗--%>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2 style="margin: auto;text-align: center;padding: 20px">输入查询条件</h2>
        <section>
            <form class="formJ" id="searchForm" action="/SysOfStu_war_exploded/SearchStuServlet" method="get"
                  accept-charset="UTF-8">
                <label for="stu_id">ID:</label>
                <input type="text" id="stu_id" name="stu_id">

                <label for="stu_name">姓名:</label>
                <input type="text" id="stu_name" name="stu_name">

                <label for="stu_no">学号:</label>
                <input type="text" id="stu_no" name="stu_no">

                <label for="class_name">班级:</label>
                <select id="class_name" name="class_name">
                </select>

                <input type="submit" value="查询" class="btn" onclick="closeModal()">
            </form>
        </section>
    </div>
</div>
<%--插入弹窗--%>
<div id="myModal2" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal2()">&times;</span>
        <h2 style="margin: auto;text-align: center;padding: 20px">输入学生信息</h2>
        <section>
            <form class="formJ" id="insertForm" action="/SysOfStu_war_exploded/InsertOneServlet"
                  onsubmit="return checkInput()"
                  method="get" accept-charset="UTF-8">
                <label for="stu_name_">姓名:</label>
                <input type="text" id="stu_name_" name="stu_name">

                <label for="stu_no_">学号:</label>
                <input type="text" id="stu_no_" name="stu_no">

                <label for="class_name_">班级:</label>
                <select id="class_name_" name="class_name">
                </select>

                <input type="submit" value="插入" class="btn">
            </form>
        </section>
    </div>
</div>
</body>
</html>
