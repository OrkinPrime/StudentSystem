<%@ page import="java.util.List" %>
<%@ page import="stu.entity.Stu_Class" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>学生信息</title>
    <style>
        table {
            border-collapse: collapse;
            margin: auto;
            width: 60%;
        }

        th, td {
            border: 1px solid darkgray;
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
            padding: 20px;
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

        form {
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
            var requiredFields = ['stu_name_', 'stu_no_', 'class_name_'];
            var isAllFilled = true;
            for (var i = 0; i < requiredFields.length; i++) {
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
        function showModal3() {
            var modal = document.getElementById("myModal3");
            modal.style.display = "block";
        }

        function closeModal3() {
            var modal = document.getElementById("myModal3");
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
            var select = document.getElementById('class_name_');
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
            var select = document.getElementById('class_name__');
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
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                }
            };
            var params = "stuId=" + stuId;
            xhr.send(params);
        }
    </script>
</head>
<body>
<div class="parent">
    <h1>学生信息</h1>
    <div class="child">
        <button class="search" onclick="showModal()">查询</button>
        <button class="insert" onclick="showModal2()">增加学生</button>
        <table>
            <thead>
            <tr>
                <th>姓名</th>
                <th>学号</th>
                <th>班级</th>
                <th>院系</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Stu_Class> studentList = (List<Stu_Class>) (request.getAttribute("studentList"));
                if (studentList == null || studentList.isEmpty()) {
                    out.println("查询结果为空。");
                } else {
                    for (Stu_Class student : studentList) {
                       String stu_id= student.getStu_id();
                       String stu_name= student.getStu_name();
                       String stu_no= student.getStu_no();
                       String class_name= student.getClassInfo().getClass_name();
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
                <td>
                    <button class="reset" onclick="setValues(<%=stu_id%>,<%=stu_name%>,<%=stu_no%>,<%=class_name%>)">修改</button>
                    <button class="delete" onclick="deleteById(<%=stu_id%>)">删除</button>
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
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>输入查询条件</h2>
        <section>
            <form id="searchForm" action="/SysOfStu_war_exploded/SearchStuServlet" method="get" accept-charset="UTF-8">
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
<div id="myModal2" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal2()">&times;</span>
        <h2>输入学生信息</h2>
        <section>
            <form id="insertForm" action="/SysOfStu_war_exploded/InsertOneServlet" onsubmit="return checkInput()"
                  method="get" accept-charset="UTF-8">
                <label for="stu_name">姓名:</label>
                <input type="text" id="stu_name_" name="stu_name">

                <label for="stu_no">学号:</label>
                <input type="text" id="stu_no_" name="stu_no">

                <label for="class_name_">班级:</label>
                <select id="class_name_" name="class_name">
                </select>

                <input type="submit" value="完成" class="btn">
            </form>
        </section>
    </div>
</div>
<div id="myModal3" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal2()">&times;</span>
        <h2>修改学生信息</h2>
        <section>
            <script>
               function setValues(stu_id,stu_name,stu_no,class_name){
                   reset_stu_id=stu_id;
                   reset_stu_name=stu_name;
                   reset_stu_no=stu_no;
                   reset_class_name=class_name;

                   document.getElementById("stu_id__").value(stu_id);
                   document.getElementById("stu_name__").value(stu_name);
                   document.getElementById("stu_no__").value(stu_no);
               }
            </script>
            <form id="resetForm" action="/SysOfStu_war_exploded/ResetStuServlet" onsubmit="return checkInput()"
                  method="get" accept-charset="UTF-8">
                <input type="text" id="stu_id__" name="stu_id">
                <label for="stu_name">姓名:</label>
                <input type="text" id="stu_name__" name="stu_name">

                <label for="stu_no">学号:</label>
                <input type="text" id="stu_no__" name="stu_no">

                <label for="class_name__">班级:</label>
                <select id="class_name__" name="class_name">
                </select>

                <input type="submit" value="完成" class="btn">
            </form>
        </section>
    </div>
</div>

</body>
</html>
