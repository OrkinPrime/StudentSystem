package stu.servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stu.entity.Stu_Class;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/SearchStuServlet")
public class SearchStuServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String stu_id = req.getParameter("stu_id");
        String stu_name = req.getParameter("stu_name");
        String stu_no = req.getParameter("stu_no");
        String class_name = req.getParameter("class_name");

        Map<String, Object> params = new HashMap<>();
        params.put("stu_id", stu_id);
        params.put("stu_name", stu_name);
        params.put("stu_no", stu_no);
        params.put("class_name", class_name);

        String resource = "mybatis-cfg.xml";
        InputStream iS;
        SqlSession sqlSession = null;
        iS = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSF = new SqlSessionFactoryBuilder().build(iS);
        sqlSession = sqlSF.openSession();
        if (stu_id == null && stu_name == null && stu_no == null && class_name == null) {
            List<Stu_Class> result = sqlSession.selectList("mappers.Stumapper.selectAll");
            req.setAttribute("studentList", result);
            req.getRequestDispatcher("ShowResultStudent.jsp").forward(req, res);
        } else {
            try {
                List<Stu_Class> result = sqlSession.selectList("mappers.Stumapper.searchstu", params);
                req.setAttribute("studentList", result);
                req.getRequestDispatcher("ShowResultStudent.jsp").forward(req, res);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (sqlSession != null) {
                    sqlSession.close();
                }
            }
        }
    }
}
