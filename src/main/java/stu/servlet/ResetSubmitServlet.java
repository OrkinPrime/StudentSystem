package stu.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ResetSubmitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取需要修改的学生的id
        String stu_id = req.getParameter("stu_id");

        //获取ShowResetInput.jsp的form里的修改后的信息
        String stu_name = req.getParameter("stu_name");
        String stu_no = req.getParameter("stu_no");

        //根据id，修改数据库端的内容为上面获取到的信息

        String class_name = req.getParameter("class_name");
        //根据class_name，修改学生信息中对应的class_id

        //调用ShowAllStudentServlet,参数为空，以显示修改后的所有数据
    }
}
