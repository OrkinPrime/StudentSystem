package stu.servlet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stu.interf.StuMapper;

import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/SelectAllClassName")
public class SelectAllClassNameServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String resource = "mybatis-cfg.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        List<String> classList;
        try (SqlSession session = sqlSessionFactory.openSession()) {
            StuMapper mapper = session.getMapper(StuMapper.class);
            classList = mapper.selectAllClassName();
        }
        req.setAttribute("classList", classList);

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) {
            JsonObject jsonObject = Json.createObjectBuilder().add("classList", Json.createArrayBuilder(classList)).build();
            out.write(jsonObject.toString());
        }

    }
}
