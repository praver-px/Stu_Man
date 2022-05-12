package com.praver.sm.pojo;

public class Course {

    private int id;
    private String name;
    private Teacher teacher;
    private String date;
    private String remark;

    public Course() {
    }

    public Course(int id, String name, Teacher teacher, String date, String remark) {
        this.id = id;
        this.name = name;
        this.teacher = teacher;
        this.date = date;
        this.remark = remark;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", teacher=" + teacher +
                ", date='" + date + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
