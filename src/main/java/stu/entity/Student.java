package stu.entity;

public class Student {
    private String stu_id;
    private String stu_name;

    private String stu_no;
    private String class_id;

    public Student(String stu_name, String stu_no) {
        this.stu_name = stu_name;
        this.stu_no = stu_no;
    }

    public Student(String stu_name, String stu_no, String class_id) {
        this.stu_name = stu_name;
        this.stu_no = stu_no;
        this.class_id = class_id;
    }

    public Student(String stu_id) {
        this.stu_id = stu_id;
    }

    public Student(String stu_id, String stu_name, String stu_no, String class_id) {
        this.stu_id = stu_id;
        this.stu_name = stu_name;
        this.stu_no = stu_no;
        this.class_id = class_id;
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getStu_name() {
        return stu_name;
    }

    public void setStu_name(String stu_name) {
        this.stu_name = stu_name;
    }

    public String getStu_no() {
        return stu_no;
    }

    public void setStu_no(String stu_no) {
        this.stu_no = stu_no;
    }

    public String getClass_id() {
        return class_id;
    }

    public void setClass_id(String class_id) {
        this.class_id = class_id;
    }
}
