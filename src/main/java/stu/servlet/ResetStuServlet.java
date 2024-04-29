package stu.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ResetStuServlet")
public class ResetStuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //获取需要修改的学生信息的id
        String stu_id = req.getParameter("stu_id");

        //获取数据库中class表内所有的class_name
        //转发给ShowResetInput.jsp，以生成select里的option
    }
}
