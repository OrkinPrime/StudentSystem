package stu.servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
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

@WebServlet("/ResetStuServlet")
public class ResetStuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //获取需要修改的学生信息的id
        String stu_id = req.getParameter("stu_id");

        String stu_name = req.getParameter("stu_name");
        String stu_no=req.getParameter("stu_no");
        String class_name = req.getParameter("class_name");

        String resource = "mybatis-cfg.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        StuMapper mapper = session.getMapper(StuMapper.class);

        List<String> classlist = mapper.selectAllClassName();

        req.setAttribute("classnamelist", classlist);
        req.setAttribute("stu_id", stu_id);
        req.setAttribute("stu_name", stu_name);
        req.setAttribute("stu_no", stu_no);
        req.setAttribute("class_name", class_name);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/ShowResetInput.jsp");
        /*在Servlet中设置要传递的数据：在Servlet中创建一个HttpServletRequest对象，并将要传递的数据存储在其中，
        可以使用setAttribute()方法将数据存储在request对象中。
        使用RequestDispatcher进行转发：使用RequestDispatcher将请求转发到目标JSP页面。*/
        requestDispatcher.forward(req, resp);
        //获取数据库中class表内所有的class_name
        //转发给ShowResetInput.jsp，以生成select里的option
    }
}
