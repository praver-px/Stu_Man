package com.praver.sm.pojo;


public class Teacher {

    private int id;
    private String name;
    private String sex;
    private String username;
    private String password;
    private String mobile;
    private String remark;
    private int userType;
    private Grade grade;

    public Teacher() {
    }

    public Teacher(int id, String name, String sex, String username, String password, String mobile, String remark, int userType, Grade grade) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.username = username;
        this.password = password;
        this.mobile = mobile;
        this.remark = remark;
        this.userType = userType;
        this.grade = grade;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
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

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", mobile='" + mobile + '\'' +
                ", remark='" + remark + '\'' +
                ", userType=" + userType +
                ", grade=" + grade +
                '}';
    }
}
