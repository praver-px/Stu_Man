package com.praver.sm.pojo;

public class Student {
    private int id;
    private Classes classes;
    private String name;
    private String username;
    private String password;
    private String sex;
    private Teacher teacher;
    private String remark;
    private int userType;

    public Student() {
    }

    public Student(int id, Classes classes, String name, String username, String password, String sex, Teacher teacher, String remark, int userType) {
        this.id = id;
        this.classes = classes;
        this.name = name;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.teacher = teacher;
        this.remark = remark;
        this.userType = userType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Classes getClasses() {
        return classes;
    }

    public void setClasses(Classes classes) {
        this.classes = classes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", classes=" + classes +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", teacher=" + teacher +
                ", remark='" + remark + '\'' +
                ", userType=" + userType +
                '}';
    }
}
