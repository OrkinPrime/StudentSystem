package stu.interf;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import stu.entity.Student;

import java.util.List;

public interface StuMapper {
    @Insert("INSERT INTO student (stu_name, stu_no, class_id) VALUES (#{stu_name}, #{stu_no}, #{class_id})")
    int insertStudent(Student student);

    @Select("select class_id from stu_class where class_name=#{class_name} ")
    String selectClassId(String class_name);

    @Select("select class_name from  stu_class")
    List<String> selectAllClassName();

    @Delete("DELETE FROM student WHERE stu_id = #{stu_id}")
    int deleteStuByID(int stu_id);

    @Update("UPDATE student SET stu_no = #{stu_no},stu_name= #{stu_name},class_id=#{class_id} WHERE (stu_id = #{stu_id})")
    int updateStu(Student student);
}
