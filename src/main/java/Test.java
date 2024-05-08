import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stu.entity.Stu_Class;
import stu.entity.Student;
import stu.interf.StuMapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test{

    public static void main(String[] args) throws IOException {
/*        String resource = "mybatis-cfg.xml";
        InputStream inputStream = Resources.getResourceAsStream(resource);
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        StuMapper mapper = session.getMapper(StuMapper.class);

        String stu_name = "stu_name";
        String stu_no ="111";

        String class_name ="计223-1";
        mapper.selectClassId(class_name);
        String class_id=mapper.selectClassId(class_name);
        System.out.println(class_id);
        Student student = new Student(stu_name, stu_no,class_id);//获取到id后
        mapper.insertStudent(student);*/
    }
}
