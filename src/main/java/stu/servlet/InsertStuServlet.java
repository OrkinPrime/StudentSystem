package stu.servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stu.entity.Stu_Class;
import stu.entity.Student;
import stu.interf.StuMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/InsertOneServlet")
public class InsertStuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String resource = "mybatis-cfg.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        StuMapper mapper = session.getMapper(StuMapper.class);

        String stu_name = req.getParameter("stu_name");
        String stu_no = req.getParameter("stu_no");
        String class_name = req.getParameter("class_name");

        String class_id=mapper.selectClassId(class_name);
        Student student = new Student(stu_name, stu_no,class_id);//获取到id后
        mapper.insertStudent(student);
        session.commit();

        List<Stu_Class> result = session.selectList("mappers.Stumapper.selectAll");

        req.setAttribute("studentList", result);
        req.getRequestDispatcher("ShowResultStudent.jsp").forward(req, resp);
    }
}
