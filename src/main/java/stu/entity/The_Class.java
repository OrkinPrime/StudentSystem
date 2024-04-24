package stu.entity;

public class The_Class {
    private String class_id;
    private String class_name;
    private String department;

    public The_Class() {
    }

    public The_Class(String class_id) {
        this.class_id = class_id;
    }

    public The_Class(String class_id, String class_name, String department) {
        this.class_id = class_id;
        this.class_name = class_name;
        this.department = department;
    }

    public String getClass_id() {
        return class_id;
    }

    public void setClass_id(String class_id) {
        this.class_id = class_id;
    }

    public String getClass_name() {
        return class_name;
    }

    public void setClass_name(String class_name) {
        this.class_name = class_name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
