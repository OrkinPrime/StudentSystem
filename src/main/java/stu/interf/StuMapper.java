package stu.interf;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import stu.entity.The_Class;
import stu.entity.Student;

import java.util.List;

public interface StuMapper {
        @Select("SELECT * FROM student WHERE stu_id = #{id}")
        Student selectStu(int id);
        @Insert("INSERT INTO student (stu_name, stu_no, class_id) VALUES (#{stu_name}, #{stu_no}, #{class_id})")
        int insertStudent(Student student);
        @Insert("INSERT INTO stu_class (class_name, department) VALUES (#{class_name}, null)")
        int insertClass(The_Class class_name);
        @Select("select class_id from stu_class where class_name=#{class_name} ")
        String selectClassId(String class_name);
        @Select("select class_name from  stu_class")
        List<String> selectAllClassName();
        @Delete("DELETE FROM student WHERE stu_id = #{stuId}")
        int deleteStuByID(int stu_id);
}
