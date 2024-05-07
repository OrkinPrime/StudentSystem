package stu.entity;

public class Stu_Class{

    private String stu_id;
    private String stu_name;
    private String stu_no;

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public void setStu_no(String stu_no) {
        this.stu_no = stu_no;
    }

    public void setClassInfo(The_Class classInfo) {
        this.classInfo = classInfo;
    }

    public String getStu_id() {
        return stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public String getStu_no() {
        return stu_no;
    }

    public The_Class getClassInfo() {

        return classInfo;
    }

    private The_Class classInfo;

}
