package stu.servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stu.entity.Stu_Class;
import stu.entity.Student;
import stu.interf.StuMapper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/ResetSubmitServlet")
public class ResetSubmitServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取需要修改的学生的id
        String stu_id = req.getParameter("stu_id");
        //获取ShowResetInput.jsp的form里的修改后的信息
        String stu_name = req.getParameter("stu_name");
        String stu_no = req.getParameter("stu_no");
        String class_name = req.getParameter("class_name");
        //根据id，修改数据库端的内容为上面获取到的信息
        String resource = "mybatis-cfg.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);

        SqlSession session = sqlSessionFactory.openSession();
        StuMapper mapper = session.getMapper(StuMapper.class);
        Student student = new Student(stu_id, stu_name, stu_no, mapper.selectClassId(class_name));
        mapper.updateStu(student);
        session.commit();
        //调用ShowAllStudentServlet,参数为空，以显示修改后的所有数据
        List<Stu_Class> result = session.selectList("mappers.Stumapper.selectAll");
        req.setAttribute("studentList", result);
        req.getRequestDispatcher("ShowResultStudent.jsp").forward(req, resp);

    }
}
